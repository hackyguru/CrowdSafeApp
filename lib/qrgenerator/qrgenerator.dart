import 'package:flutter/material.dart';
import 'package:googlemapscroll/auth/sign_in.dart';
import 'package:googlemapscroll/introscreen.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QRGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
      body:
      
      Stack(
        children: [
            Column(
              children: [
                SizedBox(height:100),
                Align(alignment: Alignment.topCenter,
                child: Text('Contact-less QR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24, 
                  fontWeight: FontWeight.bold
                ),),),

              SizedBox(height: 10),

                Align(alignment: Alignment.topCenter,
                child: Text('Scan this QR for safe and contact-less checkin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),),),
              
              SizedBox(height:410),
              Text('Note : This QR code contains your contact',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),),

              Text('information required for contact tracing.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),),

              SizedBox(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text('Do you own an organization?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                    onPressed: () => {
                      
                         Alert(
      context: context,
      title: "Get In Touch",
      desc: "Please get in touch with us at contact@crowdsafe.tech",
      buttons: [
        DialogButton(
          color: Colors.black.withOpacity(0.6),
          child: Text(
            "Go back",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show()

                    }),

                  SizedBox(width: 20),

                    RaisedButton(
                    child: Text('How to use?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,

                    ),),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                    onPressed: () => {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Intro()),
                      )
                    })
                ]
              )



              ] 
            ),

        Center(
          child: Container(
          width: 330,
          height: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [new BoxShadow(
            color: Colors.black,
            blurRadius: 20.0,
          ),
             ] ),
          ),
        ),
        Center(
            child: PrettyQr(
                image: AssetImage('assets/corona.png'),
                typeNumber: 3,
                elementColor: Colors.black,
                size: 300,
                data: "name:"+name+"email:"+email,
                roundEdges: true)
      ),


        ]
      ),
    );
  }     
 
  }