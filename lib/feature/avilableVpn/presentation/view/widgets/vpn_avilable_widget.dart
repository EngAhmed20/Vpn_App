import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn_basic_project/feature/avilableVpn/presentation/view/widgets/vpn_available_card.dart';

import '../../manager/vpn_location_controller.dart';


vpnAvailableWidget({context,required VpnLocationController vpnLocationController }){
  return ListView.builder(itemBuilder: (context,index)=>
      VpnAvailableCard(vpnModel:vpnLocationController.vpnFreeServerAvailableList[index],),
    itemCount: vpnLocationController.vpnFreeServerAvailableList.length,
    physics: BouncingScrollPhysics(),shrinkWrap: true,);
}



/*
VpnModel vpnModel=VpnModel(HostName: 'd', IP: '155',
    Ping: '520', Speed: 197,
    CountryLong: 'japan', CountryShort: 'ad',
    NumVpnSessions: 10,
    OpenVPN_ConfigData_Base64: 'OpenVPN_ConfigData_Base64');*/