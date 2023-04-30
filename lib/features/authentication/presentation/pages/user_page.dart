import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:ionicons/ionicons.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/core/shared_widgets/custom_form_field.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";

import "../../../../exports.dart";

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}

class ProfileView extends HookWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: BaseAppBar(title: localization.profileTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Column(
          children: [
            const Icon(
              Ionicons.person_circle,
              size: 120,
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${localization.nameHint} : asdfasdf"),
                      8.spaceH(),
                      Text("${localization.emailHint} : asdfasdf"),
                      8.spaceH(),
                      Text("${localization.usernameHint} : asdfasdf"),
                      8.spaceH(),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.refresh,
                              size: 15,
                            ),
                            10.spaceW(),
                            Text(
                              localization.lastSync
                                  .replaceAll("#", "12-9-2023"),
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            GlobalButton(
              width: double.infinity,
              height: 50,
              backgroundColor: Theme.of(context).colorScheme.error,
              title: localization.logoutButton,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class AuthView extends HookWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isSignUp = useState(false);
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: BaseAppBar(
        title: localization.userTitle,
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
                    CustomFormField(
                      hint: localization.nameHint,
                    ),
                    10.spaceH(),
                    CustomFormField(
                      hint: localization.emailHint,
                    ),
                    10.spaceH(),
                  ],
                ),
              CustomFormField(
                hint: localization.emailHint,
              ),
              10.spaceH(),
              CustomFormField(
                hint: localization.passwordHint,
                isPasswordField: true,
              ),
              10.spaceH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      localization.forgetPasswordHint,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ),
              30.spaceH(),
              GlobalButton(
                title: isSignUp.value
                    ? localization.signUpBtn
                    : localization.signInBtn,
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
                      ? localization.doYouHaveAcc
                      : localization.registerNewAccount,
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
