import 'package:get/get.dart';
import 'package:vpn_basic_project/core/appPref/app_preference.dart';
import 'package:vpn_basic_project/feature/home/model/vpn_model.dart';

class HomeController extends GetxController{
final Rx<VpnModel> vpnModel=AppPreference.vpnDataModel.obs;






}

//Rx update ui when change
//obs المراقيه لمعرفه حدوث اس تغيرات