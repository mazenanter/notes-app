import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(
                icon: Icons.search,
                text: 'Notes',
              ),
              SizedBox(
                height: 20,
              ),
              NotesListView(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            //isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            context: context,
            builder: (context)
            {
              return AddNote();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

