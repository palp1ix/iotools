import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iotools/bloc/room/room_bloc.dart';
import 'package:iotools/core/router/router.gr.dart';
import 'package:iotools/core/theme/fonts.dart';

@RoutePage()
class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  late RoomBloc roomBloc;

  @override
  void initState() {
    roomBloc = context.read<RoomBloc>();
    roomBloc.add(GetRooms());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<RoomBloc, RoomState>(
      listener: (context, state) {
        if (state is RoomCreated) {
          roomBloc.add(GetRooms());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: theme.colorScheme.surface,
        ),
        body: BlocBuilder<RoomBloc, RoomState>(
          bloc: roomBloc,
          builder: (context, state) {
            if (state is RoomLoaded) {
              state.rooms;
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      state.rooms.map((room) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                room.name,
                                style: AppFonts.getTextMedium(size: 18),
                              ),
                              Text(room.ownerId.toString()),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            } else if (state is RoomLoading) {
              return Center(child: CircularProgressIndicator.adaptive());
            } else {
              return Center(child: Text("Error"));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(AddRoomRoute());
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
