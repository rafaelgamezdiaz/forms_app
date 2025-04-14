import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: BlocProvider(
        create: (_) => RegisterCubit(),
        child: _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              FlutterLogo(size: 150, style: FlutterLogoStyle.horizontal),

              const SizedBox(height: 20),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    final colors = Theme.of(context).colorScheme;
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre usuario',
            hint: 'Escribe tu username',
            icon: Icon(Icons.person_outline_rounded, color: colors.primary),
            onChanged: registerCubit.usernameChanged,
            errorText: username.errorMessage,
          ),

          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Correo Electrónico',
            hint: 'Email',
            icon: Icon(Icons.person_outline_rounded, color: colors.primary),
            onChanged: registerCubit.emailChanged,
            errorText: email.errorMessage,
          ),
          const SizedBox(height: 20),

          CustomTextFormField(
            label: 'Contraseña',
            hint: 'Ingrese la contraseña',
            icon: Icon(Icons.password_rounded, color: colors.primary),
            obscure: true,
            onChanged: registerCubit.passwordChanged,
            errorText: password.errorMessage,
          ),
          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            label: Text('Register'),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
