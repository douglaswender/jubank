import 'package:flutter/material.dart';

import 'base_component.dart';
import 'behaviour.dart';

abstract class Component implements BaseComponent {
  @override
  Widget whenSuccess(
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    throw ("$this does not implements Behaviour.success");
  }

  @override
  Widget whenLoading(
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    throw ("$this does not implements Behaviour.loading");
  }

  @override
  Widget whenError(
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    throw ("$this does not implements Behaviour.error");
  }

  @override
  Widget whenDisabled(
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    throw ("$this does not implements Behaviour.disabled");
  }

  @override
  Widget whenEmpty(
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    throw ("$this does not implements Behaviour.empty");
  }

  @override
  Widget render({
    required BuildContext context,
    required Behaviour behaviour,
  }) {
    final actualBehaviour = BehaviourHelper.childBehaviour(
        behaviour: behaviour, delegate: delegate);

    switch (actualBehaviour) {
      case Behaviour.success:
        return whenSuccess(
          context,
          actualBehaviour,
        );

      case Behaviour.loading:
        return whenLoading(
          context,
          actualBehaviour,
        );

      case Behaviour.error:
        return whenError(
          context,
          actualBehaviour,
        );

      case Behaviour.empty:
        return whenEmpty(
          context,
          actualBehaviour,
        );

      case Behaviour.disabled:
        return whenDisabled(
          context,
          actualBehaviour,
        );

      default:
        throw "$behaviour is not implemented for $this";
    }
  }
}
