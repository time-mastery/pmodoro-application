import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pinput/pinput.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";
import "package:pomodore/features/authentication/authentication_providers.dart";
import "package:pomodore/features/authentication/views/otp_timer_widget.dart";
import "package:pomodore/features/configuration/presentation/pages/base_page.dart";

class VerifyOtpPage extends ConsumerStatefulWidget {
  const VerifyOtpPage({super.key, required this.email});

  final String email;

  static const routeName = "/verify-otp";

  @override
  ConsumerState<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends ConsumerState<VerifyOtpPage> {
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      verifyOtpProvider,
      (previous, next) {
        next.whenOrNull(
          error: (error, stackTrace) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                backgroundColor: Colors.red,
              ),
            );
          },
          data: (value) {
            if (value) {
              if (mounted) {
                Navigator.of(context).pushReplacementNamed(BasePage.routeName);
              }
            }
          },
          loading: () {},
        );
      },
    );

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
                widget.email,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 16.0),
              Pinput(
                controller: otpController,
                onCompleted: (pin) {
                  print(pin);
                },
                defaultPinTheme: defaultPinTheme,
                length: 6,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter OTP";
                  }
                  if (value.length != 6) {
                    return "OTP must be 6 digits";
                  }
                  if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
                    return "OTP must contain only numbers";
                  }
                  return null;
                },
              ),
              const Spacer(
                flex: 1,
              ),
              GlobalButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ref.read(verifyOtpProvider.notifier).submitRecievedOTP(
                          widget.email,
                          otpController.text,
                        );
                  }
                },
                child: const Text("Submit"),
              ),
              const Spacer(
                flex: 1,
              ),
              const OtpTimerWidget(email: "asdf"),
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
