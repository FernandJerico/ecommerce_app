part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.started() = _Started;
  const factory CartEvent.add(Cart cart) = _Add;
  const factory CartEvent.remove(Cart cart) = _Remove;
  const factory CartEvent.delete(Cart cart) = _Delete;
}
