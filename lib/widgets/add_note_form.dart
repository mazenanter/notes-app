import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/states.dart';
import 'package:notes_app/cubits/notes_cubit/cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
   String? title;
   String? content;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children:
        [
          CustomTextField(
            controller:titleController ,
          onChanged: (value)
          {
            title =value;
          },
            hintText: 'title',
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: contentController,
           onChanged: (p0) {
             content=p0;
           },
            hintText: 'content',
            maxLines: 5,
          ),
          SizedBox(
            height: 20,
          ),
          ColorListView(),
          Spacer(),
          BlocBuilder<AddNoteCubit,AddNoteStates>(
            builder: (context, state) {
              return  CustomButton(
              isLoading: state is AddNoteLoadingState ?true:false,
              onTap: () {
              if (formKey.currentState!.validate()) {
                var date=DateTime.now();
                var formatted = DateFormat().add_yMMMd().format(date);
              formKey.currentState!.save();
              var model = NoteModel(
              title: titleController.text,
              subTitle: contentController.text,
              color: Colors.green.value,
              date: formatted,
              );
              AddNoteCubit.get(context).addNote(model);
              NotesCubit.get(context).fetchNotes();
              } else {
              autovalidateMode = AutovalidateMode.always;
              setState(() {

              });
              }
              },
              );
            },

          ),
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
final bool isActive;
final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive ? CircleAvatar(
      radius: 38,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 35,
        backgroundColor:color,
      ),
    )
      : CircleAvatar(
        radius: 38,
        backgroundColor: color,
      );
  }
}
class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex=0;
  List<Color>colors =[
    Color(0xffA7C6DA),
    Color(0xffEEFCCE),
    Color(0xff9EB25D),
    Color(0xffF1DB4B),
    Color(0xffEDFF71),


  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38*2,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: ()
            {
              currentIndex = index;
              AddNoteCubit.get(context).color=colors[index];
              setState(() {

              });
            },
            child: ColorItem(
              color: colors[index],
              isActive: currentIndex == index,
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
          itemCount: colors.length,

      ),
    );
  }
}


