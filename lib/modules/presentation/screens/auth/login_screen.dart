import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:virtual_cues/core/utils/colors.dart';
import 'package:virtual_cues/modules/presentation/blocs/auth/auth_cubit.dart';
import 'package:virtual_cues/modules/presentation/widgets/button.dart';
import 'package:virtual_cues/modules/presentation/widgets/text_form_field.dart';
import 'package:virtual_cues/modules/presentation/widgets/toasts.dart';
import 'package:virtual_cues/modules/presentation/widgets/validator.dart';
import 'package:virtual_cues/routes/routes_constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passKey = GlobalKey<FormState>();

  bool _rememberMe = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  width: 100.h,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const Text(
                  'Fill your details to login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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
                  height: 20.h,
                ),
                Form(
                  key: _passKey,
                  child: CustomTextFormField(
                    controller: _password,
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    validator: (val) => validatePassword(val, context),
                    obscureText: _obscureText,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: const Color(CUES_Colors.primary),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                      activeColor: const Color(CUES_Colors.primary),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: const BorderSide(
                        color: Color(CUES_Colors.primary),
                        width: 1.5,
                      ),
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                BaseButton(
                  buttonContent: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    if (!_emailKey.currentState!.validate() ||
                        !_passKey.currentState!.validate()) {
                      return;
                    }
                    final userLogged =
                        await authCubit.signInWithEmailAndPassword(
                      _email.text.trim(),
                      _password.text.trim(),
                    );
                    if (userLogged != null) {
                      context.push(Routes.home);
                      successToast(context, 'Login successful');
                    } else {
                      errorToast(context, 'Invalid credentials');
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () => context.push(Routes.register),
                  child: const Text(
                    'Forgot password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 100.h,
                  child: Image.asset(
                    'assets/images/losMejores.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
