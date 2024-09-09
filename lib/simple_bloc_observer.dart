import 'package:bloc/bloc.dart';
import 'log.dart';


class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    Log.log(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
     Log.log(bloc.toString());
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
     Log.log(bloc.toString());
    super.onCreate(bloc);
  }
}
