import 'package:flutter/material.dart';
import 'package:notes_app/cubits/notes_cubit/cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

// ignore: must_be_immutable
class NotesItem extends StatelessWidget {
   NotesItem({super.key,this.model});
NoteModel? model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNoteView(
                model: model!,
              ),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(model!.color),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                bottom: 24,
                top: 24,
              ),
              child: ListTile(
                title:  Text(
                  model!.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    model!.subTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 18,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: ()
                  {
                    model!.delete();
                    NotesCubit.get(context).fetchNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 34,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 24,
                bottom: 24,
              ),
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Text(
                  model!.date,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
