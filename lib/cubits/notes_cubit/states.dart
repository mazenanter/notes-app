
abstract class NotesStates {}

class NotesInitialState extends NotesStates {}

class NotesSuccessState extends NotesStates
{

}

class NotesErrorState extends NotesStates
{
  final String err;

  NotesErrorState(this.err);

}
