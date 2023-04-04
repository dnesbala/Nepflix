import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nepflix/auth/application/auth/auth_cubit.dart';
import 'package:nepflix/core/shared/app_extensions.dart';
import 'package:nepflix/core/shared/app_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;

    return Drawer(
      width: context.deviceWidth * 0.7,
      child: ListView(
        children: [
          authState.maybeWhen(
            authenticated: (user) => DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 40,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        user.photoURL ??
                            "https://www.pngarts.com/files/10/Default-Profile-Picture-PNG-Free-Download.png",
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    user.displayName ?? "",
                    style: context.textTheme.headline6!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 2),
                  Text(
                    user.email ?? "",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            orElse: () => DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: SizedBox(),
            ),
          ),
          ListTile(
            leading: Icon(MdiIcons.homeOutline),
            minLeadingWidth: 10,
            title: Text('Home'),
            onTap: () {
              context.pushReplacementNamed(AppRoutes.home);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_outline),
            minLeadingWidth: 10,
            title: Text('Watchlist'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(MdiIcons.bookOutline),
            minLeadingWidth: 10,
            title: Text('My Bookings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(MdiIcons.themeLightDark),
            minLeadingWidth: 10,
            title: Text('Dark Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.apps),
            minLeadingWidth: 10,
            title: Text('About'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(MdiIcons.logout),
            minLeadingWidth: 10,
            title: Text('Log Out'),
            onTap: () {
              context.read<AuthCubit>().signOut();
            },
          ),
        ],
      ),
    );
  }
}
