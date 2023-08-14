import 'package:flutter/cupertino.dart';
import 'package:test_chat_app/core/theme/colors/theme_colors.dart';
import 'package:test_chat_app/core/theme/text/theme_text_styles.dart';
import 'package:test_chat_app/core/utils/app_utils.dart';

class ReceiverMessageWidget extends StatelessWidget {
  const ReceiverMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints(
        maxWidth: width * 0.8,
        minWidth: width * 0.1,
      ),
      padding: AppUtils.kPaddingVer12Hor16,
      decoration: const BoxDecoration(
        borderRadius: AppUtils.kBorderRadius15,
        color: ThemeColors.secondaryColor,
      ),
      child: const Text(
        "Создать заявку в IT support",
        style: ThemeTextStyles.messageTextStyle,
      ),
    );
  }
}
