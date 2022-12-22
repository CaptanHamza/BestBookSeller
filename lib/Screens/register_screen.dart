import 'package:best_book_seller/Globals/colors.dart';
import 'package:flutter/material.dart';
import '../CommonWidget/custom_textfeild.dart';
import '../CommonWidget/header_widget.dart';
import '../CommonWidget/utils.dart';
import '../DataBase/database_helper.dart';
import '../Models/User_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();
  DbHelper dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();
  }

  signUp() async {
    String uname = _conUserName.text.trim();
    String email = _conEmail.text.trim();
    String passwd = _conPassword.text.trim();
    String cpasswd = _conCPassword.text.trim();

    if (formKey.currentState!.validate()) {
      if (passwd != cpasswd) {
        alertDialog(context, 'Password Mismatch');
      } else if(!validateEmail(email)){
alertDialog(context, "Enter Valid Email");
      }
       else {
        formKey.currentState!.save();
        UserModelInfo uModel =
            UserModelInfo(userName: uname, email: email, password: passwd);
        await dbHelper.saveUserInfo(uModel).then((value) {
          if (value!.isSuccess == true) {
            alertDialog(context, value.message.toString());
            Navigator.of(context).pushReplacementNamed('/login');
          } else {
            alertDialog(context, value.message.toString());
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const GenLoginSignUpHeader('Signup'),
                const SizedBox(height: 10.0),
                GetTextFormField(
                    controller: _conUserName,
                    icon: Icons.person_outline,
                    inputType: TextInputType.name,
                    hintName: 'User Name'),
                const SizedBox(height: 10.0),
                GetTextFormField(
                    controller: _conEmail,
                    icon: Icons.email,
                    inputType: TextInputType.emailAddress,
                    hintName: 'Email'),
                const SizedBox(height: 10.0),
                GetTextFormField(
                  controller: _conPassword,
                  icon: Icons.lock,
                  hintName: 'Password',
                  isObscureText: true,
                ),
                const SizedBox(height: 10.0),
                GetTextFormField(
                  controller: _conCPassword,
                  icon: Icons.lock,
                  hintName: 'Confirm Password',
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
                    onPressed: signUp,
                    child: const Text(
                      'Signup',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Does you have account? '),
                    MaterialButton(
                      textColor: goldColor,
                      child: const Text('Sign In'),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
