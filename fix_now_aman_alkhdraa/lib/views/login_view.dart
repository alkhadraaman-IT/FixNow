import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/main_navigation_bar_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.widthOf(context);
    double screenHeight = MediaQuery.heightOf(context);
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    bool isShowPassword = false;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Container(
              width: screenWidth.w,
              height: 750.h,
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                border: Border.all(color: Color(0xffBDC9C9)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/login.png'),
                    SizedBox(height: 16.h),
                    Text(
                      'Welcome back',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Let\'s get your next job sorted.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 48.h),
                    Row(
                      mainAxisAlignment: .start,
                      children: [
                        Text(
                          'Email Address',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: email,
                      keyboardType: .emailAddress,
                      validator: (String? value) {
                        final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{3}",
                        ).hasMatch(value!);
                        if (value.isEmpty) {
                          return "Please fill this filed";
                        } else if (!emailValid) {
                          return "please enter correct email form: example@email.com";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hint: Text(
                          'contractor@example.com',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight(400),
                            color: Color(0xff6B7280),
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color(0xffBDC9C9),
                          size: 24,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffBDC9C9)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006065)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 200, 202, 202),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffBA1A1A)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffBA1A1A)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: .start,
                      children: [
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: password,
                      keyboardType: .visiblePassword,
                      obscureText: isShowPassword,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please fill this filed";
                        } else if (value.length < 8) {
                          return "passord must be more or equal 8 charcters";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hint: Text(
                          '••••••••',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight(400),
                            color: Color(0xff6B7280),
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: Color(0xffBDC9C9),
                          size: 24,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.visibility_outlined,
                            color: Color(0xffBDC9C9),
                            size: 24,
                          ),
                          onPressed: () {
                            isShowPassword = !isShowPassword;
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffBDC9C9)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006065)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 200, 202, 202),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffBA1A1A)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffBA1A1A)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: .end,
                      children: [
                        Text(
                          'Forgot password?',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    FilledButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainNavigationBarWidget(),
                            ),
                          );
                        }
                      },
                      style: FilledButton.styleFrom(
                        fixedSize: Size(screenWidth, 48),
                      ),
                      child: Text('Login'),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        SizedBox(width: screenWidth / 2 - 70.w, child: Divider()),
                        SizedBox(width: 8.w),
                        Text('OR'),
                        SizedBox(width: 8.w),
                        SizedBox(width: screenWidth / 2 - 70.w, child: Divider()),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Container(
                      width: screenWidth.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Color(0xffBDC9C9)),
                      ),
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          Image.asset(
                            'assets/images/google.png',
                            height: 20.h,
                            width: 20.w,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Continue with Google',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 48.h),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: 'Create account',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
