import 'package:flutter/material.dart';

class genLoginSignupHeader extends StatelessWidget {
  String headerName;

  genLoginSignupHeader(this.headerName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30.0),
          Text(
            headerName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25.0),),
          SizedBox(height: 10.0),
          Image.asset("assets/images/logo.jpg",
            height: 120.0,
            width: 120.0,),
          SizedBox(height: 10.0),
          Text('Habitude', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black38,
              fontSize: 20.0),
          ),
          SizedBox(height: 10.0),

        ],
      ),
    );
  }
}
