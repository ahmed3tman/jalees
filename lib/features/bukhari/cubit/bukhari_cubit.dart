import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/hadeeth_mode.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

part 'bukhari_state.dart';

class BukhariCubit extends Cubit<BukhariState> {
  BukhariCubit() : super(BukhariInitial());

  Future<void> loadBukhari() async {
    emit(BukhariLoading());
    try {
      final String response = await rootBundle.loadString(
        'assets/json/bukhari.json',
      );
      final data = json.decode(response);
      final HadeethBook book = HadeethBook.fromJson(data);
      emit(BukhariLoaded(book));
    } catch (e) {
      emit(BukhariError(e.toString()));
    }
  }
}
