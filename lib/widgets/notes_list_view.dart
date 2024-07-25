import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/cubit.dart';
import 'package:notes_app/cubits/notes_cubit/states.dart';
import 'package:notes_app/widgets/notes_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit,NotesStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
       var list=  NotesCubit.get(context).notesList;
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => NotesItem(
              model:list[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: list.length,
          ),
        );
      },

    );
  }
}
