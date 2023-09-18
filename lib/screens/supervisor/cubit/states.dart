// abstract class SupervisingStates {
//
// }
// class RetreivedatainitialState extends SupervisingStates{
//
// }
// class RetreivedataSuccessState extends SupervisingStates{
//
// }
// class RetreivedataErrorState extends SupervisingStates{
//   final String error;
//   RetreivedataErrorState(this.error);
// }
//
//
import 'package:delivery/models/Ordersmodel.dart';
import 'package:equatable/equatable.dart';

abstract class OrdersState extends Equatable {
const OrdersState();

@override
List<Object> get props => [];
}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<Ordersmodel> orders;

  OrdersLoaded(this.orders);

  @override
  List<Object> get props => [orders];
}

class OrdersError extends OrdersState {
  final String errorMessage;

  OrdersError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
