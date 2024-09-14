import 'AcademicDetails.dart';
import 'dart:io';
import 'dbConnection.dart';

Future login() async {
  var conn = await dbConnect();
  print("===  Welcome to Our Login Page  ===\n");
  print("===  Please Authorize your Identity ===\n");
 
  stdout.write("Enter your username: ");
  var userUsername = stdin.readLineSync();

  stdout.write("Enter your password: ");
  stdin.echoMode = false;
  var userPassword = stdin.readLineSync();
  stdin.echoMode = true;
  print("");
  var dbUsernames = await conn.query("SELECT username FROM users");
  var userList = [];
  for (var user in dbUsernames) {
    userList.add(user.first.toString());
  }

  if (userList.contains(userUsername)) {
    var uUsername = userUsername;

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
    if (realPassword.toString() == userPassword.hashCode.toString()) {
      print("welcome ${names[0]} ${names[1]}");
      await conn.close();
    }
  } else {
    print("incorrect password or username");
  }
  await conn.close();
}

// import 'dart:io';

// import 'package:dart_and_mysql/dbConnection.dart';

// Future login() async{
//   var conn = await dbConnect();
//   print('***** hello welcome to login ******');

//   stdout.write('Enter username: ');
//   var userUsername = stdin.readLineSync();
//   print('');

//   stdout.write('Enter id: ');
//   var userPassword = stdin.readLineSync();

//   var dbUsernames = await conn.query('select username from data');
//   var userList=[];
//   for(var user in dbUsernames){
//     userList.add(user.first.hashCode);
//   }

//   if(userList.contains(userUsername)){
//     var uUsername = userUsername;

//     var dbPassword = await conn.query('select id from data where username=?',[uUsername]);
//     var names = [];
//     var dbNames = await conn.query('select *from data where username =?',[uUsername]);
//     for(var name in dbNames){
//       names.add(name[0].toString());
//       names.add(name[1].toString());
//     }

//     var realPassword = dbPassword.toList()[0][0];
//     if(realPassword.toString() == userPassword.hashCode.toString()){
//       print('welcome ${names[0]} here');
//     }else{
//       print('wrong password');
//     }
//   }else{
//     print('invald usrname');
//   }
//   await conn.close();
// }











