import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class EmptyTaskScreen extends StatelessWidget {
  const EmptyTaskScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage(
                   'assets/todo.png'
                  ),
                  fit: BoxFit.cover,
                ),
             ),
           ),
            Padding(
              padding: const EdgeInsets.only(top: 400.0, left: 95, right: 90),
              child: Text(
                'Time Management',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 430.0, left: 40),
              child: Text(
                'Manajemen waktu dapat menguntungkan \nAnda dalam kehidupan yang baik',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}