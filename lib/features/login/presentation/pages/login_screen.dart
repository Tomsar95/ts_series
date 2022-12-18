import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/features/core/utils/assets.dart';
import 'package:tv_series/features/core/utils/custom_navigator.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';
import 'package:tv_series/features/core/utils/utils.dart';
import 'package:tv_series/features/login/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:tv_series/features/login/presentation/widgets/widgets.dart';
import 'package:tv_series/injection_container.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black,
      body: buildBody(context),
    );
  }

  BlocProvider<LoginBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => serviceLocator<LoginBloc>(),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(GeneralAssets.loginBackGround),
                    fit: BoxFit.fitHeight,
                    opacity: 0.6),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Text(
                    'Welcome!',
                    style: CustomTextStyles.gilroyBoldTitle,
                  ),
                ),
              ) /* add child content here */,
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginInitial) {
                  if (Utils.mustReset == true) {
                    Utils.mustReset = false;
                    context.read<LoginBloc>().add(
                        const OnStartLoginEvent(mustReset: true));
                  }
                  if (state.refresh) {
                    context.read<LoginBloc>().add(
                        const OnStartLoginEvent(mustReset: false));
                  }
                  return LoginInitScreen(context: context);
                } else if (state is LoginLoadingState) {
                  return loading();
                } else if (state is LoginDataEntryState) {
                  return LoginDataEntry(showError: state.showError);
                } else if (state is LoginSuccessState) {
                  _goToHome(context);
                  return Container();
                }
                return Container();
              },
            ),
          ],
        ));
  }

  void _goToHome(BuildContext context) async {
    await Future.delayed(Duration.zero);
    Navigator.of(context).pushReplacementNamed(CustomRoutes.home);
  }

}

