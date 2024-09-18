import 'package:flat_finder/widgets/filter_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align children to the start
        children: [
          const SizedBox(height: 40), // Adjust height to fit content
          // This sized box contains app bar design
          SizedBox(
            width: double.infinity,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  // This sized box contains location icon
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset('assets/icons/location.svg'),
                  ),
                  // This widget contains Address
                  const Padding(
                    padding: EdgeInsets.only(left: 5, top: 8),
                    child: SizedBox(
                      width: 170,
                      height: 80,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text to start
                        children: [
                          Row(
                            children: [
                              Text(
                                "Kharar",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontFamily: 'Poppins-Bold'),
                              ),
                              Icon(Icons.keyboard_arrow_down_sharp, size: 40),
                            ],
                          ),
                          Text(
                            "New Garden Colony",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Poppins-Semibold'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  // This contains cross button
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);   // pop the screen when pressed on this button
                    },
                    icon: Icon(Icons.cancel_outlined,
                        color: Colors.red.withOpacity(0.4), size: 50),
                  ),
                ],
              ),
            ),
          ),
          // this section contains search bar and filter button inside it
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Container(
              height: 55,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(11)),
              ),
              child: Expanded(
                // using stack to float button on the container
                child: Stack(children: [
                  TextField(
                    controller: searchController,
                    autofocus: true,    // set autofocus as true so, it will automatically open keyboard when this screen is loaded
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/icons/search.svg",
                          width: 24,
                          height: 24,
                          color: Colors.grey[500],
                        ),
                      ),
                      hintText: 'Search for flat, pg, or flatmate . . .',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColors().blue50,
                    ),
                  ),
                  // below code is for the filter button
                  Positioned(
                    right: 0,
                    child: SizedBox(
                      width: 100,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => const FilterDrawer()
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors().blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11), // Button border radius
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 5), // Ensure proper padding
                        ),
                        // use row because we have to put icon and text both as child
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/filter.svg",
                              color: Colors.white,
                              width: 30,
                              height: 30,
                            ),
                            const Text("Filter", style: TextStyle(color: Colors.white, fontFamily: "Inter", fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1),),
                          ],
                        ),
                      )

                    ),
                    ),
                ]),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // this code is for recent search text
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Recent searches",
              style: TextStyle(
                  color: AppColors().darkGreen,
                  fontSize: 22,
                  fontFamily: "Poppins-Medium"),
            ),
          )

          ////////////////////////////////// ADD RECENT SEARCHES OF USER BELOW //////////////////////////////////


          /***************************************************************************************************
           FETCH AND LIST ALL THE PROPERTY WHICH TITLE OR DESCRIPTION CONTAINS THE KEYWORD SEARCHED BY USER
           ***************************************************************************************************/
        ],
      ),
    );
  }
}
