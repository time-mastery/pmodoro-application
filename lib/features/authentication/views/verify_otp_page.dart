import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pinput/pinput.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";

class VerifyOtpPage extends ConsumerWidget {
  const VerifyOtpPage({super.key, required this.email});

  final String email;

  static const routeName = "/verify-otp";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();

    var defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify OTP"),
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
              const SizedBox(height: 16.0),
              Text(
                "Enter the OTP sent to:",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                email,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 16.0),
              Pinput(
                onCompleted: (pin) => print(pin),
                defaultPinTheme: defaultPinTheme,
                length: 6,
              ),
              const Spacer(
                flex: 1,
              ),
              GlobalButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                child: const Text("Submit"),
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
