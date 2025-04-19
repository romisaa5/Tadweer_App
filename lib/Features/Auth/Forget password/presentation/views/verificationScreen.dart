import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';

void main() {
  runApp(MaterialApp(
    home: VerificationScreen(),
  ));
}

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  List<TextEditingController> controllers =
      List.generate(5, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: textTheme.bodyLarge!.color),
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.forgetpasssword);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Check your email",
              style: Styles.textStyle32.copyWith(
                color: textTheme.bodyLarge!.color,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "We sent a reset link to contact@dscode...com\nEnter 5 digit code mentioned in the email",
              style: Styles.textStyle14
                  .copyWith(color: textTheme.bodyMedium?.color?.withOpacity(0.7),),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return SizedBox(
                  width: 50,
                  child: TextField(
                    controller: controllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white : Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff8875FF),
                          width: 1.5,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 4) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            CustomButton(
              onTap: () {
                GoRouter.of(context).push(AppRouter.passwordreset);
              },
              text: "Verify Code",
              color: Color(0xff8875FF),
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Haven’t got the email yet? '),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Resend email",
                  style: Styles.textStyle14.copyWith(color: Color(0xff8875FF)),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
