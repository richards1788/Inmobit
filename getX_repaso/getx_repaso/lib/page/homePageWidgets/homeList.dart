import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_repaso/contollers/homeControllers.dart';
import 'package:getx_repaso/model/user.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'users',
      builder: (_) {
        if(_.loading){
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final User user= _.users[index];
            return ListTile(
              title: Text(user.firstName),
              subtitle: Text(user.email),
              onTap: ()=>_.showUserProfile(user),
            );
          },
          itemCount: _.users.length,
        );
      },
    );
  }
}
