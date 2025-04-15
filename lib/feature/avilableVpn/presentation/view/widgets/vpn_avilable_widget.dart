import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn_basic_project/feature/avilableVpn/presentation/view/widgets/vpn_available_card.dart';
import 'package:vpn_basic_project/feature/home/model/vpn_model.dart';


vpnAvailableWidget({context,required String countryFlag,
  required String countryName,
  required int connectedUser,
  required String subTitle,}){
  return ListView.builder(itemBuilder: (context,index)=>
      VpnAvailableCard(vpnModel:vpnModel,),
    itemCount: 10,physics: BouncingScrollPhysics(),shrinkWrap: true,);
}




VpnModel vpnModel=VpnModel(HostName: 'd', IP: 155,
    Ping: 520, Speed: 197,
    CountryLong: 'japan', CountryShort: 'ad',
    NumVpnSessions: 10,
    OpenVPN_ConfigData_Base64: 'OpenVPN_ConfigData_Base64');