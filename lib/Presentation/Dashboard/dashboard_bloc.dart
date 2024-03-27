import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';
part 'dashboard_event.dart';

class DashboardBloc extends Bloc<DashboardEvent,DashboardState> {
  final BuildContext context;
  DashboardBloc({required this.context})
      : super(DashboardBottomNavIndexChanged(pageIndex: 1));
  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if(event is OnDashboardPageIndexChanged) {
      yield DashboardBottomNavIndexChanged(pageIndex: event.pageIndex);
    }
  }
}