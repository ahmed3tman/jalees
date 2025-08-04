import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jalees/features/azkar/cubit/azkar_state.dart';
import 'package:jalees/features/azkar/model/azkar_model.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());

  static AzkarCubit get(context) => BlocProvider.of(context);

  List<AzkarModel> azkar = [];

  Future<void> getAzkar() async {
    emit(GetAzkarLoadingState());
    try {
      final response = await rootBundle.loadString('assets/json/azkar.json');
      final data = json.decode(response) as Map<String, dynamic>;
      final columns = (data['columns'] as List).map((c) => c['name'] as String).toList();
      final rows = data['rows'] as List;

      azkar = rows.map((row) {
        final rowMap = Map.fromIterables(columns, row);
        return AzkarModel.fromJson(rowMap);
      }).toList();
      
      emit(GetAzkarSuccessState());
    } catch (e) {
      emit(GetAzkarErrorState(e.toString()));
    }
  }
}
