import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/provider.dart';
import 'package:my_diary/screens/ans_one/ans_one_screen.dart';
import 'package:my_diary/screens/ans_two/ans_two_screen.dart';
import 'package:my_diary/utils/utility.dart';
import 'package:provider/provider.dart';

import '../screens/welcome/welcome_screen.dart';

class Sidebar extends ConsumerWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ap = ref.watch(userProvider);
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 75.0, left: 14.0, bottom: 40),
            child: Text("My Diary",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: GrayColor.color10)),
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(ap.userModel.profilePic),
          ),
          Text(
            ap.userModel.name,
            style: TextStyle(fontSize: 15, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          ListItem(
            title: "Ans Question One",
            icon: Icons.question_answer,
            onPressed: () => {
              Navigator.of(context).push(
                navigateRoute(
                  context,
                  const AnsQuestionOneScreen(),
                ),
              )
            },
          ),
          ListItem(
            title: "Ans Question Two",
            icon: Icons.question_answer,
            onPressed: () => {
              Navigator.of(context).push(
                navigateRoute(
                  context,
                  const AnswerTwoScreen(),
                ),
              )
            },
          ),
          SizedBox(
            height: 20,
          ),
          IconButton(
            onPressed: () {
              ref.read(userProvider.notifier).userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                    ),
                  );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final VoidCallback? onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 10,
      minLeadingWidth: 0,
      title: Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: GrayColor.color10)),
      leading: Icon(
        icon,
        size: 26,
        color: GrayColor.color10,
      ),
      onTap: onPressed,
    );
  }
}
