import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iotools/bloc/room/room_bloc.dart';
import 'package:iotools/bloc/user/user_bloc.dart';
import 'package:iotools/core/service/auth_service.dart';
import 'package:iotools/core/theme/fonts.dart';
import 'package:iotools/data/model/room/room.dart';
import 'package:iotools/presentation/shared/iot_input_field.dart';
import 'package:iotools/presentation/shared/primary_button.dart';

@RoutePage()
class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({super.key});

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  int? selectedOwnerId;
  late UserBloc userBloc;
  late RoomBloc roomBloc;

  @override
  void initState() {
    userBloc = context.read<UserBloc>();
    roomBloc = context.read<RoomBloc>();

    userBloc.add(GetUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<RoomBloc, RoomState>(
      bloc: roomBloc,
      listener: (context, state) {
        if (state is RoomCreated) {
          context.router.back();
        } else if (state is RoomLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator.adaptive());
            },
            barrierDismissible: true,
          );
        } else {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Добавить комнату",
            style: AppFonts.getTextMedium(size: 20),
          ),
          backgroundColor: theme.colorScheme.surface,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Название комнаты", style: AppFonts.getTextMedium(size: 16)),
              const SizedBox(height: 8),
              InputField(controller: _nameController, text: "Введите название"),
              const SizedBox(height: 20),

              Text(
                "Выберите ответственного",
                style: AppFonts.getTextMedium(size: 16),
              ),
              const SizedBox(height: 8),
              OwnerSelector(
                userBloc: userBloc,
                onSelected: (ownerId) {
                  setState(() => selectedOwnerId = ownerId);
                },
              ),

              const Spacer(),
              PrimaryButton(
                text: "Создать",
                onPressed: () async {
                  if (selectedOwnerId != null &&
                      _nameController.text.isNotEmpty) {
                    final companyId = await AuthService().companyId as int;
                    final newRoom = Room(
                      name: _nameController.text,
                      companyId: companyId,
                      ownerId: selectedOwnerId!,
                    );
                    roomBloc.add(CreateRoom(room: newRoom));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OwnerSelector extends StatefulWidget {
  final Function(int) onSelected;
  final UserBloc userBloc;

  const OwnerSelector({
    super.key,
    required this.onSelected,
    required this.userBloc,
  });

  @override
  State<OwnerSelector> createState() => _OwnerSelectorState();
}

class _OwnerSelectorState extends State<OwnerSelector> {
  int? selectedOwnerId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<UserBloc, UserState>(
      bloc: widget.userBloc,
      builder: (context, state) {
        if (state is UsersLoaded) {
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                state.users.map((user) {
                  final isSelected = user.id == selectedOwnerId;
                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedOwnerId = user.id);
                      widget.onSelected(user.id!);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        user.name!,
                        style: AppFonts.getTextMedium(
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          );
        } else if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text("Ошибка загрузки пользователей"));
        }
      },
    );
  }
}
