import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";
import "package:pomodore/features/authentication/authentication_providers.dart";
import "package:pomodore/features/authentication/views/verify_otp_page.dart";

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  static const routeName = "/login";

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncData = ref.watch(generateOTPProvider);
    ref.listen<AsyncValue<bool>>(
      generateOTPProvider,
      (_, state) {
        state.when(
          data: (value) {
            if (value) {
              if (mounted) {
                Navigator.of(context).pushNamed(
                  VerifyOtpPage.routeName,
                  arguments: emailController.text,
                );
              }
            }
          },
          loading: () {},
          error: (error, _) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error.toString()),
                ),
              );
            }
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(
                flex: 4,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              const Spacer(
                flex: 1,
              ),
              GlobalButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ref
                        .read(generateOTPProvider.notifier)
                        .generateOTP(emailController.text);
                  }
                },
                child: asyncData.isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Submit"),
              ),
              const Spacer(
                flex: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
