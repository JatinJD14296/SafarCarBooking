import 'dart:html';
import '../../common/validation/validation_stream_controller.dart';
import '../../common/widgets/buttons.dart';
import '../../common/widgets/field_and_label.dart';
import '../../common/widgets/icon_and_images.dart';
import '../../common/widgets/padding_margin.dart';
import '../../common/widgets/space_and_dividers.dart';
import '../../common/widgets/text_and_styles.dart';
import '../../network/firestore_instance.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/navigator_route.dart';
import '../../utils/screen_utils.dart';
import '../../utils/strings.dart';

class LogInScreen extends StatefulWidget {
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State <LogInScreen> {
  bool passVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String emailErrorMsg = "";
  String passwordErrorMsg = "";

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Screen.screenHeight,
        width: Screen.screenWidth,
        child: ListView(
          children: [
            Container(
              margin: paddingAll(Screen.screenWidth * 0.2),
              child: Images.instance.assetImage(name: app_logo1),
            ),
            Card(
              elevation: 10.0,
              margin: paddingSymmetric(horizontal: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: paddingAll(20.0),
                child: Column(
                  children: [
                    labels(
                      text: login,
                      size: 24.0,
                      color: iconTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                    verticalSpace(20.0),
                    FieldAndLabel(
                      labelValue: email,
                      hint: enter_email,
                      labelTextColor: iconTextColor,
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                      validationMessage: emailErrorMsg,
                      fillColor: white,
                      onChanged: (value) {
                        setState(() {
                          emailErrorMsg = emailValidationMsg(value);
                        });
                      },
                    ),
                    verticalSpace(20.0),
                    FieldAndLabel(
                      labelValue: password,
                      hint: enter_password,
                      labelTextColor: iconTextColor,
                      isPassword: passVisible,
                      controller: passwordController,
                      validationMessage: passwordErrorMsg,
                      fillColor: white,
                      onChanged: (value) {
                        setState(() {
                          passwordErrorMsg = passwordValidationMsg(value);
                        });
                      },
                      rightIcon: iconButton(
                        onTap: () {
                          setState(() {
                            passVisible = !passVisible;
                          });
                        },
                        icon: icons(
                          icon: passVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    verticalSpace(30.0),
                    logInButton(
                        text: login,
                        isBorder: false,
                        backgroundColor: primaryYellow,
                        textColor: iconTextColor,
                        onPressed: () {
                          setState(() {
                            emailErrorMsg =
                                emailValidationMsg(emailController.text);
                            passwordErrorMsg =
                                passwordValidationMsg(passwordController.text);
                          });
                          bool credential = false;

                          if (emailErrorMsg == "" && passwordErrorMsg == ""){
                            FireBaseDatabaseInstance.adminDatabase
                                .once()
                                .then((value) async {
                              value.value.forEach((k, v) {
                                print(v);
                                if (v[db_email] == emailController.text &&
                                    v[db_password] == passwordController.text) {
                                  credential = true;
                                }
                              });
                              if (credential) {
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                pref.setString(login, login);
                                Navigator.pushNamed(context, dashboardScreen);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(enter_valid_credential),
                                  ),
                                );
                              }
                            });
                          }
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
