import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

/// Bloc的泛型数据
/// 第一个参数 int 表示输入的事件类型
/// 第二个参数 String 表示输出的数据类型
class TimeBloc extends Bloc<int, String> {
  TimeBloc(String initialState) : super(initialState);

  /// 业务逻辑
  /// 根据不同的 [event] 标识，处理事件
  @override
  Stream<String> mapEventToState(int event) async* {
    ///获取当前的时间
    DateTime dateTime = DateTime.now();

    ///格式化时间
    String formatTime = DateFormat("HH:mm:ss").format(dateTime);

    ///发射更新数据
    yield formatTime;
  }
}
