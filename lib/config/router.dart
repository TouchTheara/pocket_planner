import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/core/work_through/splash_screen.dart';
import 'package:pocket_planner/module/Terms/screen/terms.dart';
import 'package:pocket_planner/module/meeting/screen/meeting_screen.dart';
import 'package:pocket_planner/module/planner/model/planner_model.dart';
import 'package:pocket_planner/module/planner/screen/planner_detail_screen.dart';
import 'package:pocket_planner/module/planner/screen/planner_screen.dart';

import '../core/auth/screen/create_password.dart';
import '../core/auth/screen/login.dart';
import '../core/auth/screen/otp_screen.dart';
import '../core/auth/screen/signup.dart';

import '../module/notification/screen/notification_screen.dart';
import '../module/onboarding/screen/onboarding_screen.dart';
import '../module/profile/screen/profile_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  // redirect: (context, state) {
  //   if (appController.appNotifier.value != '') {
  //     return '/';
  //   }
  //   return null;
  // },
  initialLocation: '/sso',
  routes: <RouteBase>[
    GoRoute(
      path: '/sso',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingScreen();
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginSignUpScreen();
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: '/signup/:register',
      builder: (BuildContext context, GoRouterState state) {
        return SignUpScreen(
          isRegister: state.params['register'].toString() == "true",
        );
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: '/otp',
      builder: (BuildContext context, GoRouterState state) {
        return const OTPScreen();
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: '/create-password',
      builder: (BuildContext context, GoRouterState state) {
        return const CreatePassword();
      },
      routes: const <RouteBase>[],
    ),
    // ShellRoute(
    //   navigatorKey: _shellNavigatorKey,
    //   builder: (BuildContext context, GoRouterState state, Widget child) {
    //     return CustomDrawer(child: child);
    //   },
    //   routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const PlannerScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'detail',
          builder: (BuildContext context, GoRouterState state) {
            return PlannerDetailScreen(
              plannerModel: state.extra as PlannerModel,
            );
          },
        )
      ],
    ),
    GoRoute(
      path: '/meeting',
      builder: (BuildContext context, GoRouterState state) {
        return const MeetingScreen();
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: '/notification',
      builder: (BuildContext context, GoRouterState state) {
        return const NotificationScreen();
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
    //   ],
    // ),
    GoRoute(
      path: '/terms',
      builder: (BuildContext context, GoRouterState state) {
        return const TermsScreen();
      },
      routes: const <RouteBase>[],
    )
  ],
);
