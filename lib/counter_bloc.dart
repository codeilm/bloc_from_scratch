import 'dart:async';

import 'package:bloc_from_scratch/counter_event.dart';

class CounterBloc {
  int _count = 0;

  CounterBloc() {
    _eventController.stream.listen(_mapEvent);
  }

  StreamController _stateController = StreamController();
  StreamController _eventController = StreamController();

  StreamSink get eventSink => _eventController.sink;

  Stream get stream => _stateController.stream;

  void _mapEvent(event) {
    if (event is IncrementEvent) {
      _count++;
    } else {
      _count--;
    }
    _stateController.sink.add(_count);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}


