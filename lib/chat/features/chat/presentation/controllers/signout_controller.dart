import 'package:flutter/material.dart';
import '../../../../core/domain/services/auth_service.dart';
import '../../../../injection_container.dart';
import '../../../login_and_registration/presentation/screens/login_and_registration_screen.dart';

class SignOutController {

  void signOut(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 200), getIt.get<AuthService>().signOut);
     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginAndRegistrationScreen(),),(route) => false);
    // Navigator.of(context).pushNamedAndRemoveUntil(ScreenRoutes.login, (route) => false);
  }

}
