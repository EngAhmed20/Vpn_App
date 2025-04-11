import 'package:flutter/material.dart';
import 'package:vpn_basic_project/core/utilis/app_const.dart';

class VpnRoundedButton extends StatelessWidget {
  const VpnRoundedButton({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Align the container to the center
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.5),
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
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center, // Center the text
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
