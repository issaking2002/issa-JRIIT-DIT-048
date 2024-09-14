import 'package:dart_and_mysql/UserRegister.dart';
import 'dbConnection.dart';
import 'dart:io';
import 'dart:async';

Future userDetails() async {
  var connection = await dbConnect();
  print('\n');
  print("***** Welcome to view your Academic details *****\n");

  stdout.write("Enter username: ");
  var usernameL = stdin.readLineSync();

  var usernamedb = await connection.query('SELECT username FROM users');
  var usernamedbList = [];
  for (var usernamedb2 in usernamedb) {
    usernamedbList.add(usernamedb2.first.toString());
  }

  stdout.write("Enter password: ");
  stdin.echoMode = true;
  var passwordL = stdin.readLineSync().hashCode;
  stdin.echoMode = true;
  print('\n');
  var passworddb = await connection
      .query('SELECT password FROM users WHERE username = ?', [usernameL]);
  var passworddbList = passworddb.toList()[0][0];

  if (usernamedbList.contains(usernameL)) {
    if (passwordL.toString() == passworddbList.toString()) {
      print("Press [1] To view Academic Detais: ");
      var userchoice = int.parse(stdin.readLineSync()!);

      if (userchoice == 1) {
        var dbuserDetails = await connection.query(
            'SELECT f_name,m_name,l_name,gender,pr_school,sec_school,unversity_school,st_ID FROM users WHERE username = ?',
            [usernameL]);
        var dbuserDetailsList = [];
        for (var dbuserDetails2 in dbuserDetails) {
          dbuserDetailsList.add(dbuserDetails2[0]);
          dbuserDetailsList.add(dbuserDetails2[1]);
          dbuserDetailsList.add(dbuserDetails2[2]);
          dbuserDetailsList.add(dbuserDetails2[3]);
          dbuserDetailsList.add(dbuserDetails2[4]);
          dbuserDetailsList.add(dbuserDetails2[5]);
          dbuserDetailsList.add(dbuserDetails2[6]);
          dbuserDetailsList.add(dbuserDetails2[7]);
          print(
              "Your Academic Details are\n1. Firstname: ${dbuserDetailsList[0]}\n2. Middlename: ${dbuserDetailsList[1]}\n3. Lastname: ${dbuserDetailsList[2]}\n4. Gender: ${dbuserDetailsList[3]}\n5. Primary School: ${dbuserDetailsList[6]}\n6. Secondary SChool: ${dbuserDetailsList[5]}\n7. Unversity School: ${dbuserDetailsList[4]}\n8. Student ID: ${dbuserDetailsList[7]}");

          print('\n');
          print('*****  Welcome again $usernameL in our System  *****');
          stdout.write('Press [1] To View Again \nPress [2] To Exit: ');
          var end = int.parse(stdin.readLineSync()!);
          if (end == 1) {
            userDetails();
          } else {
            exit(0);
          }
        }
      }else{
        print('Invald choice');
      }
    } else {
      print('Invald Username');
      stdout.write('Press [1] to Register again \nPress [0] to Exit: ');
      var reg = int.parse(stdin.readLineSync()!);
      if (reg == 1) {
        userRegister();
      } else {
        exit(0);
      }
    }
  }else {
      print('Invald Username');
      stdout.write('Press [1] to Register again \nPress [0] to Exit: ');
      var reg = int.parse(stdin.readLineSync()!);
      if (reg == 1) {
        userRegister();
      } else {
        exit(0);
      }
    }
}
