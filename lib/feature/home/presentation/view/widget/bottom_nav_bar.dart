import'package:flutter/material.dart';
import'package:vpn_basic_project/core/utilis/app_const.dart';
import 'package:vpn_basic_project/core/utilis/app_style/app_text_styles.dart';
InkWell bottomNavBar({context,void Function()? onTap}) => InkWell(
    onTap: onTap,
    child: Container(
  padding: EdgeInsets.symmetric(horizontal:AppConst.getSize(context).width*.031
  ),
  width:double.infinity,
  height: AppConst.getSize(context).height*0.065,
  decoration: BoxDecoration(
    //color: Theme.of(context).bottomVanColor,
    color: Colors.redAccent,
      borderRadius: BorderRadius.only(
        topRight:Radius.circular(10),
        topLeft: Radius.circular(10),
      )

  ),
  child: Row(
    children: [
      Icon(Icons.flag_circle_outlined,
      color: Colors.white,
        size: 45,
      ),
      Spacer(),
      Text('Select Country/Location',style: textStyle.Bold23,),
      Spacer(),
      CircleAvatar(
        backgroundColor: Colors.white,
        radius: 22.5,
        child: Icon(Icons.arrow_forward_ios,
          color: Colors.redAccent,
        ),
      ),

    ],
  ),
));
