import 'package:get/get.dart';
import 'package:vpn_basic_project/core/api/api_vpn_gate.dart';
import 'package:vpn_basic_project/core/appPref/app_preference.dart';
import 'package:vpn_basic_project/feature/home/model/vpn_model.dart';

class VpnLocationController extends GetxController{
List<VpnModel>vpnFreeServerAvailableList=AppPreference.vpnList;
final RxBool  isLoadingNewLocation=false.obs;
Future<void>retrieveVpnInfo()async{
  isLoadingNewLocation.value=true;
  vpnFreeServerAvailableList.clear();
  vpnFreeServerAvailableList=await ApiVpnGate.retreiveAllAvilableFreeVpnServers();
  isLoadingNewLocation.value=false;
}
}