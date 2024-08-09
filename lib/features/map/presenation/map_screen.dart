import 'package:flutter/material.dart';

class Map extends StatelessWidget {
   Map({super.key,  required this.categoryName});
int id =1;
String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
           Navigator.pushNamed(context, '/BicyclesFromCategorey' ,arguments:[ id,categoryName] );

        },
        child: Container(
          child: Text("press me"),
        ),
      ),
    );
  }
}