import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/module/Terms/screen/terms.dart';
import 'package:pocket_planner/module/meeting/presentaion/screen/meeting_screen.dart';
import 'package:pocket_planner/module/planner/data/model/planner_model.dart';
import 'package:pocket_planner/module/planner/presentation/screen/planner_detail_screen.dart';
import 'package:pocket_planner/module/planner/presentation/screen/planner_screen.dart';
import 'package:pocket_planner/util/form_builder/create_project_form.dart';

import '../core/auth/presentation/logic/auth_controller.dart';
import '../core/auth/presentation/screen/create_password.dart';
import '../core/auth/presentation/screen/login.dart';
import '../core/auth/presentation/screen/otp_screen.dart';
import '../core/auth/presentation/screen/signup.dart';

import '../core/service_locator/service_locator.dart';
import '../module/bottom_nav_bar/bottom_nav_bar.dart';
import '../module/onboarding/screen/onboarding_screen.dart';
import '../module/profile/presentation/screen/profile_screen.dart';
import '../util/form_builder/create_task_form.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      // debugPrint(
      //     "++++++++Token++++++${getIt<AuthController>().appNotifier.value}");
      if (getIt<AuthController>().appNotifier.value == '' &&
          !state.location.contains('/signup') &&
          !state.location.contains('/otp') &&
          !state.location.contains('/create-password') &&
          !state.location.contains('/onBoarding') &&
          !state.location.contains('/terms')) {
        return '/login';
      }
      return null;
    },
    initialLocation: '/',
    routes: <RouteBase>[
      // GoRoute(
      //   path: '/sso',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const SplashScreen();
      //   },
      //   routes: const <RouteBase>[],
      // ),
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
            isRegister: state.pathParameters['register'].toString() == "true",
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
      GoRoute(
        path: '/terms',
        builder: (BuildContext context, GoRouterState state) {
          return const TermsScreen();
        },
        routes: const <RouteBase>[],
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            parentNavigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              return const PlannerScreen();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'detail',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return PlannerDetailScreen(
                    plannerModel: state.extra as PlannerModel,
                  );
                },
              ),
              GoRoute(
                path: 'create-project/:iscreate',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return CreateProjectFrom(
                    isCreate:
                        state.pathParameters['iscreate'].toString() == "true",
                  );
                },
              ),
              GoRoute(
                path: 'create-task/:id',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  debugPrint(state.pathParameters['id'].toString());
                  return CreateTaskFrom(
                      id: int.tryParse(
                    state.pathParameters['id'].toString(),
                  ));
                },
              )
            ],
          ),
          GoRoute(
            path: '/meeting',
            parentNavigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              return const MeetingScreen();
            },
            routes: const <RouteBase>[],
          ),
          GoRoute(
            path: '/profile',
            parentNavigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfileScreen();
            },
            routes: const <RouteBase>[],
          ),
        ],
      )
    ],
    refreshListenable: getIt<AuthController>().appNotifier);
