import 'package:flutter/material.dart';
import 'package:notes_app/cubits/notes_cubit/cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class EditNoteView extends StatefulWidget {
   EditNoteView({super.key, required this.model});
 NoteModel model;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
TextEditingController titleController = TextEditingController();
TextEditingController contentController = TextEditingController();


String?title;
String? content;

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.model.title;
    contentController.text = widget.model.subTitle;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children:
            [
              CustomAppBar(
                onPressed: ()
                {
                  widget.model.title = title ?? widget.model.title;
                  widget.model.subTitle= content ??widget.model.subTitle;
                  NotesCubit.get(context).fetchNotes();
                  widget.model.save();
                  Navigator.pop(context);
                },
                text: 'Edit Note',
                icon: Icons.done,
              ),
              SizedBox(
                height: 32,
              ),
              CustomTextField(
                controller: titleController,
                onChanged: (p0) {
                  title =p0;
                },
                hintText: 'title',
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: contentController,
               onChanged: (p0) {
                 content=p0;
               },
                hintText: 'content',
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
