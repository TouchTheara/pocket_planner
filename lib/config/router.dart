import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/module/meeting/screen/meeting_screen.dart';
import 'package:pocket_planner/module/planner/screen/planner_screen.dart';

import '../module/bottom_nav_bar/bottom_nav_bar.dart';

import '../module/profile/screen/profile_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const PlannerScreen();
          },
          routes: const <RouteBase>[],
        ),
        GoRoute(
          path: '/meeting',
          builder: (BuildContext context, GoRouterState state) {
            return const MeetingScreen();
          },
          routes: const <RouteBase>[],
        ),
        GoRoute(
          path: '/profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileScreen();
          },
          routes: const <RouteBase>[],
        ),
      ],
    ),
  ],
);
