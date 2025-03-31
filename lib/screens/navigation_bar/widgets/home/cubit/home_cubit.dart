import 'dart:async';
import 'dart:ui' as ui;
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:driver/core/assets/map/map.dart';
import 'package:driver/core/widgets/snack_bar.dart';
import 'package:driver/data/model/route_services.dart';
import 'package:driver/screens/navigation_bar/widgets/home/components/bottom_sheet.dart';
import 'package:driver/screens/navigation_bar/widgets/home/components/confirm_bottom_sheet.dart';
import 'package:driver/screens/navigation_bar/widgets/home/components/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_to_model/utils/extensions.dart';
import 'package:location/location.dart';
import '../../../../../core/assets/images/images.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../data/model/place_auto_complete_model.dart';
import 'package:driver/data/model/place_data_model.dart';
import '../../../../../data/model/route_body_model.dart';
import '../../../../../data/model/routes_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  LatLng? currentLocation;
  LatLng? startLocation;
  LatLng? destinationLocation;
  GoogleMapController? mapController;
  late LocationService locationService;
  Location location = Location();

  CameraPosition cameraPosition =
      const CameraPosition(target: LatLng(26.8206, 30.8025), zoom: 6);
  TextEditingController startTextController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  List<PlaceAutoCompleteModel> places = [];
  Set<Marker> markerList = {};
  Set<Circle> circles = {};
  String travelMode = "DRIVE";
  Set<Polyline> polylineList = {};
  String? distanceSpace;
  bool delivery = false;
  bool transport = true;
  late RouteServices routeServices;
  Timer? timer;
  String startAddress = '';
  String destinationAddress = '';
  late Origin origin;
  late Origin destination;
  late int placeIndex;
  List distanceList =[];

  late PlaceDataModel placeDataModel;
  PolylinePoints polylinePoints = PolylinePoints();

  Future<void> init(context) async {
    await getUserLocation(context);
    await checkAndRequestPermission(context);
    routeServices = RouteServices();
  }

  Future<void> onTapConfirmLocation(context) async {
    Navigator.of(context).pop();
    var placeDataModel = await getPlaceData(placeId: places[placeIndex].placeId.toString());
    double distance = calculateDistance(startLocation!, destinationLocation!);
    print("المسافة: ${distance / 1000} mi"); // لتحويلها إلى كيلومترات

    startTextController.clear();
    destinationController.clear();
    // startAddress.cleaned;
    // destinationAddress.cleaned;
    // startLocation = null;
    // destinationLocation = null;
    LatLng latLng = LatLng(placeDataModel.geometry.location.lat, placeDataModel.geometry.location.lng);
    onAddMarker(latLng);
    RouteServices routeServices = RouteServices();
    try {
      RoutesModel routeData = await routeServices.fetchRouteData(
        travelMode: "DRIVE",
        origin: origin,
        destination: destination,
      );
      List<PointLatLng> result = polylinePoints.decodePolyline(
          routeData.routes!.first.polyline!.encodedPolyline!);
      List<LatLng> points = result.map((e) => LatLng(e.latitude, e.longitude)).toList();
      displayRoutes(points);
      mapController?.animateCamera(
          CameraUpdate.newLatLngBounds(getLatLngBounds(points), 40),
          duration: const Duration(milliseconds: 830));
      emit(HomeLocationUpdated());
    } catch (e) {
      print("Error: $e");
    }
  }

  double calculateDistance(LatLng start, LatLng end) {
    return Geolocator.distanceBetween(
      start.latitude, start.longitude,
      end.latitude, end.longitude,
    );
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address =
            "${place.street}, ${place.subLocality}, ${place.locality}, "
            "${place.administrativeArea}, ${place.country}, ${place.postalCode}";
        return address;
      } else {
        return "لم يتم العثور على عنوان!";
      }
    } catch (e) {
      return "خطأ في جلب العنوان: $e";
    }
  }

  void onTapStartLocationIsMyLocation(context) async {
    // startLocation = userLocation;
    startLocation = currentLocation;
    String address = await getAddressFromLatLng(
        startLocation!.latitude, startLocation!.longitude);
    startAddress = address;
    startTextController.text = address.toString();
    origin = Origin(
        location: LocationModel(
            latLng: LatLongModel(
                latitude: startLocation!.latitude,
                longitude: startLocation!.longitude)));
    FocusScope.of(context).nextFocus();
    emit(HomeLocationUpdated());
  }

  Future<void> onTapLocationResults(index, context) async {
    var placeDataModel = await getPlaceData(placeId: places[index].placeId.toString());
    destinationLocation = LatLng(placeDataModel.geometry.location.lat, placeDataModel.geometry.location.lng);
    // onAddMarker(destinationLocation!);
    destinationAddress = await getAddressFromLatLng(destinationLocation!.latitude, destinationLocation!.longitude);
    destination = Origin(
        location: LocationModel(
            latLng: LatLongModel(
                latitude: destinationLocation!.latitude,
                longitude: destinationLocation!.longitude)));
    placeIndex = index;
    startTextController.clear();
    destinationController.clear();

    Navigator.of(context).pop();

      showModalBottomSheet(
        context: context,
        elevation: 0,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        isScrollControlled: true,
        builder: (context) {
          final cubit = context.read<HomeCubit>();
          return ConfirmBottomSheet(cubit: cubit);
        },
      );
  }

  LatLngBounds getLatLngBounds(List<LatLng> points) {
    var southWestLatitude = points.first.latitude;
    var southWestLongitude = points.first.longitude;
    var northEastLatitude = points.first.latitude;
    var northEastLongitude = points.first.longitude;

    for (var point in points) {
      southWestLatitude = min(southWestLatitude, point.latitude);
      southWestLongitude = min(southWestLongitude, point.longitude);
      northEastLatitude = max(northEastLatitude, point.latitude);
      northEastLongitude = max(northEastLongitude, point.longitude);
    }
    return LatLngBounds(
        southwest: LatLng(southWestLatitude, southWestLongitude),
        northeast: LatLng(northEastLatitude, northEastLongitude));
  }

  displayRoutes(List<LatLng> points) {
    Polyline route = Polyline(
        color: AppColors.primary500,
        width: 8,
        polylineId: const PolylineId("route"),
        points: points);
    polylineList.add(route);
  }

  Future<void> onSearch(value) async {
    // if (timer?.isActive ?? false) {
    //   timer?.cancel();
    // }
    // timer = Timer(const Duration(milliseconds: 100), () async {
    // places.clear();
    // places.addAll(result);
    // });
    var result = await getPredictions(input: value);
    places = List.from(result);
    for(int i =0; i < result.length; i++){
      PlaceDataModel placeDataModel = await getPlaceData(placeId: places[i].placeId.toString());
      LatLng latLng = LatLng(placeDataModel.geometry.location.lat, placeDataModel.geometry.location.lng);
      distanceList.add(calculateDistance(currentLocation!, latLng) / 1000);
    }
    emit(HomeLocationUpdated());
  }

  void onTapSearchButton(String key) {
    if (key == "transport") {
      transport = true;
      delivery = false;
    } else {
      delivery = true;
      transport = false;
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
        currentLocation =
            LatLng(locationData.latitude!, locationData.longitude!);
        markerList = {
          Marker(
              markerId: const MarkerId("currentLocation"),
              position: currentLocation!,
              icon: BitmapDescriptor.fromBytes(
                  await getImageFromRawData(Images.mapIcon, 90))),
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
        cameraPosition = CameraPosition(target: currentLocation!, zoom: 15);
        try {
          String style = await rootBundle.loadString('assets/map/map_style.json');
          await mapController?.setMapStyle(style);
        } catch (e) {
          print("Error loading map style: $e");
        }        mapController?.animateCamera(
            CameraUpdate.newCameraPosition(cameraPosition),
            duration: const Duration(milliseconds: 900));
        userLocation = currentLocation!;
        emit(HomeLocationUpdated());
      } else {
        showSnackBar(context, "تعذر الحصول على الموقع الحالي.");
      }
    } catch (e) {
      showSnackBar(context, "خطأ أثناء جلب الموقع: $e");
    }
  }

  Future<void> onAddMarker(LatLng value) async {
    if (currentLocation == null) return;
    markerList = {
      markerList.first,
      Marker(
          infoWindow: const InfoWindow(
            title: "وجهتك",
          ),
          markerId: const MarkerId("destination"),
          position: value,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen))
    };
    emit(HomeOnAddMarker());
  }

  void initMapStyle(context) async {
    var mapStyle =
        await DefaultAssetBundle.of(context).loadString(Maps.mapStyle);
    mapController?.setMapStyle(mapStyle);
  }

  Future<Uint8List> getImageFromRawData(String image, double width) async {
    var imageData = await rootBundle.load(image);
    var imageCodec = await ui.instantiateImageCodec(
        imageData.buffer.asUint8List(),
        targetWidth: width.round());

    var imageFrame = await imageCodec.getNextFrame();

    var imageBytData =
        await imageFrame.image.toByteData(format: ui.ImageByteFormat.png);

    return imageBytData!.buffer.asUint8List();
  }

  void onMapCreated(GoogleMapController googleMapController, context) {
    initMapStyle(context);
    mapController = googleMapController;
    updateCurrentLocation(context);
    emit(HomeLocationUpdated());
  }

  Future<void> updateCurrentLocation(context) async {
    try {
      var locationData = await LocationService().getLocationData();
      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(locationData.latitude!, locationData.longitude!),
          zoom: 14);
      mapController
          ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    } on LocationServiceException {
      showSnackBar(context, "خدمة الموقع غير مفعلة");
    } on LocationPermissionException {
      showSnackBar(context, "إذن الموقع مرفوض");
    }
  }

  void updateLocationData() {
    location.changeSettings(distanceFilter: .5);
    location.onLocationChanged.listen(
      (locationData) {
        var newLatLng = LatLng(locationData.latitude!, locationData.longitude!);
        currentLocation =
            LatLng(locationData.latitude!, locationData.longitude!);
        mapController?.animateCamera(CameraUpdate.newLatLng(newLatLng));
        emit(HomeLocationUpdated());
      },
    );
  }

  onTapRental(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        isScrollControlled: true,
        builder: (context) {
          final cubit = context.read<HomeCubit>();
          return SearchBottom(cubit: cubit);
        });
  }
}
