import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/feature/home/model/vpn_model.dart';
import 'package:vpn_basic_project/feature/home/presentation/manager/home_controller.dart';

import '../../../../../core/utilis/app_const.dart';
import '../../../../../core/utilis/app_style/app_text_styles.dart';

class VpnAvailableCard extends StatelessWidget {
  const VpnAvailableCard({super.key, required this.vpnModel});
  final VpnModel vpnModel;
  String formatSpeedByte(int speedBytes,int decimals ){
    if(speedBytes<=0){
      return "0 B";
    }
    var bandwidthUnitsIndex=(log(speedBytes)/log(1024)).floor();
    return "${(speedBytes/pow(1024, bandwidthUnitsIndex)).toStringAsFixed(decimals)}${AppConst.bandwidthUnits[bandwidthUnitsIndex]}";

  }

  @override
  Widget build(BuildContext context) {
    final homeController=Get.find<HomeController>();
    return Card(
      elevation: 3,
      color: ThemeData().cardColor,
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: ListTile(
        onTap: (){},
        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 1),
        title: Text(vpnModel.CountryLong,style: textStyle.Bold23.copyWith(color: Colors.black),textAlign: TextAlign.center,),
        leading: Image.asset('assets/images/countryFlags/${(vpnModel.CountryShort).toLowerCase()}.png',width:AppConst.getSize(context).width*0.14),
        trailing: Stack(
          clipBehavior: Clip.none, // يخلي العناصر خارج الـ Stack تفضل ظاهرة

          children: [
            Icon(Icons.people,color: Colors.blue,size: 35,),
            Positioned(
              left: -10,
              top: -11,
              child: Padding(padding:EdgeInsets.only(bottom: 5),
              child: Text(
                vpnModel.NumVpnSessions.toString(),
                style: textStyle.semiBold16.copyWith(color: Colors.redAccent),
              ),
              ),
            ),        ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.speed_outlined,size: 25,color: Colors.redAccent,),
            const SizedBox(width: 5,),
            Text(formatSpeedByte(vpnModel.Speed, 1),style: textStyle.semiBold16.copyWith(color: Colors.black.withOpacity(0.5))),
          ],
        ),
      ),
    );
  }
}
