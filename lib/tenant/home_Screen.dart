import 'package:flat_finder/tenant/flat_screen.dart';
import 'package:flat_finder/tenant/flatmate_screen.dart';
import 'package:flat_finder/tenant/pg_screen.dart';
import 'package:flat_finder/tenant/search_screen.dart';
import 'package:flat_finder/widgets/filter_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentLocation = "location...";
  String localLocation = "location...";

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: AppColors().green,
          statusBarIconBrightness: Brightness.light),
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // AppBar section
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Location icon
                    SizedBox(
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset('assets/icons/location.svg')),
                    // Address section
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 8),
                      child: SizedBox(
                        width: 170,
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                /// current local fetch
                                Text(
                                  currentLocation,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Poppins-Bold',
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              localLocation,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins-Semibold',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    // search button
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchScreen()));
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/search.svg',
                          width: 30,
                          height: 30,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    // --------------------- Filter button ------------------ ///
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: AppColors().green,
                          borderRadius: BorderRadius.circular(30)),
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => const FilterDrawer());
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/filter.svg",
                          color: AppColors().blue,
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Tab section
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: AppColors().green,
                        indicator: BoxDecoration(
                          color: AppColors().blue,
                          borderRadius: BorderRadius.circular(11),
                          border:
                              Border.all(width: 2, color: Colors.amberAccent),
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        dividerHeight: 0,
                        labelPadding: const EdgeInsets.only(left: 5, right: 5),
                        tabs: [
                          // Flat tab
                          Tab(
                            child: Container(
                              height: double.maxFinite,
                              decoration: tabButtonStyle(),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SvgPicture.asset(
                                      "assets/icons/flat.svg",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  const Text("Flat"),
                                ],
                              ),
                            ),
                          ),
                          // PG tab
                          Tab(
                            child: Container(
                              height: double.maxFinite,
                              decoration: tabButtonStyle(),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SvgPicture.asset(
                                      "assets/icons/pg.svg",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  const Text("PG"),
                                ],
                              ),
                            ),
                          ),
                          // Flatmate tab
                          Tab(
                            child: Container(
                              height: double.maxFinite,
                              decoration: tabButtonStyle(),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SvgPicture.asset(
                                      "assets/icons/flatmate.svg",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  const Text("Flatmate"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TabView to show the contents of each tab
                    Expanded(
                      child: TabBarView(
                        children: [
                          const FlatScreen(),
                          const PgScreen(),
                          FlatmateScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// ---------------------------------------------- FUNCTION --------------------------------------///
// function used to style tab button
  static BoxDecoration tabButtonStyle() {
    return BoxDecoration(
      color: Colors.transparent, // Unselected background
      borderRadius: BorderRadius.circular(11),
      border: Border.all(width: 2, color: AppColors().green),
    );
  }

  // Function to check location permissions and get the user's location
  Future<void> _checkPermissions() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      await _getAreaLocation();
      await _getStateLocation();
    } else {
      setState(() {
        currentLocation = "Location permission is denied.";
      });
    }
  }

  // Function to get the user's area (locality) based on coordinates
  Future<void> _getAreaLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];
      String location = "${place.locality}";
      setState(() {
        currentLocation = location;
      });
    } catch (e) {
      setState(() {
        currentLocation = "location: ${e.toString()}";
      });
    }
  }

  // Function to get the user's state based on coordinates
  Future<void> _getStateLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];
      String location = "${place.street}";
      setState(() {
        localLocation = location;
      });
    } catch (e) {
      setState(() {
        localLocation = "Failed to get location: ${e.toString()}";
      });
    }
  }
}
