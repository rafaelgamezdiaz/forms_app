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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Ya no tendremos estas propiedades dentro del _RegisterFormState pues vamos a manejar el formulario con Cubits
  // String username = '';
  // String email = '';
  // String password = '';

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    final colors = Theme.of(context).colorScheme;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre usuario',
            hint: 'Escribe tu username',
            icon: Icon(Icons.person_outline_rounded, color: colors.primary),
            // errorText: 'Este campo no puede estar vacío ok',
            onChanged: (value) {
              registerCubit.usernameChanged(value);
              _formKey.currentState?.validate();
            }, // (value) => username = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo no puede estar vacío';
              }
              if (value.trim().length < 6) {
                return 'El nombre de usuario debe tener al menos 6 caracteres';
              }
              return null;
            },
          ),

          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Correo Electrónico',
            hint: 'Email',
            icon: Icon(Icons.person_outline_rounded, color: colors.primary),
            onChanged: (value) {
              registerCubit.emailChanged(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo no puede estar vacío';
              }
              if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(value)) {
                return 'Ingrese un correo electrónico válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          CustomTextFormField(
            label: 'Contraseña',
            hint: 'Ingrese la contraseña',
            icon: Icon(Icons.password_rounded, color: colors.primary),
            obscure: true,
            onChanged: (value) {
              registerCubit.passwordChanged(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo no puede estar vacío';
              }
              if (value.trim().length < 6) {
                return 'La contraseña debe tener al menos 6 caracteres';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () {
              // final isValid = _formKey.currentState!.validate();
              // if (!isValid) return;

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
