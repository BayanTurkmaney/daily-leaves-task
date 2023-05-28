import 'dart:async';

import 'package:daily_leaves_task/core/utils/strings/theme.dart';
import 'package:daily_leaves_task/core/utils/styles.dart';
import 'package:daily_leaves_task/core/widgets/crclprgs.dart';
import 'package:daily_leaves_task/core/widgets/vertical_box.dart';
import 'package:daily_leaves_task/features/auth/domain/usecases/login/login_params.dart';
import 'package:daily_leaves_task/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

import 'package:daily_leaves_task/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/snackbar_message.dart';
import '../../../leaves/presentation/pages/leaves.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.backgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSucces) {
            SnackBarMessage().ShowSuccessSnackBar(
                message: 'sucess login..', context: context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => SecondPage()),
                (route) => false);
          } else if (state is LoginFailure) {
            SnackBarMessage()
                .ShowErrorSnackBar(message: state.message!, context: context);
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const CircleIndicator();
          }
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: LoginPageBdy(),
          );
        },
      ),
    );
  }
}

class LoginPageBdy extends StatelessWidget {
  const LoginPageBdy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const WelcomeWidget(),
          Text(
            'Please Login To Your Account',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          VerticalBox(
            height: 20,
          ),
          const LoginFormWidget(),
        ],
      ),
    );
  }
}

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      TextEditingController _usernameController =TextEditingController();
  TextEditingController _passwordController =TextEditingController();
  GlobalKey<FormState> _key=GlobalKey<FormState>();
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          VerticalBox(height: 10,),
          FormTextWidget(
            controller:_usernameController,
            isObsecure: false,
            onSaved: (s) {},
            validator: (s) {},
          ),
           VerticalBox(height: 20,),
          Text(
            'Password',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          VerticalBox(height: 10,),
          FormTextWidget(
            controller:_passwordController,
            isObsecure: true,
            onSaved: (s) {s=_usernameController.text;},
            validator: (s) {s=_passwordController.text;},
          ),
          VerticalBox(height: 50,),
          SizedBox(
            width: 350,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorSystem.purple),
                onPressed: () {
                  if(_key.currentState!.validate()){
                    _key.currentState!.save();
                  
                  LoginParams params =
                      LoginParams(username: _usernameController.text, password: _passwordController.text);
                  context.read<AuthBloc>()
                    ..add(
                        LoginWithCredentialsPressedEvent(loginParams: params));}
                        else print('invalid input...');
                },
                child: Text(
                  'Login',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: ColorSystem.whiteColor),
                )),
          )
        ],
      ),
    );
  }
}

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 300,
      child: SvgPicture.asset('assets/images/Welcome.svg'),
    );
  }
}
