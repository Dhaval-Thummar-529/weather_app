import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/Presentation/Dashboard/dashboard_bloc.dart';
import 'package:flutter_weather/Presentation/home_page.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  List<Widget> widgetOptions = <Widget>[
    HomePage(),
    const Column(),
    const Column()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (_, state) {
        return Scaffold(
          extendBody: true,
          body: widgetOptions[state.pageIndex-1],
          bottomNavigationBar: Container(
            height: 60,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.blue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                state.pageIndex == 1
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Wrap(
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  constraints: const BoxConstraints(),
                                  iconSize: 24,
                                  splashColor: Colors.transparent,
                                  splashRadius: 1,
                                  enableFeedback: false,
                                  onPressed: () {
                                    BlocProvider.of<DashboardBloc>(_)
                                        .add(OnDashboardPageIndexChanged(1));
                                  },
                                  icon: const Icon(
                                    Icons.cloudy_snowing,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  height: 2,
                                  width: 15,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ))
                    : IconButton(
                        iconSize: 24,
                        splashColor: Colors.transparent,
                        splashRadius: 1,
                        enableFeedback: false,
                        onPressed: () {
                          BlocProvider.of<DashboardBloc>(_)
                              .add(OnDashboardPageIndexChanged(1));
                        },
                        icon: const Icon(
                          Icons.cloudy_snowing,
                        ),
                      ),
                state.pageIndex == 2
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Wrap(
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  constraints: const BoxConstraints(),
                                  iconSize: 24,
                                  splashColor: Colors.transparent,
                                  splashRadius: 1,
                                  enableFeedback: false,
                                  onPressed: () {
                                    BlocProvider.of<DashboardBloc>(_)
                                        .add(OnDashboardPageIndexChanged(2));
                                  },
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  height: 2,
                                  width: 15,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ))
                    : IconButton(
                        iconSize: 24,
                        splashColor: Colors.transparent,
                        splashRadius: 1,
                        enableFeedback: false,
                        onPressed: () {
                          BlocProvider.of<DashboardBloc>(_)
                              .add(OnDashboardPageIndexChanged(2));
                        },
                        icon: const Icon(Icons.search),
                      ),
                state.pageIndex == 3
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Wrap(
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  constraints: const BoxConstraints(),
                                  iconSize: 24,
                                  splashColor: Colors.transparent,
                                  splashRadius: 1,
                                  enableFeedback: false,
                                  onPressed: () {
                                    BlocProvider.of<DashboardBloc>(_)
                                        .add(OnDashboardPageIndexChanged(3));
                                  },
                                  icon: const Icon(
                                    Icons.sports_football,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  height: 2,
                                  width: 15,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ))
                    : IconButton(
                        iconSize: 24,
                        splashColor: Colors.transparent,
                        splashRadius: 1,
                        enableFeedback: false,
                        onPressed: () {
                          BlocProvider.of<DashboardBloc>(_)
                              .add(OnDashboardPageIndexChanged(3));
                        },
                        icon: const Icon(Icons.sports_football),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
