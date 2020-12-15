import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class FoundedCard extends StatelessWidget {

  final String title;
  final String location;
  final Image image;
  bool hideEmail;
  bool hidePhone;

  FoundedCard({this.title, this.location, this.image,this.hideEmail, this.hidePhone});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SizedBox(
        height: double.infinity,
        child: Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.2,
                // padding: EdgeInsets.only(top: 10),
                child: image,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 5, right: 1),
                child: Text(
                  'título: $title',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:10,left: 5, right: 1),
                child: Text('localização: $location', style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
              ), Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    Switch(
                        value: hideEmail,
                        onChanged: (value){
                          hideEmail = value;
                        },
                      activeColor: Colors.yellow,

                    ),
                    Icon(
                        Icons.phone,
                      color: Colors.grey,
                    ),
                    Switch(
                      value: hidePhone,
                      onChanged: (value){
                        hidePhone = value;
                      },
                      activeColor: Colors.yellow,

                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
