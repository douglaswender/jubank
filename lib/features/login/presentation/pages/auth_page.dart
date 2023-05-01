import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jubank/features/login/presentation/cubit/auth_cubit.dart';
import 'package:jubank/features/login/presentation/cubit/auth_state.dart';
import 'package:jubank/utils/shared/widgets/primary_button_widget.dart';
import 'package:jubank/utils/shared/widgets/text_field_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final controller = Modular.get<AuthBloc>();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: controller,
      listener: (context, state) {
        if (state is AuthSuccess) {
          Modular.to.navigate('/');
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  'assets/wallpaper.jpeg',
                  fit: BoxFit.fitHeight,
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextFieldWidget(
                                controller: controller.emailController,
                                labelText: 'Email',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor informe um email';
                                  }
                                  if (!EmailValidator.validate(value)) {
                                    return 'Por favor informe um email válido';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFieldWidget(
                                controller: controller.passwordController,
                                labelText: 'Senha',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor informe um email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              BlocBuilder<AuthBloc, AuthState>(
                                bloc: controller,
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    loading: () {
                                      return PrimaryButtonWidget(
                                          onTap: () {}, text: '');
                                    },
                                    orElse: () {
                                      return PrimaryButtonWidget(
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              controller.signIn(
                                                  email: controller
                                                      .emailController.text,
                                                  password: controller
                                                      .passwordController.text);
                                            }
                                          },
                                          text: 'Continuar');
                                    },
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text('Ou'),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Text('Não tem uma conta?'),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text('Crie uma')),
                                  const Expanded(child: SizedBox()),
                                  Image.asset(
                                    'assets/juban.png',
                                    height: 64,
                                    width: 64,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
