/// Comportamento dos componentes
enum Behaviour {
  success,
  loading,
  error,
  empty,
  disabled,
}

/// Utilitário que ajuda a definir quais comportamentos (Behaviours) o componente deve implementar.

class BehaviourHelper {
  static const Map<Behaviour, Behaviour> onlySuccess = {
    Behaviour.loading: Behaviour.success,
    Behaviour.error: Behaviour.success,
    Behaviour.disabled: Behaviour.success,
    Behaviour.empty: Behaviour.success
  };

  static const Map<Behaviour, Behaviour> successAndLoading = {
    Behaviour.error: Behaviour.success,
    Behaviour.disabled: Behaviour.success,
    Behaviour.empty: Behaviour.success
  };

  static const Map<Behaviour, Behaviour> successAndDisabled = {
    Behaviour.loading: Behaviour.success,
    Behaviour.error: Behaviour.success,
    Behaviour.empty: Behaviour.success
  };

  static const Map<Behaviour, Behaviour> successAndEmpty = {
    Behaviour.loading: Behaviour.success,
    Behaviour.error: Behaviour.success,
    Behaviour.disabled: Behaviour.success
  };

  static const Map<Behaviour, Behaviour> successLoadingAndEmpty = {
    Behaviour.error: Behaviour.success,
    Behaviour.disabled: Behaviour.success,
  };

  static const Map<Behaviour, Behaviour> exceptDisabled = {
    Behaviour.disabled: Behaviour.success,
  };

  static const Map<Behaviour, Behaviour> buttons = {
    Behaviour.error: Behaviour.success,
    Behaviour.empty: Behaviour.success,
  };

  static const Map<Behaviour, Behaviour> successAndError = {
    Behaviour.empty: Behaviour.success,
    Behaviour.disabled: Behaviour.success,
    Behaviour.loading: Behaviour.success,
  };

  static const Map<Behaviour, Behaviour> exceptEmpty = {
    Behaviour.empty: Behaviour.success,
  };

  static const Map<Behaviour, Behaviour> successAndErrorAndDisabled = {
    Behaviour.loading: Behaviour.success,
    Behaviour.empty: Behaviour.success,
  };

  static const Map<Behaviour, Behaviour> successAndLoadingAndDisabled = {
    Behaviour.empty: Behaviour.success,
    Behaviour.error: Behaviour.success,
  };

  static Behaviour childBehaviour({
    required Behaviour behaviour,
    required Map<Behaviour, Behaviour>? delegate,
  }) =>
      delegate != null ? delegate[behaviour] ?? behaviour : behaviour;
}
