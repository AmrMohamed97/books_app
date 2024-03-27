import 'package:books_app/core/utiles/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Image.asset(
              'assets/images/Logo.png',
              height: 20,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.searchView);
              },
              icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
            ),
          ],
        ),
      ),
    );
  }
}
