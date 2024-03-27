part of 'dashboard_bloc.dart';

abstract class DashboardEvent {
  DashboardEvent();
}

class OnDashboardPageIndexChanged extends DashboardEvent {
  final pageIndex;

  OnDashboardPageIndexChanged(this.pageIndex);
  @override
  List<Object> get props => [pageIndex];

  @override
  String toString() => 'OnDashboardPageIndexChanged { index: $pageIndex }';
}