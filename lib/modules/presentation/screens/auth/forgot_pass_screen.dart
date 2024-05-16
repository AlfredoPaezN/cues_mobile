import 'package:virtual_cues/core/utils/colors.dart';
import 'package:virtual_cues/modules/presentation/blocs/auth/auth_cubit.dart';
import 'package:virtual_cues/modules/presentation/widgets/button.dart';
import 'package:virtual_cues/modules/presentation/widgets/text_form_field.dart';
import 'package:virtual_cues/modules/presentation/widgets/toasts.dart';
import 'package:virtual_cues/modules/presentation/widgets/validator.dart';
import 'package:virtual_cues/routes/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hot_toast/flutter_hot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _firstNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _lastNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passKey = GlobalKey<FormState>();

  final bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 100.h,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const Text(
                  'Recover your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: _firstNameKey,
                        child: CustomTextFormField(
                          controller: _firstName,
                          validator: (val) =>
                              validateNotEmpty(val, context, 'First name'),
                          hintText: 'First name',
                          labelText: 'First name',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Expanded(
                      child: Form(
                        key: _lastNameKey,
                        child: CustomTextFormField(
                          controller: _lastName,
                          validator: (val) =>
                              validateNotEmpty(val, context, 'Last name'),
                          hintText: 'Last name',
                          labelText: 'Last name',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Form(
                  key: _emailKey,
                  child: CustomTextFormField(
                    controller: _email,
                    validator: (val) => validateEmail(val, context),
                    hintText: 'Enter your email',
                    labelText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                BaseButton(
                  buttonContent: state.maybeWhen(
                    isLoading: () => const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    orElse: () => const Text(
                      'Recorver Password',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (!_firstNameKey.currentState!.validate() ||
                        !_lastNameKey.currentState!.validate() ||
                        !_emailKey.currentState!.validate() ||
                        !_passKey.currentState!.validate()) {
                      return;
                    }

                    final userLogged =
                        await authCubit.signUpWithEmailAndPassword(
                      _email.text.trim(),
                      _password.text.trim(),
                    );

                    if (userLogged != null) {
                      await context.push(Routes.home);
                    } else {
                      errorToast(context, 'An error occurred');
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text(
                        'Go to Log in',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
