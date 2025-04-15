import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/core/appPref/app_preference.dart';
import 'package:vpn_basic_project/core/utilis/app_const.dart';
import 'package:vpn_basic_project/feature/home/model/ip_model.dart';
import 'package:vpn_basic_project/feature/home/model/vpn_model.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';

class ApiVpnGate{
static Future<List<VpnModel>> retreiveAllAvilableFreeVpnServers()async{
  final List<VpnModel> vpnServerList=[];
  try{
    final responseFromApi= await http.get(Uri.parse(AppConst.apiLink));

    if(responseFromApi.statusCode==200){
      final commaSepratedValueString=responseFromApi.body.split("#")[1].replaceAll('*', "");

      List<List<dynamic>>listData=const CsvToListConverter().convert(commaSepratedValueString);
      print(listData);
      final header=listData[0];
      for(int counter=1;counter<listData.length-1;counter++){
        Map<String,dynamic>jsonData={};
        for(int innerCount=0;innerCount<header.length;innerCount++){
          jsonData.addAll({header[innerCount].toString():listData[counter][innerCount]});
        }
        vpnServerList.add(VpnModel.fromJson(jsonData));
      }
      vpnServerList.shuffle();
      if(vpnServerList.isNotEmpty) AppPreference.vpnList=vpnServerList;
      return vpnServerList;
    }else{
      Get.snackbar(
        'Connection Error',
        'Failed to retrieve data. Status code: ${responseFromApi.statusCode}',
        colorText: Colors.white,
        backgroundColor: Colors.orange,
      );
      return [];
    }

  }
  catch(errMsg){
    Get.snackbar('Error Message',errMsg.toString(),
      colorText:Colors.white,
      backgroundColor: Colors.redAccent,

    );
    return [];

  }
}
static Future<void>retriveIpdetails({required Rx<IpModel>ibInfo})async{
  try{
    final responseFromApi=await http.get(Uri.parse(AppConst.ipDetailsLink));
    final dataFromApi=jsonDecode(responseFromApi.body);
    ibInfo.value=IpModel.fromJson(dataFromApi);

  }catch(errMsg){
    Get.snackbar('Error Message',errMsg.toString(),
      colorText:Colors.white,
      backgroundColor: Colors.redAccent,

    );

  }
}
}