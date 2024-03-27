part of 'dashboard_bloc.dart';

abstract class DashboardState {
  final int pageIndex;
  DashboardState({required this.pageIndex});

  @override
  List<Object> get props => [];
}

class DashboardBottomNavIndexChanged extends DashboardState {

  DashboardBottomNavIndexChanged({required super.pageIndex});
  @override
  List<Object> get props => [pageIndex];

  @override
  String toString() => 'DashboardBottomNavIndexChanged { todos: $pageIndex }';
}