part of easy_refresh;

/// Header indicator.
abstract class Header extends Indicator {
  const Header({
    required double triggerOffset,
    required bool clamping,
    Duration processedDuration = const Duration(seconds: 1),
    SpringDescription? spring,
    SpringDescription? horizontalSpring,
    SpringBuilder? readySpringBuilder,
    SpringBuilder? horizontalReadySpringBuilder,
    bool springRebound = true,
    FrictionFactor? frictionFactor,
    FrictionFactor? horizontalFrictionFactor,
    bool safeArea = true,
    double? infiniteOffset,
    bool? hitOver,
    bool? infiniteHitOver,
    IndicatorPosition position = IndicatorPosition.above,
    bool hapticFeedback = false,
    double? secondaryTriggerOffset,
    double secondaryVelocity = kDefaultSecondaryVelocity,
    double? secondaryDimension,
    bool notifyWhenInvisible = false,
    IndicatorStateListenable? listenable,
  }) : super(
          triggerOffset: triggerOffset,
          clamping: clamping,
          processedDuration: processedDuration,
          spring: spring,
          horizontalSpring: horizontalSpring,
          readySpringBuilder: readySpringBuilder,
          horizontalReadySpringBuilder: horizontalReadySpringBuilder,
          springRebound: springRebound,
          frictionFactor: frictionFactor,
          horizontalFrictionFactor: horizontalFrictionFactor,
          safeArea: safeArea,
          infiniteOffset: infiniteOffset,
          hitOver: hitOver,
          infiniteHitOver: infiniteHitOver,
          position: position,
          hapticFeedback: hapticFeedback,
          secondaryTriggerOffset: secondaryTriggerOffset,
          secondaryVelocity: secondaryVelocity,
          secondaryDimension: secondaryDimension,
          notifyWhenInvisible: notifyWhenInvisible,
          listenable: listenable,
        );
}

/// Build header widget use [IndicatorBuilder].
class BuilderHeader extends Header {
  /// Header widget builder.
  final IndicatorBuilder builder;

  const BuilderHeader({
    required this.builder,
    required double triggerOffset,
    required bool clamping,
    required IndicatorPosition position,
    Duration processedDuration = const Duration(seconds: 1),
    SpringDescription? spring,
    SpringDescription? horizontalSpring,
    SpringBuilder? readySpringBuilder,
    SpringBuilder? horizontalReadySpringBuilder,
    bool springRebound = true,
    FrictionFactor? frictionFactor,
    FrictionFactor? horizontalFrictionFactor,
    bool safeArea = true,
    double? infiniteOffset,
    bool? hitOver,
    bool? infiniteHitOver,
    bool hapticFeedback = false,
    double? secondaryTriggerOffset,
    double secondaryVelocity = kDefaultSecondaryVelocity,
    double? secondaryDimension,
    bool notifyWhenInvisible = false,
    IndicatorStateListenable? listenable,
  }) : super(
          triggerOffset: triggerOffset,
          clamping: clamping,
          processedDuration: processedDuration,
          spring: spring,
          horizontalSpring: horizontalSpring,
          readySpringBuilder: readySpringBuilder,
          horizontalReadySpringBuilder: horizontalReadySpringBuilder,
          springRebound: springRebound,
          frictionFactor: frictionFactor,
          horizontalFrictionFactor: horizontalFrictionFactor,
          safeArea: safeArea,
          infiniteOffset: infiniteOffset,
          hitOver: hitOver,
          infiniteHitOver: infiniteHitOver,
          position: position,
          secondaryTriggerOffset: secondaryTriggerOffset,
          secondaryVelocity: secondaryVelocity,
          hapticFeedback: hapticFeedback,
          secondaryDimension: secondaryDimension,
          notifyWhenInvisible: notifyWhenInvisible,
          listenable: listenable,
        );

  @override
  Widget build(BuildContext context, IndicatorState state) {
    return builder(context, state);
  }
}

/// Listener header.
/// Listen to the indicator state and respond anywhere.
class ListenerHeader extends Header {
  const ListenerHeader({
    required IndicatorStateListenable listenable,
    required double triggerOffset,
    bool clamping = true,
    Duration processedDuration = const Duration(seconds: 1),
    SpringDescription? spring,
    SpringDescription? horizontalSpring,
    SpringBuilder? readySpringBuilder,
    SpringBuilder? horizontalReadySpringBuilder,
    bool springRebound = true,
    FrictionFactor? frictionFactor,
    FrictionFactor? horizontalFrictionFactor,
    bool safeArea = true,
    double? infiniteOffset,
    bool? hitOver,
    bool? infiniteHitOver,
    bool hapticFeedback = false,
    double? secondaryTriggerOffset,
    double secondaryVelocity = kDefaultSecondaryVelocity,
    double? secondaryDimension,
    bool notifyWhenInvisible = false,
  }) : super(
          triggerOffset: triggerOffset,
          clamping: clamping,
          processedDuration: processedDuration,
          spring: spring,
          horizontalSpring: horizontalSpring,
          readySpringBuilder: readySpringBuilder,
          horizontalReadySpringBuilder: horizontalReadySpringBuilder,
          springRebound: springRebound,
          frictionFactor: frictionFactor,
          horizontalFrictionFactor: horizontalFrictionFactor,
          safeArea: safeArea,
          infiniteOffset: infiniteOffset,
          hitOver: hitOver,
          infiniteHitOver: infiniteHitOver,
          position: IndicatorPosition.custom,
          hapticFeedback: hapticFeedback,
          secondaryTriggerOffset: secondaryTriggerOffset,
          secondaryVelocity: secondaryVelocity,
          secondaryDimension: secondaryDimension,
          notifyWhenInvisible: notifyWhenInvisible,
          listenable: listenable,
        );

  @override
  Widget build(BuildContext context, IndicatorState state) {
    return const SizedBox();
  }
}

/// Secondary header.
/// Combine existing [Header] with secondary.
abstract class SecondaryHeader extends Header {
  /// Existing [Header].
  final Header header;

  SecondaryHeader({
    required this.header,
    required double secondaryTriggerOffset,
    double secondaryVelocity = kDefaultSecondaryVelocity,
    double? secondaryDimension,
    IndicatorStateListenable? listenable,
  }) : super(
          triggerOffset: header.triggerOffset,
          clamping: header.clamping,
          processedDuration: header.processedDuration,
          spring: header.spring,
          horizontalSpring: header.horizontalSpring,
          readySpringBuilder: header.readySpringBuilder,
          horizontalReadySpringBuilder: header.horizontalReadySpringBuilder,
          springRebound: header.springRebound,
          frictionFactor: header.frictionFactor,
          horizontalFrictionFactor: header.horizontalFrictionFactor,
          safeArea: header.safeArea,
          infiniteOffset: header.infiniteOffset,
          hitOver: header.hitOver,
          infiniteHitOver: header.infiniteHitOver,
          position: header.position,
          hapticFeedback: header.hapticFeedback,
          secondaryTriggerOffset: secondaryTriggerOffset,
          secondaryVelocity: secondaryVelocity,
          secondaryDimension: secondaryDimension,
          notifyWhenInvisible: header.notifyWhenInvisible,
          listenable: listenable ?? header.listenable,
        );

  @override
  Widget build(BuildContext context, IndicatorState state) {
    return secondaryBuild(context, state, header);
  }

  Widget secondaryBuild(
      BuildContext context, IndicatorState state, Indicator indicator);
}

/// Secondary builder header.
class SecondaryBuilderHeader extends SecondaryHeader {
  /// Header widget builder.
  final SecondaryIndicatorBuilder builder;

  SecondaryBuilderHeader({
    required Header header,
    required this.builder,
    required double secondaryTriggerOffset,
    double secondaryVelocity = kDefaultSecondaryVelocity,
    double? secondaryDimension,
    IndicatorStateListenable? listenable,
  }) : super(
          header: header,
          secondaryTriggerOffset: secondaryTriggerOffset,
          secondaryVelocity: secondaryVelocity,
          secondaryDimension: secondaryDimension,
          listenable: listenable,
        );

  @override
  Widget secondaryBuild(
      BuildContext context, IndicatorState state, Indicator indicator) {
    return builder(context, state, indicator);
  }
}

/// Parameters when [EasyRefresh.onRefresh] is null.
/// Overscroll behavior of [ScrollView].
class NotRefreshHeader extends Header {
  const NotRefreshHeader({
    bool clamping = false,
    SpringDescription? spring,
    SpringDescription? horizontalSpring,
    FrictionFactor? frictionFactor,
    FrictionFactor? horizontalFrictionFactor,
  }) : super(
          triggerOffset: 0,
          clamping: clamping,
          position: IndicatorPosition.custom,
          spring: spring,
          horizontalSpring: horizontalSpring,
          frictionFactor: frictionFactor,
          horizontalFrictionFactor: horizontalFrictionFactor,
          processedDuration: const Duration(seconds: 0),
        );

  @override
  Widget build(BuildContext context, IndicatorState state) {
    return const SizedBox();
  }
}
