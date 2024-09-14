import 'dart:io';
import 'package:dart_and_mysql/mkuu.dart';

import 'dbConnection.dart';

import 'UserRegister.dart';
import 'login.dart';
import 'dart:async';

Future adminLogin() async {
  var conn = await dbConnect();
  print("# Welcome to Admin Panel  #");
  print("");
  print("Please Authorize your Administrative Identity");
  print("");
  stdout.write("Enter Your Username: ");
  var userUsername = stdin.readLineSync();

  stdout.write("Enter Your Password: ");
  stdin.echoMode = false;
  var userPassword = stdin.readLineSync();
  stdin.echoMode = true;
  // Extracting Username from DB
  var dbUsernames = await conn.query("SELECT username FROM users");
  var userList = [];
  for (var user in dbUsernames) {
    userList.add(user.first.toString());
  }
  // for (var username in userList) {
  //   username = username.toString();
  if (userList.contains(userUsername)) {
    var uUsername = userUsername;
// Extractin UserPassword from DB
    var dbPassword = await conn
        .query("SELECT password FROM users WHERE username=?", [uUsername]);
    var names = [];
    var dbNames =
        await conn.query("select * from users where username=?", [uUsername]);

    for (var name in dbNames.toList()) {
      names.add(name[0].toString());
      names.add(name[1].toString());
    }
    var realPassword = dbPassword.toList()[0][0];

// Extracting User Role from DB
    var dbRole = await conn
        .query("SELECT role FROM users WHERE username=?", [uUsername]);
    var roles = [];
    var dbRoles =
        await conn.query("select * from users where username=?", [uUsername]);

    for (var role in dbRoles.toList()) {
      names.add(role[0].toString());
      names.add(role[1].toString());
    }
    var realRole = dbRole.toList()[0][0];

//Verifying User Identity from details above
    if (realPassword.toString() == userPassword.hashCode.toString() &&
        realRole == "mkuu") {
          print("");
      print("welcome ${names[0]} ${names[1]}");
      mkuu();
    }
  } else {
    print("Wewe sio Mkuu");
  }

}
