import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';
import 'package:tv_series/features/login/domain/entities/user.dart';
import 'package:tv_series/features/login/presentation/blocs/login_bloc/login_bloc.dart';

class LoginDataEntry extends StatefulWidget {

  final bool showError;

  const LoginDataEntry({Key? key, required this.showError}) : super(key: key);

  @override
  State<LoginDataEntry> createState() => _LoginDataEntryState();
}

class _LoginDataEntryState extends State<LoginDataEntry> {
  late TextEditingController nameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    nameController.text = '';
    passwordController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.showError) _showError(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
            color: CustomColors.black.withOpacity(0.75),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            returnButton(context),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    hintStyle: CustomTextStyles.gilroyHint,
                  ),
                  controller: nameController,
                  style: CustomTextStyles.gilroyLight
                      .copyWith(color: CustomColors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: CustomTextStyles.gilroyHint,
                  ),
                  controller: passwordController,
                  obscureText: true,
                  style: CustomTextStyles.gilroyLight
                      .copyWith(color: CustomColors.white)),
            ),
            const SizedBox(
              height: 30,
            ),
            buildLogInButton(context),
          ],
        ),
      ),
    );
  }

  void _showError(BuildContext context) async {
    await Future.delayed(Duration.zero);
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          Future.delayed(
            const Duration(seconds: 2),
                () {
              Navigator.of(context).pop(true);
            },
          );
          return Center(
              child: Material(
                color: CustomColors.black.withOpacity(0.8),
                child: SizedBox(
                  width: 500,
                  height: 350,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 80,
                        width: 80,
                        child: Icon(
                          Icons.error_outline,
                          color: CustomColors.yellow,
                          size: 80,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        '¡Incorrect email or password!',
                        style: CustomTextStyles.gilroyLight.copyWith(
                          fontSize: 20,
                          color: CustomColors.yellow,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  Widget buildLogInButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(CustomColors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          )),
        ),
        onPressed: () => _onLogin(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Center(
            child: Text('Log in',
                style: CustomTextStyles.gilroyLight
                    .copyWith(color: CustomColors.black, fontSize: 20)),
          ),
        ),
      ),
    );
  }

  Widget returnButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              context.read<LoginBloc>().add(const OnResetEvent());
            },
            child: const Icon(
              Icons.close,
              color: CustomColors.darkGray,
              size: 30,
            ),
          )),
    );
  }

  void _onLogin() {
    context.read<LoginBloc>().add(OnLoginEvent(
      context: context,
        user: User(
            name: nameController.text,
            password: passwordController.text)));
  }
}
