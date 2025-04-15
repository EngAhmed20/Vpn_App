import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn_basic_project/core/utilis/app_style/app_text_styles.dart';

buildLoadingUiWidget(){
  return SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
        const SizedBox(height: 20,),
        Text('Gathering Free Vpn Location ...',
        style: textStyle.semiBold16,),
      ],
    ),
  );
}