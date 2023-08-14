import 'package:auto_route/auto_route.dart';
import 'package:test_chat_app/features/chat/presentation/pages/chat_page.dart';

part 'app_router.gr.dart';

class AppRoutes {
  AppRoutes._();

  static const chat = '/chat';
}

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: AppRoutes.chat,
          page: ChatRoute.page,
          initial: true,
        ),

      ];
}
