import 'package:flutter/material.dart';
import 'package:valowiki/shared/vw_loader.dart';

class VWFutureOverlay extends StatefulWidget {
  final Widget Function(VoidCallback action) child;
  final Future Function() future;
  final VoidCallback? onOk;

  const VWFutureOverlay({
    super.key,
    this.onOk,
    required this.future,
    required this.child,
  });

  @override
  State<VWFutureOverlay> createState() => _VWFutureOverlayState();
}

class _VWFutureOverlayState extends State<VWFutureOverlay> {
  late final OverlayEntry _overlay;

  @override
  void initState() {
    _overlay = OverlayEntry(builder: (_) {
      return Container(
        color: Theme.of(context).colorScheme.secondary.withOpacity(.2),
        child: const VWLoader(),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    disposeOverlay();
    super.dispose();
  }

  void disposeOverlay() {
    if (_overlay.mounted) {
      _overlay.remove();
    }
    _overlay.dispose();
  }

  void execute() async {
    try {
      Overlay.of(context).insert(_overlay);
      await widget.future();
    } catch (e) {
      rethrow;
    } finally {
      disposeOverlay();
      if (widget.onOk != null) {
        widget.onOk!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child(execute);
  }
}
