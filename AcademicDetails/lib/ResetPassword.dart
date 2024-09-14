import 'dart:io';
import 'dbConnection.dart';
import 'UserRegister.dart';
import 'login.dart';

Future resertPassword() async{
  print('****** Resert Password now ******\n');
  var connection = await dbConnect();
  stdout.write("\nEnter Your first Name: ");
  var resetName = stdin.readLineSync();

  var fnameresetdb = await connection.query('SELECT f_name FROM users');
  var fnameresetList = [];
  for (var fnameresetdb1 in fnameresetdb){
    fnameresetList.add(fnameresetdb1.first.toString());
 }
  var lnameresetdb = await connection.query('SELECT l_name FROM users where f_name = ?',[resetName]);
  var lnameresetList = [];
  for (var lnameresetdb1 in lnameresetdb){
    lnameresetList.add(lnameresetdb1.first.toString());
  }


  if (fnameresetList.contains(resetName)){
  
    stdout.write("Enter Your last Name: ");
    var lnamereset = stdin.readLineSync();

    if(lnameresetList.contains(lnamereset)){
      
      var usernamedb = await connection.query("SELECT username FROM users WHERE l_name = ?",[lnamereset]);
      var usernameList = [];
      for (var usernamedb1 in usernamedb){
        usernameList.add(usernamedb1.first.toString());

        print("$usernameList This was your account Username? Press\n1. YES\n2. NO: ");
        var userchoice = stdin.readLineSync();
        if (userchoice == "1"){

          stdout.write("Enter new password: ");
          //stdin.echoMode = false;
          var passwordreset = stdin.readLineSync();
         // stdin.echoMode = true;

          stdout.write("Verify your Password: ");
         // stdin.echoMode = false;
          var passwordreset2= stdin.readLineSync();
          //stdin.echoMode = true;  

          if (passwordreset2 == passwordreset){
           var passReset = await connection.query('UPDATE users SET password = ? WHERE l_name = ?',[passwordreset2,lnamereset]);
           print("Hello $resetName You are already succesfully reset Your Password. \nSelect option below \n1. Log in \n2. Exit: ");
           var userchoice5 = stdin.readLineSync();

           if (userchoice5 == "1"){
              login();
           }
           else if (userchoice5 == "2"){
            print("****** Thank $resetName you to Visit Our Page ******");
           }
           else{
            print("Enter invalid Choice");
           } 
          }
          else{
            print("Password did not match please try again");
          } 
        }
        else if (userchoice == "2"){
          print("Thank you $resetName to Visit Our Page");
        }
        else{
          print("Enter invalid Choice");
        }
      }
    }
    else{
      print("\nName Does Not Exist, Select Option  Below\n1. YES\n2. NO: ");
      var userchoice4 = stdin.readLineSync();
      if (userchoice4 == "1"){
        userRegister();
      }
      else if (userchoice4 == "2"){
        print("Thank you $resetName to Visit Our Page");
      }
      else{
        print("Enter invalid Choice");
      }
    }
  }
  else{
    print("\nName Does Not Exist, Select Option  Below\n1. YES\n2. NO: ");
    var userchoice4 = stdin.readLineSync();
    if (userchoice4 == "1"){
      userRegister();
    }
    else{
      print("Thank you resetName  to Visit Our Page");
    }
  }
  await connection.close();
} 