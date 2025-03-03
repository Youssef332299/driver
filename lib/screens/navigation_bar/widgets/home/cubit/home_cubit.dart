import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:driver/core/widgets/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../../../core/colors/app_colors.dart';
part 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  LatLng? currentLocation;
  GoogleMapController? mapController;
  final Location location = Location();
  TextEditingController searchController = TextEditingController();
  BitmapDescriptor customMarker = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
  Set<Marker> markerList = {};
  Set<Circle> circles = {};
  Set<Polyline> polylineList = {}; // تأكد من تحديث هذا
  String? distanceSpace;
  bool delivery = false;
  bool transport = true;

  Future<void> init(context) async {
    await checkAndRequestPermission(context);
    await getUserLocation(context);
  }

  onTapSearchButton(String key){
    if(key == "transport"){
      transport == false ? transport = true : null;
      delivery == true ? delivery = false : null;
    } else {
      delivery == false ? delivery = true : null;
      transport == true ? transport = false : null;
    }
    emit(HomeLocationUpdated());
  }

  Future<void> checkAndRequestPermission(context) async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        showSnackBar(context, "خدمة الموقع غير مفعلة");
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        showSnackBar(context, "إذن الموقع مرفوض");
        return;
      }
    }
  }

  Future<void> getUserLocation(context) async {
    try {
      var locationData = await location.getLocation();
      if (locationData.latitude != null && locationData.longitude != null) {
        currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
        markerList = {
          Marker(
            markerId: const MarkerId("currentLocation"),
            position: currentLocation!,
            icon: customMarker,
          ),
        };
        circles = {
          Circle(
            circleId: const CircleId("userCircle1"),
            center: currentLocation!,
            radius: 15,
            strokeColor: AppColors.primary600.withOpacity(0.3),
            fillColor: AppColors.primary600.withOpacity(0.3),
            strokeWidth: 2,
          ),
          Circle(
            circleId: const CircleId("userCircle1"),
            center: currentLocation!,
            radius: 50,
            strokeColor: AppColors.primary500.withOpacity(0.3),
            fillColor: AppColors.primary500.withOpacity(0.3),
            strokeWidth: 2,
          ),
          Circle(
            circleId: const CircleId("userCircle2"),
            center: currentLocation!,
            radius: 120,
            strokeColor: AppColors.primary400.withOpacity(0.3),
            fillColor: AppColors.primary400.withOpacity(0.3),
            strokeWidth: 2,
          ),
          Circle(
            circleId: const CircleId("userCircle3"),
            center: currentLocation!,
            radius: 180,
            strokeColor: AppColors.primary300.withOpacity(0.3),
            fillColor: AppColors.primary300.withOpacity(0.3),
            strokeWidth: 2,
          )
        };
        emit(HomeLocationUpdated());
      } else {
        showSnackBar(context, "تعذر الحصول على الموقع الحالي.");
      }
    } catch (e) {
      showSnackBar(context, "خطأ أثناء جلب الموقع: $e");
    }
  }

  void onAddMarker(LatLng value) {
    if (currentLocation == null) return;
    markerList = {
      markerList.first,
      Marker(
        markerId: const MarkerId("destination"),
        position: value,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    };
    double distance = calculateDistance(
      currentLocation!.latitude, currentLocation!.longitude,
      value.latitude, value.longitude,
    );
    distanceSpace = "${distance.toStringAsFixed(2)} كم";
    emit(HomeOnAddMarker());
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double R = 6371;
    double dLat = _degToRad(lat2 - lat1);
    double dLon = _degToRad(lon2 - lon1);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degToRad(lat1)) * cos(_degToRad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  double _degToRad(double deg) {
    return deg * (pi / 180);
  }

}