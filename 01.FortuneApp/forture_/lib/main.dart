import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forture_/widgets/person_counter.dart';
import 'package:forture_/widgets/tip_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const Utip(),
    );
  }
}

class Utip extends StatefulWidget {
  const Utip({super.key});

  @override
  State<Utip> createState() => _UtipState();
}

class _UtipState extends State<Utip> {
  var _personCount = 1;
  var _tipPersonTage = 0.1;

  // methods
  void increment() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }

  void decrement() {
    setState(() {
      _personCount = _personCount - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    final style = theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold);

    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Utip app',
          style: TextStyle(color: Colors.red),
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: theme.colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Text("Total per Person", style: style),
                      Text("\$25.5r",
                          style: style.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontSize: theme.textTheme.displaySmall?.fontSize))
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: theme.colorScheme.primary,
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: BillAmountField(
                        billAmount: '100',
                        onChanged: (value){
                          print('Amount: $value');
                        }
                      ),
                    ),
                    PersonCounter(
                      theme: theme,
                      personCount: _personCount,
                      onDecrement: decrement,
                      onIncrement: increment,
                    ),

                    // === Tips section ===
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tip',
                          style: theme.textTheme.titleMedium,
                        ),
                        Text("\$20%", style: theme.textTheme.titleMedium)
                      ],
                    ),
                    // === Slider text ===
                    Text('${(_tipPersonTage * 100).round()}%'),
                    TipSlider(
                      tipPersonTage: _tipPersonTage,
                      onChange: (double value) {
                        setState(() {
                          _tipPersonTage = value;
                        });
                      },
                    )

                    // === Tip slider ====
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class BillAmountField extends StatelessWidget {
  const BillAmountField({
    super.key, required this.billAmount, required this.onChanged,
  });
 
 final String billAmount;
 final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.attach_money),
        labelText: 'Bill amount',
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged
    );
  }
}
