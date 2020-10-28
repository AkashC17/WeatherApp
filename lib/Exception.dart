import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Exception extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Sorry, we couldn't process your ",
                  style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.black45)),
                ),
                Text(
                    "request at the moment",
                  style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.black45)),
                ),
                SizedBox(height: 10,),
                Text(
                  "Check your Internet connection",
                  style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 17,color: Colors.black45)),
                ),
                Icon(Icons.network_check,color: Colors.black45,size: 30,)
              ],
            ),
          ),
        )
      ),
    );
  }
}
