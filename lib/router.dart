import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'add_intern/add_intern_barrel.dart';
import 'home/home_view.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const InternshipTracker(),
    ),
    GoRoute(
      path: '/add_intern',
      builder: (BuildContext context, GoRouterState state) => const AddInternPage(),
    ),
  ],
);