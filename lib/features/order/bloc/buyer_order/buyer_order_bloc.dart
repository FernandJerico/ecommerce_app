import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/cart/data/datasources/order_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../cart/data/model/response/buyer_order_response_model.dart';

part 'buyer_order_event.dart';
part 'buyer_order_state.dart';
part 'buyer_order_bloc.freezed.dart';

class BuyerOrderBloc extends Bloc<BuyerOrderEvent, BuyerOrderState> {
  BuyerOrderBloc() : super(const _Initial()) {
    on<_GetBuyerOrder>((event, emit) async {
      emit(const _Loading());
      final response = await OrderRemoteDatasource().getOrderByUserId();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data)),
      );
    });
  }
}
