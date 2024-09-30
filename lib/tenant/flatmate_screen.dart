import 'package:flutter/material.dart';
import '../widgets/card_large.dart';

class FlatmateScreen extends StatefulWidget {
  const FlatmateScreen({super.key});

  @override
  State<FlatmateScreen> createState() => _FlatmateScreenState();
}

class _FlatmateScreenState extends State<FlatmateScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CardLarge(
            title: 'Need a Flatmate',
            rent: 'Rent - 7500',
            desc: 'Need a  in flatmate in a luxury 2 bhk flat one room i . . .', location: '', imageUrl: '',
          );
        }
    );

  }
}
