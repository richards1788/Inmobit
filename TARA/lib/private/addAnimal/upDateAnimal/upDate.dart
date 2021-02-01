import 'package:flutter/material.dart';

class UpDateAnimal extends StatefulWidget {
  final String title;
  final String image;
  final String text;
  final String id;
  UpDateAnimal({
    Key key, 
    this.title, 
    this.image, 
    this.text,
    this.id
    }) : super(key: key);

  @override
  _UpDateAnimalState createState() => _UpDateAnimalState();
}

class _UpDateAnimalState extends State<UpDateAnimal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          //height: size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 250,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              Text(widget.id),
            ],
          ),
        ),
      ),
    );
  }
}
