import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class ConstPreferences {
  var MEMBERDATA = "MEMBERDATA";
  var INTRO = "INTRO";
  var LOGINVERIFY = "LOGINVERIFY";
  var REGISTERVERIFY = "REGISTERVERIFY";
  var REGISTER = "REGISTER";
  var REGISTER_MEMBERID = "REGISTER_MEMBERID";
  var HOME = "HOME";
  var ACCESSTOKEN = "ACCESSTOKEN";
  var DEVICEID = "DEVICEID";
  var LANGUAGES = "LANGUAGES";
  var STORE_OWNER = "STORE_OWNER";
  var PROFILEID = "PROFILEID";
  var OXI9ID = "OXI9ID";
  var SERVICETYPE = "SERVICETYPE";




  Future<void> setOxi9Id(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(OXI9ID, value);
  }

  Future<String?> getOxi9Id() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(OXI9ID);
  }

  Future<void> setServiceType(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(SERVICETYPE, value);
  }

  Future<String?> getServiceType() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SERVICETYPE);
  }


  Future<void> setToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(ACCESSTOKEN, value);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(ACCESSTOKEN);
  }

  Future<void> setLanguages(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(LANGUAGES, value);
  }

  Future<String?> getLanguages() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(LANGUAGES);
  }

  Future<void> setRegisterVerify(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(REGISTERVERIFY, value);
  }

  Future<bool?> getRegisterVerify() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(REGISTERVERIFY);
  }


  Future<void> setRegisterMemberIdVerify(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(REGISTER_MEMBERID, value);
  }

  Future<bool?> getRegisterMemberIdVerify() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(REGISTER_MEMBERID);
  }

  Future<void> setDeviceId(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(DEVICEID, value);
  }

  Future<String?> getDeviceId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(DEVICEID);
  }

  Future<void> setStoreOwner(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(STORE_OWNER, value);
  }

  Future<String?> getStoreOwner() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(STORE_OWNER);
  }

  Future<void> setProfielID(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(PROFILEID, value);
  }

  Future<String?> getProfileID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(PROFILEID);
  }

  Future<void> clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
  Future<void> removePreferences(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(value);
  }
}
