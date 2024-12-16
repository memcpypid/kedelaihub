import 'package:get/get.dart';
import 'package:kedelai_hub/app/modules/livechat/controllers/livechat_controller.dart';
// import 'package:kedelai_hub/app/services/live_chat_service.dart';

class LiveChatBinding extends Bindings {
  @override
  void dependencies() {
    // Register the LiveChatService lazily
    Get.lazyPut<LiveChatService>(() => LiveChatService());
  }
}
