import 'dart:async';
import 'dart:developer';

import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/location_dto.dart';

import 'location_service_repository.dart';

@pragma('vm:entry-point')
class LocationCallbackHandler {
  @pragma('vm:entry-point')
  static Future<void> initCallback(Map<dynamic, dynamic> params) async {
    LocationServiceRepository myLocationCallbackRepository =
        LocationServiceRepository();
    await myLocationCallbackRepository.init(params);
  }

  @pragma('vm:entry-point')
  static Future<void> disposeCallback() async {
    LocationServiceRepository myLocationCallbackRepository =
        LocationServiceRepository();
    await myLocationCallbackRepository.dispose();
  }

  @pragma('vm:entry-point')
  static Future<void> callback(LocationDto locationDto) async {
    LocationServiceRepository myLocationCallbackRepository =
        LocationServiceRepository();
    await myLocationCallbackRepository.callback(locationDto);
    log('***notificationCallback');
    await BackgroundLocator.updateNotificationText(
        title: "Leajlak",
        msg: "Leajlak running in background",
        bigMsg: "Leajlak running in background");
  }

  @pragma('vm:entry-point')
  static Future<void> notificationCallback() async {
    log('***notificationCallback');
    
  }
}