import 'package:best_book_seller/Globals/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../CommonWidget/custom_textfeild.dart';
import '../CommonWidget/header_widget.dart';
import '../CommonWidget/utils.dart';
import '../DataBase/database_helper.dart';
import '../Models/User_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey formKey = GlobalKey<FormState>();
  SharedPreferences? pref;
  final _conUseremail = TextEditingController();
  final _conPassword = TextEditingController();
  DbHelper dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String email = _conUseremail.text;
    String passwd = _conPassword.text;

    if (_conUseremail.text.isEmpty) {
      alertDialog(context, "Please Enter User Email");
    } else if (passwd.isEmpty) {
      alertDialog(context, "Please Enter Password");
    }
      else if(!validateEmail(email)){
alertDialog(context, "Enter Valid Email");
      }
     else {
      UserModelInfo userModel = UserModelInfo(email: email, password: passwd);
      await dbHelper.getLoginUser(userModel).then((userData) async {
        if (userData!.isSuccess == true) {
          pref = await SharedPreferences.getInstance();
          pref!.setBool("isLogin", true);
          // ignore: use_build_context_synchronously
          alertDialog(context, userData.message.toString());
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          alertDialog(context, userData.message.toString());
        }
      }).catchError((error) {
           alertDialog(context, error.toString());
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GenLoginSignUpHeader('Login'),
              GetTextFormField(
                controller: _conUseremail,
                icon: Icons.person,
                hintName: 'User Email',
              ),
              const SizedBox(height: 10.0),
              GetTextFormField(
                controller: _conPassword,
                icon: Icons.lock,
                hintName: 'Password',
                isObscureText: true,
              ),
              Container(
                margin: const EdgeInsets.all(30.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: MaterialButton(
                  onPressed: login,
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Does not have account? '),
                  MaterialButton(
                    textColor: goldColor,
                    child: const Text('Signup'),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/register');
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
