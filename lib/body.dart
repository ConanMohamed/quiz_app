import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBody extends StatelessWidget {
  const HomeBody(this.switchScreen,{super.key});

 final Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Colors.white.withOpacity(1),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'Learn Flutter!',
            style: GoogleFonts.lato(
                fontSize: 24, color: Colors.white.withOpacity(0.8)),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_forward_outlined),
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.black),
              onPressed: switchScreen,
              label: const Text('Start Quiz'))
        ],
      ),
    );
  }
}
