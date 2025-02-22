import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/features/authentication/authentication_providers.dart";

class OtpTimerWidget extends ConsumerWidget {
  const OtpTimerWidget({required this.email, super.key});

  final String email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerStateProvider);

    return switch (state) {
      TimerState.finished => TryAgainOtp(email: email),
      TimerState.inProgress => const ExpirationTimer()
    };
  }
}

class TryAgainOtp extends ConsumerWidget {
  const TryAgainOtp({required this.email, super.key});

  final String email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Center(
      child: SizedBox(
        height: 24,
        child: InkWell(
          onTap: () {
            ref.read(generateOTPProvider.notifier).generateOTP(email).then(
              (value) {
                ref.invalidate(expirationTimerProvider);
              },
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.refresh,
                color: theme.colorScheme.onSurface,
                size: 16,
              ),
              const SizedBox(width: 10),
              Text(
                "Try again",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpirationTimer extends ConsumerStatefulWidget {
  const ExpirationTimer({super.key});

  @override
  ConsumerState<ExpirationTimer> createState() => _ExpirationTimerState();
}

class _ExpirationTimerState extends ConsumerState<ExpirationTimer> {
  int timerTickerValue = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ref.watch(expirationTimerProvider).whenData(
          (value) => timerTickerValue = value,
        );

    return Center(
      child: SizedBox(
        height: 24,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: Text(
                key: ValueKey<int>(timerTickerValue),
                "${timerTickerValue.toString()} ",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            Text(
              "Seconds remaining",
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
