part of 'package:test_chat_app/features/chat/presentation/pages/chat_page.dart';

mixin ChatMixin on State<ChatPageBody> {
  late final TextEditingController _chatTextController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _dispose() {
    _chatTextController.dispose();
  }
}
