import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/core/api/api_vpn_gate.dart';
import 'package:vpn_basic_project/core/utilis/app_style/app_text_styles.dart';
import 'package:vpn_basic_project/feature/connectedVpvInfo/data/model/network_ip_info.dart';
import 'package:vpn_basic_project/feature/connectedVpvInfo/presentation/views/widgets/network_info_widget.dart';
import 'package:vpn_basic_project/feature/home/model/ip_model.dart';

class ConnectedNetworkInfo extends StatelessWidget {
  const ConnectedNetworkInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final ipModel =IpModel.fromJson({}).obs;
    ApiVpnGate.retriveIpdetails(ibInfo: ipModel);
    return Scaffold(
      floatingActionButton:SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(

          shape: CircleBorder(),
          backgroundColor:Colors.redAccent,
          onPressed: ()async{
            ipModel.value=IpModel.fromJson({});
            await ApiVpnGate.retriveIpdetails(ibInfo: ipModel);
          },child:Icon(CupertinoIcons.refresh_circled,color: Colors.white,size: 40,),),
      ),
      appBar: AppBar(
        title: Text('Network Info',style: textStyle.Bold28,),
        centerTitle: true,
      ),
      body:Obx(()=>ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 0),
        children: [
         NetworkInfoWidget(networkIpInfo:NetworkIpInfo(titleText: "IP Address",
             subTitleText: ipModel.value.query,
             iconData: Icon(Icons.my_location_outlined))),
          NetworkInfoWidget(networkIpInfo:NetworkIpInfo(titleText: "Internet Provider",
              subTitleText: ipModel.value.isp,
              iconData: Icon(Icons.account_tree))),
          NetworkInfoWidget(networkIpInfo:NetworkIpInfo(titleText: "Location",
              subTitleText:ipModel.value.country.isEmpty?'Retrieving':
              '${ipModel.value.city}, ${ipModel.value.regionName}, ${ipModel.value.country}',
              iconData: Icon(Icons.location_on_outlined))),
          NetworkInfoWidget(networkIpInfo:NetworkIpInfo(titleText: "Zip Code",
              subTitleText:ipModel.value.zip,
              iconData: Icon(CupertinoIcons.map_pin_ellipse))),
          NetworkInfoWidget(networkIpInfo:NetworkIpInfo(titleText: "Time Zone",
              subTitleText:ipModel.value.timezone,
              iconData: Icon(Icons.share_arrival_time_outlined))),


        ],
      ))
    );
  }
}
