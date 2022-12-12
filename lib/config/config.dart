import 'package:google_maps_flutter/google_maps_flutter.dart';

class Config {
  final String appName = 'Visit Oromia';
  final String mapAPIKey = 'AIzaSyB74d2rm_M7bEcKRBAJaVavyrvijBn6Dig';
  final String countryName = 'Ethiopia';
  final String splashIcon = 'assets/images/splash.png';
  final String supportEmail = 'kebedebisa1@gmail.com';
  final String privacyPolicyUrl =
      'https://www.freeprivacypolicy.com'.toString();
  final String ourWebsiteUrl = 'https:visitOromia.org';
  final String iOSAppId = '000000000';

  final String specialState1 = 'Sylhet';
  final String specialState2 = 'Chittagong';

  // your country lattidtue & logitude
  final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(9.1450, 40.4897),
    zoom: 10,
  );

  //google maps marker icons
  final String hotelIcon = 'assets/images/hotel.png';
  final String restaurantIcon = 'assets/images/restaurant.png';
  final String hotelPinIcon = 'assets/images/hotel_pin.png';
  final String restaurantPinIcon = 'assets/images/restaurant_pin.png';
  final String drivingMarkerIcon = 'assets/images/driving_pin.png';
  final String destinationMarkerIcon =
      'assets/images/destination_map_marker.png';

  //Intro images
  final String introImage1 = 'assets/images/travel6.png';
  final String introImage2 = 'assets/images/travel1.png';
  final String introImage3 = 'assets/images/travel5.png';

  //Language Setup

  final List<String> languages = ['English', 'Afaan Oromoo (coming soon)'];

  // Ads Setup

  final int userClicksAmountsToShowEachAd = 5;

  //-- admob ads --
  final String admobAppId = 'ca-app-pub-3940256099942544~3347511713';
  final String admobInterstitialAdId = 'ca-app-pub-3940256099942544/1033173712';

  //fb ads
  final String fbInterstitalAdIDAndroid = '193186341991913_351138***********';
  //final String fbInterstitalAdIDiOS = '193186341991913_351139692863243';

}
