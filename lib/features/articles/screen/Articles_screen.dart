import 'package:flutter/material.dart';
import 'package:med_dos/core/utils/app_assets.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(15),
          itemBuilder: (_, ctx) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 160,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 15, offset: Offset(3, 2))
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                    child: ListTile(

                      title: Text(
                        "Opada Aljondi",
                        style: TextStyle(fontSize: 14),
                      ),trailing:
                      Container(
                        height: 80,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(
                                  AppAssets.logoIm
                                ),
                                fit: BoxFit.cover)),
                      ),

                      subtitle: Text(
                        "MY 12:1 PM",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ),
                  ),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Hello , My Name is ieidjfef iofjenf \nHello , My  iofjenf ",
                            style: TextStyle(fontSize: 15,color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),



                ],
              ),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
