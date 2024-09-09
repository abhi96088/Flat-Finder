import 'package:flat_finder/widgets/card_large.dart';
import 'package:flutter/material.dart';

class PgScreen extends StatefulWidget {
  const PgScreen({super.key});

  @override
  State<PgScreen> createState() => _PgScreenState();
}

class _PgScreenState extends State<PgScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index){
          return const CardLarge(
            title: 'Luxury Boys PG',
            rent: 'Rent - 8000',
            desc: 'Luxury Pg with all facilities like Ac, Fridge, Wifi, R.O, Bed, Sofa and . . .',
          );
        }
    );
  }
}
