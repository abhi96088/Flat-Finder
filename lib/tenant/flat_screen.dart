import 'package:flat_finder/widgets/card_large.dart';
import 'package:flutter/material.dart';

class FlatScreen extends StatefulWidget {
  const FlatScreen({super.key});

  @override
  State<FlatScreen> createState() => _FlatScreenState();
}

class _FlatScreenState extends State<FlatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index){
          return const CardLarge(
            title: '2 BHK Flat',
            rent: 'Rent - 15000',
            desc: 'Fully furnished 2bhk flat with Ac, Fri  . . .',
          );
        }
    );
  }
}
