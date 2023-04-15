import 'package:flutter/material.dart';

import 'behaviour.dart';

/// Um componente pode ser renderizado em diferentes contextos. Esses contextos
/// são chamados de Behaviour.
///
/// ### SUCCESS
/// É o uso padrão do componente.
///
/// ### LOADING
/// Define como o componente deve ser quando estiver em processo de loading.
///
/// ### DISABLED
/// Define como o componente deve ser quando estiver desabilitado.
///
/// ### ERROR
/// Define como o componente deve ser mostrado
/// quando a aplicação está em um estado de erro.
///
/// /// ### EMPTY
/// Define como o componente deve ser mostrado
/// quando a aplicação está vazio.

abstract class BaseComponent {
  Widget whenSuccess(
    BuildContext context,
    Behaviour childBehaviour,
  );

  Widget whenLoading(
    BuildContext context,
    Behaviour childBehaviour,
  );

  Widget whenError(
    BuildContext context,
    Behaviour childBehaviour,
  );

  Widget whenDisabled(
    BuildContext context,
    Behaviour childBehaviour,
  );

  Widget whenEmpty(
    BuildContext context,
    Behaviour childBehaviour,
  );

  Map<Behaviour, Behaviour>? get delegate;

  Widget render({
    required BuildContext context,
    required Behaviour behaviour,
  });
}
