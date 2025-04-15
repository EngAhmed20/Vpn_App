import 'package:flutter/material.dart';

import '../../../../../core/utilis/app_style/app_text_styles.dart';

noVpnFoundedUiWidget(){
  return Center(
    child: Text('No VPNs Found, Try Again ...',
      style: textStyle.semiBold16,),
  );

}