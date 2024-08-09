import 'package:flutter/material.dart';
class CategoryArguments {
  final String categoryName;
  final int hubId;

  CategoryArguments({required this.categoryName, required this.hubId});
}

class Map extends StatelessWidget {
   Map({super.key,  required this.categoryName});
int id =1;
String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){

           Navigator.pushNamed(context, '/BicyclesFromCategorey' ,arguments:  CategoryArguments(categoryName: categoryName, hubId: id) );

        },
        child: Container(
          height: 500,
          color: Colors.red,
          child: Text("press me"),
        ),
      ),
    );
  }
}