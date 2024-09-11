import 'package:flat_finder/widgets/card_small.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: AppColors().green,
        title: Text("Saved Items", style: TextStyle(fontSize: 25, fontFamily: "Poppins-Semibold", color: AppColors().darkGreen),),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search_rounded, size: 30, color: AppColors().darkGreen,)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert_rounded, size: 30,color: AppColors().darkGreen,)
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
            return const CardSmall(
              title: '2 BHK Flat',
              rent: 'RS-15000',
              desc: 'Fully furnished 2bhk flat with Ac, Fridge, Wifi and . . .',
            );
          }
      ),
    );
  }
}
