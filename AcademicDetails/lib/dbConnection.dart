import 'package:mysql1/mysql1.dart';

Future dbConnect() {
  var conn = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    db: 'project1',
  );

  var conn2 = MySqlConnection.connect(conn);
  return conn2;
}