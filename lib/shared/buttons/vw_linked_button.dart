import 'package:flutter/material.dart';
import 'package:valowiki/services/url_launcher_service.dart';
import 'package:valowiki/shared/vw_ink_well.dart';

class VWLinkedButton extends StatelessWidget {
  final String link;
  final String label;
  const VWLinkedButton({
    super.key,
    this.label = '',
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label.isEmpty ? '' : '$label: ',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Flexible(
          child: VWInkWell(
            onTap: () {
              UrlLauncherService.launchUrlEA(link);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                link,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
