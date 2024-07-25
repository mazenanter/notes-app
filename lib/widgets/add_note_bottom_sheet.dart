import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/states.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 32,
          ),
          child: BlocConsumer<AddNoteCubit, AddNoteStates>(
            listener: (context, state) {
              if (state is AddNoteSuccessState) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return const AddNoteForm();
            },
          ),
        ));
  }
}
