import 'AcademicDetails.dart';
import 'login.dart';
import 'dart:async';
import 'dart:io';
import 'dbConnection.dart';

Future userRegister() async{
  
  var conn = await dbConnect();
  print("***** WELCOME TO OUR REGISTRATION *****\n");

  print("");

  stdout.write("1. Enter your first name: ");
  var f_name = stdin.readLineSync();

  stdout.write("2. Enter your middle name: ");
  var m_name = stdin.readLineSync();

  stdout.write("3. Enter your last name: ");
  var l_name = stdin.readLineSync();
  print("***** Select Your Gender *****\n");
  print("***** 1. Male            *****");
  print("***** 2. Female          *****");
  stdout.write("press [1] for Male or  [2] for Female: ");
  var user_gender = stdin.readLineSync();
  var gender;
  if (user_gender == "1")  {
    gender = "MALE";
  } else if (user_gender == "2") {
    gender = "FEMALE";
  }

  stdout.write("4. Enter your username: ");
  var username = stdin.readLineSync();

  stdout.write("5. Enter your password: ");
  //stdin.echoMode = false;
  var password = stdin.readLineSync().hashCode;
  stdin.echoMode = true;
  print("");
  stdout.write("5. Enter your password to verify: ");
  //stdin.echoMode = false;
  var verPassword = stdin.readLineSync().hashCode;
  stdin.echoMode = true;
  print("");
  stdout.write("6. Enter your country: ");
  var country= stdin.readLineSync();

  stdout.write("8. Enter your Student_ID: ");
  var st_ID = stdin.readLineSync();

  stdout.write("1. Enter your primary school: ");
  var unversity_school = stdin.readLineSync();

  stdout.write("9. Enter your secondary school: ");
  var sec_school = stdin.readLineSync();

  stdout.write("7. Enter university_school: ");
  var pr_school= stdin.readLineSync();


  var role = "kawaida";
  
  var pasword;
  if (password == verPassword) {
    pasword = verPassword;
    var user_data_insert = await conn.query(
      'insert into users values(?,?,?,?,?,?,?,?,?,?,?,?)',
      [f_name,m_name, l_name, gender,country,pr_school,sec_school,unversity_school,st_ID,username,pasword,role]);
  await conn.close();
    print("Thank you $f_name for using our registration menu");
    print("***** Already You are successfuly registered *****");
    print(" ______________________________________ ");
    print("#______________________________________#");
    print("Select Option below: ");
    print("1. Yes");
    print("2. No");

    stdout.write("Press [1] to login \nPress [2] tosee  Academic Details \nPress [0] to Exit: ");
    var userAcception = int.parse(stdin.readLineSync()!);
    if (userAcception == 1) {
      login();
    }else if(userAcception == 2){
      userDetails();
    }else{
      exit(0);
    }
  } else {
    print("Password did not match try again later");
    exit(0);
  }
  
}
