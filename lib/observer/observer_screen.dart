import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/observer/count_observable.dart';
import 'package:flutter_design_patterns/observer/observer.dart';

class ObserverScreen extends StatefulWidget {
  const ObserverScreen({super.key});

  @override
  State<ObserverScreen> createState() => _ObserverScreenState();
}

class _ObserverScreenState extends State<ObserverScreen> implements Observer {
  final CountObservable _countObservable = CountObservable();

  late int count;

  @override
  void initState() {
    count = 0;
    _countObservable.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    _countObservable.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Observer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Count:',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 24,
            width: double.infinity,
          ),
          Text(
            count.toString(),
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 48,
          ),
          ElevatedButton(
            onPressed: () => _countObservable.increment(count + 1),
            child: const Text('Increment'),
          )
        ],
      ),
    );
  }

  @override
  void notifyChange(int newValue) {
    setState(() {
      count = newValue;
    });
  }
}
