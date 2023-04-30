import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/core/shared_widgets/custom_form_field.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";

import "../../../../exports.dart";

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AuthView();
  }
}

class AuthView extends HookWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isSignUp = useState(false);
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: const BaseAppBar(
        title: "User",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Icon(
                Icons.person,
                size: 100,
              ),
              20.spaceH(),
              if (isSignUp.value)
                Column(
                  children: [
                    const CustomFormField(
                      hint: "Full name",
                    ),
                    10.spaceH(),
                    const CustomFormField(
                      hint: "Email",
                    ),
                    10.spaceH(),
                  ],
                ),
              const CustomFormField(
                hint: "Username",
              ),
              10.spaceH(),
              const CustomFormField(
                hint: "Password",
                isPasswordField: true,
              ),
              10.spaceH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Forget password",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ),
              30.spaceH(),
              GlobalButton(
                title: isSignUp.value ? "Sign Up" : "Sign In",
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.zero,
                onPressed: () {},
              ),
              10.spaceH(),
              InkWell(
                onTap: () {
                  isSignUp.value = !isSignUp.value;
                },
                child: Text(
                  isSignUp.value
                      ? "Do you have an account ?"
                      : "Register new account!",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
