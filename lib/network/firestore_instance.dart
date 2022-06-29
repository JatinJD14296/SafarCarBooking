import 'package:firebase_database/firebase_database.dart';

import '../utils/strings.dart';

class FireBaseDatabaseInstance {
  static DatabaseReference adminDatabase;
  static DatabaseReference vendorDatabase;

  static createReference() {
    adminDatabase = FirebaseDatabase.instance.reference().child(admin);
    vendorDatabase = FirebaseDatabase.instance.reference().child(vendor);
  }
}
