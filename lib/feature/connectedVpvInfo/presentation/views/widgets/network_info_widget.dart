
import 'package:flutter/material.dart';
import 'package:vpn_basic_project/feature/connectedVpvInfo/data/model/network_ip_info.dart';

import '../../../../../core/utilis/app_const.dart';
import '../../../../../core/utilis/app_style/app_text_styles.dart';

class NetworkInfoWidget extends StatelessWidget {
  const NetworkInfoWidget({super.key, required this.networkIpInfo,});
  final NetworkIpInfo networkIpInfo;



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: ThemeData().cardColor,
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 1),
        title: Text(networkIpInfo.titleText,style: textStyle.Bold23.copyWith(color: Colors.black),),
        leading: Icon(networkIpInfo.iconData.icon,color: Colors.redAccent.withOpacity(0.9),size:AppConst.getSize(context).width*0.10),
        subtitle: Text(networkIpInfo.subTitleText,style: textStyle.semiBold16.copyWith(color: Colors.black.withOpacity(0.5))),


      ),
    );
  }
}