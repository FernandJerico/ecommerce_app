import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/shipping/data/datasource/rajaongkir_remote_datasource.dart';
import 'package:ecommerce_app/features/shipping/data/model/response/waybill_failed_response_model.dart';
import 'package:ecommerce_app/features/shipping/data/model/response/waybill_success_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_receipt_event.dart';
part 'check_receipt_state.dart';
part 'check_receipt_bloc.freezed.dart';

class CheckReceiptBloc extends Bloc<CheckReceiptEvent, CheckReceiptState> {
  CheckReceiptBloc() : super(const _Initial()) {
    on<_GetCheckReceipt>((event, emit) async {
      emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource()
          .getWayBill(event.resi, event.courier);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
