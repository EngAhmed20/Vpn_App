import 'package:flutter/material.dart';
import 'package:vpn_basic_project/core/utilis/app_style/app_text_styles.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({super.key, required this.title, required this.subTitle, required this.icon, required this.backgroundColor});
  final String title;
  final String subTitle;
  final IconData icon;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       children: [
         CircleAvatar(radius: 40,child: Icon(icon,color: Colors.white,size: 40,),
         backgroundColor: backgroundColor,
         ),
         const SizedBox(height: 10,),
         Text(title,style: textStyle.Bold19,),
         Text(subTitle,style: textStyle.semiBold18,),

       ],
      ),
    );
  }
}
