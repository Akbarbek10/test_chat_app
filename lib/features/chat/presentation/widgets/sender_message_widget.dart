// import 'package:flutter/cupertino.dart';
// import 'package:test_chat_app/core/theme/colors/theme_colors.dart';
// import 'package:test_chat_app/core/theme/text/theme_text_styles.dart';
// import 'package:test_chat_app/core/utils/app_utils.dart';
//
// class SenderMessageWidget extends StatelessWidget {
//   const SenderMessageWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: AppUtils.kPaddingVer12Hor16,
//       decoration: BoxDecoration(
//         borderRadius: AppUtils.kBorderRadius15,
//         color: ThemeColors.white,
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             child: Column(
//               children: [
//                 Text(
//                   "Здравствуйте, чем могу помочь?",
//                   style: ThemeTextStyles.messageTextStyle.copyWith(
//                     color: ThemeColors.chatTitleColor,
//                   ),
//                 ),
//                 Text(""),
//               ],
//             ),
//           ),
//           Positioned(
//             right: 0,
//             bottom: 0,
//             child: Text(
//               "12:02",
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:test_chat_app/core/theme/colors/theme_colors.dart';
import 'package:test_chat_app/core/theme/text/theme_text_styles.dart';
import 'package:test_chat_app/core/utils/app_utils.dart';

class SenderMessageWidget extends StatelessWidget {
  const SenderMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned(
          child: Container(
            padding: AppUtils.kPaddingVer12Hor16,
            constraints: BoxConstraints(
              maxWidth: width * 0.8,
              minWidth: width * 0.1,
            ),
            decoration: const BoxDecoration(
              borderRadius: AppUtils.kBorderTop25BottomRight25BottomLeft0,
              color: ThemeColors.white,
            ),
            child: Column(
              children: [
                Text(
                  "Здравствуйте, чем могу помочь?",
                  style: ThemeTextStyles.messageTextStyle.copyWith(
                    color: ThemeColors.chatTitleColor,
                  ),
                ),
                const Text("", style: ThemeTextStyles.messageTimeTextStyle),
              ],
            ),
          ),
        ),
        const Positioned(
          right: 10,
          bottom: 10,
          child: Text(
            "12:02",
            style: ThemeTextStyles.messageTimeTextStyle,
          ),
        ),
      ],
    );
  }
}
