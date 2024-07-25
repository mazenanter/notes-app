import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/cubits/notes_cubit/states.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constans.dart';

class NotesCubit extends Cubit<NotesStates>
{

  NotesCubit():super(NotesInitialState());
 static NotesCubit get(context)=>BlocProvider.of(context);
 List<NoteModel>notesList=[];
 fetchNotes()
 {
   try
   {
     var notesBox =Hive.box<NoteModel>(kNotesBox);
     notesList=notesBox.values.toList();

     emit(NotesSuccessState());
   }catch(e)
   {
     // ignore: avoid_print
     print(e.toString());
     emit(NotesErrorState(e.toString()));
   }

 }
}