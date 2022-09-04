import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final landingViewProvider =
    StateNotifierProvider<LandingViewModel, bool>((ref) => LandingViewModel());

class LandingViewModel extends StateNotifier<bool> {
  LandingViewModel() : super(false);

  Future<bool> getUserLocation() async {
    try {
      state = true;
      bool serviceEnabled = await Location.instance.serviceEnabled();
      if (!serviceEnabled) {
        bool isRequestGranted = await Location.instance.requestService();
        if (!isRequestGranted) {
          return false;
        }
      }
      PermissionStatus status = await Location.instance.hasPermission();
      if (status == PermissionStatus.denied) {
        status = await Location.instance.requestPermission();
        if (status != PermissionStatus.granted) {
          return true;
        }
      }
      state = false;
      return true;
    } catch (e) {
      state = false;
      rethrow;
    }
  }
}
