part of 'check_receipt_bloc.dart';

@freezed
class CheckReceiptEvent with _$CheckReceiptEvent {
  const factory CheckReceiptEvent.started() = _Started;
  const factory CheckReceiptEvent.getCheckReceipt({
    required String resi,
    required String courier,
  }) = _GetCheckReceipt;
}
