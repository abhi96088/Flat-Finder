import 'package:flat_finder/tenant/flat_screen.dart';
import 'package:flat_finder/tenant/flatmate_screen.dart';
import 'package:flat_finder/tenant/pg_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

import '../theme/colors.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
        super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors().green,
          statusBarIconBrightness: Brightness.light
      ),
    );

    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [
            // this widget contains appbar
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    // this sizedbox contains location icon
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: SvgPicture.asset('assets/icons/location.svg')
                    ),
                    // this widget contains Address
                    const Padding(
                      padding: EdgeInsets.only(left: 5, top: 8),
                      child: SizedBox(
                        width: 170,
                        height: 80,
                        child: Column(
                          children: [
                            Row(
                                children:[
                                  Text("Kharar", style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'Poppins-Bold'),),
                                  Icon(Icons.keyboard_arrow_down_sharp, size: 40,)
                                ]),
                            Text("New Garden Colony", style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Poppins-Semibold'),),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    // this sizedbox contains search icon
                    SizedBox(
                        width: 45,
                        height: 45,
                        child: SvgPicture.asset('assets/icons/search.svg')
                    ),
                    const SizedBox(width: 10,),
                    // this sizedbox contains filter button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: const WidgetStatePropertyAll(Size(40,40)),
                            backgroundColor: WidgetStatePropertyAll(AppColors().green70),
                            foregroundColor: WidgetStatePropertyAll(AppColors().blue),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)
                                )
                            ),
                          ),

                          onPressed: (){},
                          child: SvgPicture.asset("assets/icons/filter.svg", color: AppColors().blue, width: 40,height: 40,)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // this widget contains rest of the screen
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
                          border: Border.all(width: 2, color: Colors.amberAccent),
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        dividerHeight: 0,
                        labelPadding: const EdgeInsets.only(left: 5, right: 5),
                        tabs: [
                          // this is the first tab "Flat"
                          Tab(
                            child: Container(
                              height: double.maxFinite,
                              decoration: tabButtonStyle(),
                              alignment: Alignment.center,
                              // this row contains Icon and text of the first tab
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: SvgPicture.asset("assets/icons/flat.svg", height: 30, width: 30,),
                                    ),
                                    const Text("Flat"),
                                  ],
                                ),
                            ),
                          ),
                          // this is the second tab "PG"
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
                                      child: SvgPicture.asset("assets/icons/pg.svg",  height: 30, width: 30,),
                                    ),
                                    const Text("PG"),
                                  ],
                                ),
                            ),
                          ),
                          // this is third tab "Flatmate"
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
                                      child: SvgPicture.asset("assets/icons/flatmate.svg",  height: 30, width: 30,),
                                    ),
                                    const Text("Flatmate"),
                                  ],
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          FlatScreen(),
                          PgScreen(),
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
// function used to style tab button
  static tabButtonStyle(){
    return BoxDecoration(
      color: Colors.transparent, // Unselected background
      borderRadius: BorderRadius.circular(11),
      border: Border.all(width: 2, color: AppColors().green),
    );
  }
}
