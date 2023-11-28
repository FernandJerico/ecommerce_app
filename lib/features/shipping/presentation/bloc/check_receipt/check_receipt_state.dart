part of 'check_receipt_bloc.dart';

@freezed
class CheckReceiptState with _$CheckReceiptState {
  const factory CheckReceiptState.initial() = _Initial;
  const factory CheckReceiptState.loading() = _Loading;
  const factory CheckReceiptState.loaded(WaybillSuccessResponseModel data) =
      _Loaded;
  const factory CheckReceiptState.error(WaybillFailedResponseModel error) =
      _Error;
}
