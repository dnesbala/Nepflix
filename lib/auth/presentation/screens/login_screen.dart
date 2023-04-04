import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nepflix/auth/application/auth/auth_cubit.dart';
import 'package:nepflix/core/shared/app_constants.dart';
import 'package:nepflix/core/shared/app_extensions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8",
            height: context.deviceHeight,
            fit: BoxFit.fill,
            color: Colors.black.withOpacity(0.4),
            colorBlendMode: BlendMode.darken,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "NepFlix",
                  style: context.textTheme.headline3!.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Don't just watch movies - experience them with us.",
                  style: context.textTheme.headline5!.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async {
                    await context.read<AuthCubit>().signInWithGoogle();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(MdiIcons.google, size: 24),
                      SizedBox(width: 5),
                      Text(
                        "Login With Google",
                        style: context.textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppConstants.primaryColor),
                    fixedSize: MaterialStateProperty.all(
                        Size(context.deviceWidth, 50)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
