import 'dart:async';

import 'package:bloc_example/bloc_time/bloc/time_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key key}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  ///计时器
  Timer _timer;

  @override
  void initState() {
    super.initState();

    /// 创建定时器
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      print("Timer: ---- Method");
      BlocProvider.of<TimeBloc>(context).add(0);
    });
  }

  @override
  void dispose() {
    super.dispose();

    /// 销毁计时器
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time"),
      ),
      body: _getBlocBuilder(),
    );
  }

  /// 通过 BlocBuilder 来消费事件结果
  Widget _getBlocBuilder() {
    // 构建 BlocBuilder
    return BlocBuilder<TimeBloc, String>(
      builder: (context, time) {
        // 处理Bloc的回传数据 time是一个字符串类型的处理结果
        return Container(
          margin: EdgeInsets.only(left: 12, top: 12),
          child: Text(
            '$time',
            style: TextStyle(fontSize: 22.0, color: Colors.red),
          ),
        );
      },
    );
  }
}
