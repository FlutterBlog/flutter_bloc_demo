import 'package:bloc_example/bloc_count/bloc/counter_bloc.dart';
import 'package:bloc_example/bloc_count/counter_page.dart';
import 'package:bloc_example/bloc_time/bloc/time_bloc.dart';
import 'package:bloc_example/bloc_time/time_page.dart';
import 'package:bloc_example/normal_count/counter_n_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  // runApp(MyApp());
  // runApp(TimeApp());
  runApp(CountApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterNormalPage(title: 'Counter-N-Page'),
    );
  }
}

class TimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 定时器
    return BlocProvider<TimeBloc>(
      create: (context) => TimeBloc(""),
      child: MaterialApp(
        title: "Demo",
        theme: ThemeData(
          accentColor: Colors.blue,
          brightness: Brightness.light,
        ),
        home: TimePage(),
      ),
    );
  }
}

class CountApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 计算器
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
            theme: theme,
            home: BlocProvider(
              create: (_) => CounterBloc(),
              child: CounterPage(),
            ),
          );
        },
      ),
    );
  }
}
