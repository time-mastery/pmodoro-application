import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:pomodore/core/constant/constant.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";
import "package:pomodore/l10n/app_localizations.dart";

import "package:pomodore/features/configuration/presentation/pages/base_page.dart";

/// Splash sequence, told as one pomodoro completing:
/// logo pops in -> ring sweeps a full cycle -> "ding" ripple ->
/// name and tagline settle -> logo hero-flies into the app bar.
class SplashPage extends HookWidget {
  const SplashPage({super.key});

  static const _duration = Duration(milliseconds: 2400);

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final controller = useAnimationController(
      duration: reduceMotion ? const Duration(milliseconds: 600) : _duration,
    );

    useEffect(() {
      void onStatus(AnimationStatus status) {
        if (status == AnimationStatus.completed && context.mounted) {
          Navigator.pushReplacementNamed(context, BasePage.routeName);
        }
      }

      controller
        ..addStatusListener(onStatus)
        ..forward();
      return () => controller.removeStatusListener(onStatus);
    }, [controller]);

    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final logoSize = SizeConfig.widthMultiplier * 30;
    final ringSize = logoSize * 1.55;

    Animation<double> phase(double begin, double end, [Curve curve = Curves.linear]) =>
        CurvedAnimation(
          parent: controller,
          curve: Interval(begin, end, curve: curve),
        );

    final logoIn = phase(0.0, 0.30, Curves.easeOutBack);
    final logoFade = phase(0.0, 0.18, Curves.easeOut);
    final ringSweep = phase(0.10, 0.58, Curves.easeInOutCubic);
    final ripple = phase(0.56, 0.86, Curves.easeOutCubic);
    final titleIn = phase(0.52, 0.82);
    final taglineIn = phase(0.70, 0.92, Curves.easeOut);

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 0.9,
            colors: [
              colors.secondary.withValues(alpha: 0.10),
              theme.scaffoldBackgroundColor,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox.square(
                dimension: ringSize,
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) => CustomPaint(
                    painter: _TimerRingPainter(
                      progress: ringSweep.value,
                      ripple: ripple.value,
                      trackColor: colors.onSurface.withValues(alpha: 0.08),
                      ringColor: colors.primary,
                      accentColor: colors.secondary,
                    ),
                    child: Center(
                      child: Opacity(
                        opacity: logoFade.value,
                        child: Transform.scale(
                          scale: 0.6 + 0.4 * logoIn.value,
                          child: child,
                        ),
                      ),
                    ),
                  ),
                  child: Hero(
                    tag: AppConstant.splashIconHeroTag,
                    child: Image.asset(
                      AppConstant.getLogoPath(context),
                      width: logoSize,
                      height: logoSize,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              _StaggeredTitle(
                text: AppConstant.appName,
                animation: titleIn,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              FadeTransition(
                opacity: taglineIn,
                child: SlideTransition(
                  position: Tween(
                    begin: const Offset(0, 0.4),
                    end: Offset.zero,
                  ).animate(taglineIn),
                  child: Text(
                    AppLocalizations.of(context)!.splashTagline,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      letterSpacing: 2,
                      color: colors.onSurface.withValues(alpha: 0.55),
                    ),
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

/// Letters rise and fade in one after another across [animation].
class _StaggeredTitle extends StatelessWidget {
  const _StaggeredTitle({
    required this.text,
    required this.animation,
    this.style,
  });

  final String text;
  final Animation<double> animation;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final letters = text.characters.toList();
    // Each letter animates over 40% of the window, offsets spread the rest.
    const span = 0.4;
    final step = letters.length > 1 ? (1 - span) / (letters.length - 1) : 0.0;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < letters.length; i++)
            Builder(builder: (context) {
              final start = i * step;
              final t = Curves.easeOutCubic.transform(
                ((animation.value - start) / span).clamp(0.0, 1.0),
              );
              return Opacity(
                opacity: t,
                child: Transform.translate(
                  offset: Offset(0, 14 * (1 - t)),
                  child: Text(letters[i], style: style),
                ),
              );
            }),
        ],
      ),
    );
  }
}

/// Faint track, a sweeping progress arc with an accent head, and an
/// outward ripple once the cycle completes.
class _TimerRingPainter extends CustomPainter {
  _TimerRingPainter({
    required this.progress,
    required this.ripple,
    required this.trackColor,
    required this.ringColor,
    required this.accentColor,
  });

  final double progress;
  final double ripple;
  final Color trackColor;
  final Color ringColor;
  final Color accentColor;

  static const _stroke = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.shortestSide / 2 - _stroke * 2;

    if (ripple > 0 && ripple < 1) {
      canvas.drawCircle(
        center,
        radius + radius * 0.35 * ripple,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = _stroke * (1 - ripple) + 0.5
          ..color = accentColor.withValues(alpha: 0.6 * (1 - ripple)),
      );
    }

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = _stroke
        ..color = trackColor,
    );

    if (progress <= 0) return;

    final sweep = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweep,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = _stroke
        ..strokeCap = StrokeCap.round
        ..color = ringColor,
    );

    if (progress < 1) {
      final angle = -pi / 2 + sweep;
      canvas.drawCircle(
        center + Offset(cos(angle), sin(angle)) * radius,
        _stroke * 1.6,
        Paint()..color = accentColor,
      );
    }
  }

  @override
  bool shouldRepaint(_TimerRingPainter old) =>
      old.progress != progress ||
      old.ripple != ripple ||
      old.ringColor != ringColor ||
      old.accentColor != accentColor ||
      old.trackColor != trackColor;
}
