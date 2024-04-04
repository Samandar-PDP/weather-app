import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class Aspect extends StatelessWidget {
  const Aspect({super.key, required this.icon, required this.data});
  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon,color: CupertinoColors.white),
        const Gap(10),
        Text(data,style: const TextStyle(color: CupertinoColors.white))
      ],
    );
  }
}
