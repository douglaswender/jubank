import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jubank/features/login/presentation/cubit/auth_cubit.dart';
import 'package:jubank/utils/shared/widgets/primary_button_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final auth = Modular.get<AuthBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          PrimaryButtonWidget(
              onTap: () async {
                Modular.to.navigate('/auth');
                auth.signOut();
              },
              text: 'Sair'),
        ],
      )),
    );
  }
}
