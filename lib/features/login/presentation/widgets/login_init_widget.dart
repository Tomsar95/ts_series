import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/features/core/utils/general_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';
import 'package:tv_series/features/login/presentation/blocs/login_bloc/login_bloc.dart';

class LoginInitScreen extends StatefulWidget {

  final BuildContext context;

  const LoginInitScreen({Key? key, required this.context}) : super(key: key);

  @override
  State<LoginInitScreen> createState() => _LoginInitScreenState();
}

class _LoginInitScreenState extends State<LoginInitScreen> {

  @override
  void initState() {
    //widget.context.read<LoginBloc>().add(const OnStartLoginEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildSignUpButton(context),
          buildLogInButton(context),
          buildPasswordRecoveryButton(),
        ],
      ),
    );
  }
}


Widget buildSignUpButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0, bottom: 16),
    child: TextButton(
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all<Color>(GeneralColors.yellow),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            )),
      ),
      onPressed: () {},
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Center(
          child: Text(
            'Sign up',
            style: CustomTextStyles.gilroyLight
                .copyWith(color: GeneralColors.black, fontSize: 20),
          ),
        ),
      ),
    ),
  );
}

Widget buildLogInButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: TextButton(
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all<Color>(GeneralColors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            )),
      ),
      onPressed: () => _onLogin(context),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Center(
          child: Text('Log in',
              style: CustomTextStyles.gilroyLight
                  .copyWith(color: GeneralColors.black, fontSize: 20)),
        ),
      ),
    ),
  );
}

Widget buildPasswordRecoveryButton() {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: Text(
      'Forgot password?',
      style: CustomTextStyles.gilroyLight
          .copyWith(decoration: TextDecoration.underline),
    ),
  );
}

void _onLogin(BuildContext context) {
  context.read<LoginBloc>().add(const OnStartFormEvent());
}