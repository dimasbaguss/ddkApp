import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';

class MyService {
  Future<bool> updateNilaiApi(bool value) async {
    try {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Sensors/Sensor Api/Value");
      await ref.update({
        "NilaiApi": value,
      });
      return value;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> updateKondisiApi(String value) async {
    try {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Sensors/Sensor Api/Kondisi");
      await ref.update({
        "KondisiApi": value,
      });
      return value;
    } catch (e) {
      rethrow;
    }
  }

  Future<num> updateNilaiGas(num value) async {
    try {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Sensors/Sensor Gas/Value");
      await ref.update({
        "NilaiGas": value,
      });
      return value;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> updateKondisiGas(String value) async {
    try {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Sensors/Sensor Gas/Kondisi");
      await ref.update({
        "KondisiGas": value,
      });
      return value;
    } catch (e) {
      rethrow;
    }
  }

  Future<num> updateNilaiSuhu(num value) async {
    try {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Sensors/Sensor Suhu/Value");
      await ref.update({
        "NilaiSuhu": value,
      });
      return value;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> updateKondisiSuhu(String value) async {
    try {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Sensors/Sensor Suhu/Kondisi");
      await ref.update({
        "KondisiSuhu": value,
      });
      return value;
    } catch (e) {
      rethrow;
    }
  }
}
