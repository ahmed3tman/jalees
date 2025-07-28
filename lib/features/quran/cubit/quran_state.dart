import 'package:equatable/equatable.dart';
import '../model/quran_model.dart';

abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object?> get props => [];
}

class QuranInitial extends QuranState {}

class QuranLoading extends QuranState {}

class QuranLoaded extends QuranState {
  final List<QuranSurah> surahs;
  const QuranLoaded(this.surahs);

  @override
  List<Object?> get props => [surahs];
}

class QuranError extends QuranState {
  final String message;
  const QuranError(this.message);

  @override
  List<Object?> get props => [message];
}
