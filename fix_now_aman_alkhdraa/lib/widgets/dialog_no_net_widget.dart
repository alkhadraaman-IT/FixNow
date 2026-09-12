import 'package:fix_now_aman_alkhdraa/core/config/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class DialogErrorNoNet extends StatelessWidget {
  const DialogErrorNoNet({super.key});

  @override
  Widget build(BuildContext context) {
    InternetConnectionChecker internetConnectionChecker = getIt
        .get<InternetConnectionChecker>();
    return Dialog(
      child: Column(
        spacing: 20.h,
        children: [
          Text(
            'No internet connection',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () async {
                  await FlutterExitApp.exitApp();
                },
                child: Text('Exit the app'),
              ),
              FilledButton(
                onPressed: () async {
                  //? عيد التابع يلي كان شغال؟؟
                  if (await internetConnectionChecker.hasConnection) {
                    Navigator.pop(context);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('No internet connection')),
                  );
                },
                child: Text('Confirm connection'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
