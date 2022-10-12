import 'package:aimart_admin/app/modules/home/views/admin_panel/admin_dashboard.dart';
import 'package:aimart_admin/app/modules/home/widgets/loading_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../data/data.dart';
import 'login.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.isNotLoaded()) {
          return Center(
            child: CircularProgressIndicator(
              color: CustomColors.kPrimary,
            ),
          );
        }
        if (snapshot.data == null) {
          return SignInScreen();
        }
        return WebViewMain();
      },
    );
  }
}
