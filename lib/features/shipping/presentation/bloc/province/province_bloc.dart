import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/shipping/data/datasource/rajaongkir_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/response/province_response_model.dart';

part 'province_event.dart';
part 'province_state.dart';
part 'province_bloc.freezed.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  ProvinceBloc() : super(const _Initial()) {
    on<ProvinceEvent>((event, emit) async {
      emit(const _Loading());
      final result = await RajaOngkirRemoteDatasource().getProvince();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir.results)),
      );
    });
  }
}
