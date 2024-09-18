import 'package:flat_finder/theme/colors.dart';
import 'package:flat_finder/widgets/show_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {

  // values for check box, initially false so, it will appear unchecked
  bool lowToHigh = false;
  bool highToLow = false;
  bool nearToFar = false;
  bool farToNear = false;

  bool oneBhk = false;
  bool twoBhk = false;
  bool threeBhk = false;
  bool oneRk = false;
  bool studio = false;
  bool oneRoom = false;
  bool ac = false;
  bool nonAc = false;

// values for range slider
  RangeValues budgetValues = const RangeValues(2000, 30000);

  // max value for distance slider
  double distanceSliderValue = 10.0;
  @override
  Widget build(BuildContext context) {
    // range slider labels
    RangeLabels budgetLabels = RangeLabels("${budgetValues.start.toString()}₹", "${budgetValues.end.toString()}₹");

    return Dialog(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            // use sizedBox to set the size of dialog
            child: SizedBox(
              height: 700,
              child: Column(
              children: [
                // this row contains the title "Filter"
                const SizedBox(height: 25,),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/filter.svg", color: AppColors().darkGreen,height: 30, width: 30,),
                    const SizedBox(width: 8,),
                    Text("Filters", style: TextStyle(color: AppColors().darkGreen, fontSize: 30, fontFamily: "Poppins-Semibold"),),
                  ],
                ),
                Divider(thickness: 2,color: AppColors().darkGrey,),
                // this row contains Title of sort by section
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/sort.svg", height: 25, width: 25, color: AppColors().darkGreen,),
                    Text(" Sort by", style: TextStyle(color: AppColors().darkGreen, fontSize: 25, fontFamily: "Poppins-Semibold"),),
                    SvgPicture.asset("assets/icons/down_arrow.svg", width: 35, height: 35,)
                  ],
                ),
                // below section contains all the checkboxes of sort by section
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                     ShowCheckbox(value:lowToHigh, text: "Price : low to high ", icon: "assets/icons/rise.svg",),
                     ShowCheckbox(value:highToLow, text: "Price : high to low ", icon:"assets/icons/fall.svg",),
                     ShowCheckbox(value:nearToFar, text: "Distance : near to far ", icon:"assets/icons/distance.svg",),
                     ShowCheckbox(value:farToNear, text: "Distance : far to near ", icon:"assets/icons/distance_reversed.svg",),
                    ],
                  ),
                ),
                Divider(thickness: 2,color: AppColors().darkGrey,),
                // this row contains the title "Budget"
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/budget.svg", height: 25, width: 25, color: AppColors().darkGreen,),
                    Text(" Budget", style: TextStyle(color: AppColors().darkGreen, fontSize: 25, fontFamily: "Poppins-Semibold"),),
                    SvgPicture.asset("assets/icons/down_arrow.svg", width: 35, height: 35,)
                  ],
                ),
                RangeSlider(
                    min: 2000,
                    max: 30000,
                    divisions: 56,    // 56 division so the amount can be selected in 500 count
                    values: budgetValues,
                    labels: budgetLabels,
                    inactiveColor: AppColors().green,
                    activeColor: AppColors().blue,
                    onChanged: (value) {
                      setState(() {
                          budgetValues = value;
                      });
                    }

                ),
                Divider(thickness: 2,color: AppColors().darkGrey,),
                // this row contains the title "Radius"
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/gps.svg", height: 25, width: 25, color: AppColors().darkGreen,),
                    Text(" Radius", style: TextStyle(color: AppColors().darkGreen, fontSize: 25, fontFamily: "Poppins-Semibold"),),
                    SvgPicture.asset("assets/icons/down_arrow.svg", width: 35, height: 35,)
                  ],
                ),
                // distance slider
                Slider(
                    max: 10,
                    min: 1,
                    divisions: 9,
                    inactiveColor: AppColors().green,
                    activeColor: AppColors().blue,
                    value: distanceSliderValue,
                    label: "${distanceSliderValue.round().toString()} km",
                    onChanged: (value){
                      setState(() {
                        distanceSliderValue = value;
                      });
                    }
                ),
                Divider(thickness: 2,color: AppColors().darkGrey,),
                // this row contains the title "Property type"
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/building.svg", height: 25, width: 25, color: AppColors().darkGreen,),
                    Text(" Property Type", style: TextStyle(color: AppColors().darkGreen, fontSize: 25, fontFamily: "Poppins-Semibold"),),
                    SvgPicture.asset("assets/icons/down_arrow.svg", width: 35, height: 35,)
                  ],
                ),
                // this row contains all the checkboxes of property type
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShowCheckbox(value: oneBhk, text: "1 BHK",),
                        ShowCheckbox(value: threeBhk, text: "3 BHK",),
                        ShowCheckbox(value: studio, text: "Studio",),
                        ShowCheckbox(value: ac, text: "AC",),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShowCheckbox(value: twoBhk, text: "2 BHK",),
                        ShowCheckbox(value: oneRk, text: "1 Rk",),
                        ShowCheckbox(value: oneRoom, text: "1 Room",),
                        ShowCheckbox(value: nonAc, text: "Non-AC",),
                      ],
                    )
                  ],
                              ),
                ),
                const SizedBox(height: 30,),
                // this row contains both of the buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                        onPressed: (){
                          Navigator.of(context).pop();  // close the dialog
                        },
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))),
                        side: const WidgetStatePropertyAll(BorderSide(color: Colors.red))
                      ),
                        child: const Text("Cancel", style: TextStyle(color: Colors.red),),
                    ),
                   const SizedBox(width: 20,),
                    ElevatedButton(
                      onPressed: (){
                        //////////////////////////////////////////////
                        /// Apply the changes on current screen  /////
                        /////////////////////////////////////////////
                        Navigator.of(context).pop();  // close the dialog
                      },
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))),
                          side: WidgetStatePropertyAll(BorderSide(color: AppColors().blue)),
                          backgroundColor: WidgetStatePropertyAll(AppColors().blue)
                      ),
                      child: const Text("Apply", style: TextStyle(color: Colors.white),),
                    )
                  ],
                )
              ]),
            ),
          )
    );
  }

}
