import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_chat_app/core/theme/colors/theme_colors.dart';
import 'package:test_chat_app/core/theme/text/theme_text_styles.dart';
import 'package:test_chat_app/core/utils/app_utils.dart';
import 'package:test_chat_app/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:test_chat_app/features/chat/presentation/widgets/receiver_message_widget.dart';
import 'package:test_chat_app/features/chat/presentation/widgets/sender_message_widget.dart';
import 'package:test_chat_app/injector_container.dart';

part 'mixins/chat_mixin.dart';

@RoutePage()
class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ChatBloc>(),
      child: const ChatPageBody(),
    );
  }
}

class ChatPageBody extends StatefulWidget {
  const ChatPageBody({super.key});

  @override
  State<ChatPageBody> createState() => _ChatPageBodyState();
}

class _ChatPageBodyState extends State<ChatPageBody> with ChatMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 91,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: ThemeColors.greyD9,
                ),
                AppUtils.kBoxWidth10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Виртуальный ассистент",
                        style: ThemeTextStyles.chatTitleTextStyle,
                      ),
                      AppUtils.kBoxHeight4,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: ThemeColors.chatStatusColor,
                          ),
                          AppUtils.kBoxWidth4,
                          Text(
                            "Online",
                            style: ThemeTextStyles.chatSubTitleTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: ListView.separated(
            padding: AppUtils.kPaddingAll18,
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (_, index) {
              if (index % 3 == 0) {
                return const Align(
                  alignment: Alignment.centerLeft,
                  child: SenderMessageWidget(),
                );
              }
              return const Align(
                alignment: Alignment.centerRight,
                child: ReceiverMessageWidget(),
              );
            },
            separatorBuilder: (_, index) => AppUtils.kBoxHeight8,
          ),
          bottomNavigationBar: SafeArea(
            minimum: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: AppUtils.kPaddingVer12Hor22,
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius30,
                  color: Colors.white,
                  border: Border.all(
                    color: ThemeColors.borderColor,
                    width: 1,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(93, 117, 147, 0.1),
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: AppUtils.kBorderRadius30,
                        child: TextField(
                          controller: _chatTextController,
                          decoration: const InputDecoration(
                            hintText: "Напишите ваше сообщение",
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      splashRadius: 22,
                      iconSize: 24,
                      icon: SvgPicture.asset(
                        'assets/svg/ic_send.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
