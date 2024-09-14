import 'package:mysql1/mysql1.dart';
import 'UserRegister.dart';
import 'admin.dart';
import 'login.dart';
import 'AcademicDetails.dart';
import 'ResetPassword.dart';
import 'dart:io';
void main() async {
  print("****** Welcom to Our Page ******");
  print("");
  print("***** Select option You want below ******");
  print("****** 1. Login                  ******");
  print("****** 2. Register               ******");
  print("****** 3. Reset Password         ******");
  print('****** 4. Academic & Personal Details');
  stdout.write(
      "Press [1] to Login \nPress [2] to register  \nPress [3] To  resert  Password \nPress [4] to See Academic Details: ");
  var userSelection = int.parse(stdin.readLineSync()!);
  if (userSelection == 1) {
    print("SElect Option Below");
    print("1. Normal User");
    print("2. Mkuu");
    stdout.write("press 1 or 2: ");
    var loginRole = int.parse(stdin.readLineSync()!);
    if (loginRole == 1) {
      login();
    } else if (loginRole == 2) {
      adminLogin();
    }
  } else if (userSelection == 2) {
    userRegister();
  } else if (userSelection == 3) {
    resertPassword();
  }else if(userSelection == 4){
    userDetails();
  }
}
