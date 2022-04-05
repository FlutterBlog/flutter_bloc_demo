import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Event being processed by [CounterBloc].
enum CounterEvent {
  increment,
  decrement,
}

/// A simple [Bloc] which manages an `int` as its state.
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
      default:
        addError(
          Exception('unsupported event'),
        );
    }
  }
}

/// A simple [Cubit] which manages the [ThemeData] as its state.
class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );

  void toggleTheme() {
    emit(
      state.brightness == Brightness.dark ? _lightTheme : _darkTheme,
    );
  }
}
