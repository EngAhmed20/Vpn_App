import 'package:flutter/material.dart';
import 'package:vpn_basic_project/core/utilis/app_const.dart';

import '../../../../../core/utilis/app_style/app_text_styles.dart';


class VpnRoundedButton extends StatelessWidget {
  const VpnRoundedButton({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          customBorder: CircleBorder(),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              constraints: BoxConstraints(
                minWidth: AppConst.getSize(context).width*0.40,
                minHeight: AppConst.getSize(context).height*0.20,
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.power_settings_new,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Let\'s Connect',
                    style: textStyle.Bold22.copyWith(color: Colors.white),
                    textAlign: TextAlign.center, // Center the text
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(15),
              color: Colors.redAccent
          ),
          child: Text('Not Connected',style: textStyle.semiBold18.copyWith(color: Colors.white),),
        ),

      ],
    );
  }
}
