import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/cubits/add_note_cubit/states.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteStates>
{
  AddNoteCubit():super(AddNoteInitialState());
  static AddNoteCubit get(context)=>BlocProvider.of(context);

  Color color = const Color(0xffA7C6DA);
  void addNote(NoteModel model)async
  {
    model.color = color.value;
    emit(AddNoteLoadingState());
    
   var notesBox =Hive.box<NoteModel>(kNotesBox);
  await notesBox.add(model).then((value)
  {
    emit(AddNoteSuccessState());
  }).catchError((e)
  {
    emit(AddNoteFailureState(e.toString()));
  });
  }
}