import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

class ViewModelScope<T extends Object> extends StatefulWidget {
  final T Function(BuildContext context) create;
  final Widget Function(BuildContext context, T viewModel) builder;

  const ViewModelScope({
    super.key,
    required this.create,
    required this.builder,
  });

  @override
  State<ViewModelScope<T>> createState() => _ViewModelScopeState<T>();
}

class _ViewModelScopeState<T extends Object> extends State<ViewModelScope<T>> {
  final Logger logger = Logger('ViewModelScope - ${T.hashCode}');
  late final T viewModel;
  final getIt = GetIt.I;

  @override
  void initState() {
    viewModel = widget.create(context);

    logger.fine(
      'Creating View Model Scope <${T.toString()}> ---- ${runtimeType.hashCode}',
    );
    getIt.registerSingleton<T>(viewModel);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    final disposer = GetIt.I;
    logger.fine(
      'Disposing View Model Scope <${T.toString()}> ---- ${runtimeType.hashCode}',
    );

    if (viewModel is Disposable) {
      (viewModel as Disposable).onDispose();
    }
    disposer.unregister<T>(instance: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, viewModel);
  }
}

abstract class ViewModelBase implements Disposable {
  @protected
  final List<ReactionDisposer> disposers = [];

  @override
  void onDispose() {
    for (final disposer in disposers) {
      disposer();
    }
  }
}
