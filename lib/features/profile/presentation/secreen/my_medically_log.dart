import 'package:flutter/material.dart';

class MyMedicallyLog extends StatelessWidget {
  const MyMedicallyLog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: medicallyLogItem(),
    );
  }

  medicallyLogItem() {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text("Doctor Name:  Opada Aljondi"),
            trailing: Text(DateTime.now().toString()),
          ),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
          ListTile(
            title: Text("Opada Aljondi"),
            subtitle: Text("i have jjkd kb, kkdllm jjdkll"),
            trailing: Text(DateTime.now().toString()),
          ),ListTile(
            title: Text("Dmf"),
            subtitle: Text("i have jjkd kb, kkdllm jjdkll"),
            trailing: Text(DateTime.now().toString()),
          ),ListTile(
            title: Text("Doctor Name:  Opada Aljondi"),
            subtitle: Text("i have jjkd kb, kkdllm jjdkll"),
            trailing: Text(DateTime.now().toString()),
          ),
        ],
      ),
    );
  }
}
