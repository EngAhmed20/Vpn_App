
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vpn_basic_project/core/utilis/app_const.dart';
import 'package:vpn_basic_project/feature/home/model/vpn_model.dart';

class AppPreference{
  static late Box boxOfData;
  static Future<void> initHive()async{
    ///init hive location and directory
    await Hive.initFlutter();
    /// open box
    boxOfData=await Hive.openBox(AppConst.hiveBox);
  }
  /// save dark mood
  static set isDarkMode(bool value)=>boxOfData.put(AppConst.darkMode, value);
  /// get mode
  static bool get isDarkMode=>boxOfData.get(AppConst.darkMode)??false;
/// for saving selected vpn details
  static VpnModel get vpnDataModel => VpnModel.fromJson(jsonDecode(boxOfData.get(AppConst.storeVpnModel)??'{}'));
  static  set vpnDataModel(VpnModel value)=>boxOfData.put(AppConst.storeVpnModel,jsonEncode(value));


/// save all vpn list
static set vpnList(List<VpnModel>vpnList)=>boxOfData.put(AppConst.storeVpnList,jsonEncode(vpnList));
static List<VpnModel> get vpnList{
  List<VpnModel>vpnList=[];
  final allData = jsonDecode(boxOfData.get(AppConst.storeVpnList) ?? '[]');
  for(var data in allData){
    vpnList.add(VpnModel.fromJson(data));
  }
  return vpnList;
}
/*
static VpnModel get vpnDataModel=>VpnModel.fromJson(boxOfData.get(AppConst.storeVpnModel)??{});

  static  set vpnDataModel(VpnModel value)=>boxOfData.put(AppConst.storeVpnModel,value.toJson());

static set vpnList(List<VpnModel> vpnList) {
  // تحويل كل كائن VpnModel إلى خريطة باستخدام toJson() وتخزينها مباشرة
  final List<Map<String, dynamic>> vpnListJson = vpnList.map((vpn) => vpn.toJson()).toList();
  boxOfData.put(AppConst.storeVpnList, vpnListJson);
}
static List<VpnModel> get vpnList {
  // استرجاع البيانات كخريطة مباشرة
  final allData = boxOfData.get(AppConst.storeVpnList) ?? [];

  // تحويل كل عنصر من البيانات إلى كائن VpnModel باستخدام fromJson
  return allData.map((data) => VpnModel.fromJson(data)).toList();
}
*/



}

