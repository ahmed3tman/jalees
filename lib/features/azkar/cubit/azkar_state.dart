abstract class AzkarState {}

class AzkarInitial extends AzkarState {}

class GetAzkarLoadingState extends AzkarState {}

class GetAzkarSuccessState extends AzkarState {}

class GetAzkarErrorState extends AzkarState {
  final String error;

  GetAzkarErrorState(this.error);
}
