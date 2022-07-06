import 'package:flutter/material.dart';

import '../data/users.dart';
import '../services/api_services.dart';
User result=User('','',0,'');
class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('User Access', style: TextStyle(color: Colors.blue),),),
      body: Column(
        children: [
          ElevatedButton(onPressed: getData, child: Text('Get Data')),
          Text(result.FirstName + ' '+ result.LastName + ' ' + result.Email)
        ],
      ),
    );
  }

  Future getData() async {
    UserHelper helper = UserHelper();
    result = await helper.getUsers();
    setState((){
    });
  }

}

