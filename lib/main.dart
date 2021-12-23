import 'package:bloc_from_scratch/counter_bloc.dart';
import 'package:bloc_from_scratch/counter_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CounterBloc bloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC from Scratch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StreamBuilder(
                initialData: 0,
                stream: bloc.stream,
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 40),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      bloc.eventSink.add(IncrementEvent());
                    },
                    child: Text('Increment')),
                ElevatedButton(
                    onPressed: () {
                      bloc.eventSink.add(DecrementEvent());
                    },
                    child: Text('Decrement')),
              ],
            )
          ],
        ),
      ),
    );
  }
}


