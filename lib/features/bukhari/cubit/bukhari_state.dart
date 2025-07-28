part of 'bukhari_cubit.dart';

abstract class BukhariState {}

class BukhariInitial extends BukhariState {}

class BukhariLoading extends BukhariState {}

class BukhariLoaded extends BukhariState {
  final HadeethBook book;
  BukhariLoaded(this.book);
}

class BukhariError extends BukhariState {
  final String message;
  BukhariError(this.message);
}
