abstract class AddNoteStates{}

class AddNoteInitialState extends AddNoteStates{}

class AddNoteLoadingState extends AddNoteStates{}


class AddNoteSuccessState extends AddNoteStates{}


class AddNoteFailureState extends AddNoteStates
{
  final String errorMessage;

  AddNoteFailureState(this.errorMessage);
}
