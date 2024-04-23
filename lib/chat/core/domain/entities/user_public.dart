import '../../../features/chat/domain/chat_utils.dart' as chatUtils;
import '../../../injection_container.dart';
import '../services/auth_service.dart';

class UserPublic {
  final String uid;
  final String firstName;
  final String lastName;

  UserPublic({required this.uid, required this.firstName, required this.lastName});

  String get fullName => "$firstName $lastName";

  String get conversationId {
    return chatUtils.getDirectConversationId([uid, getIt.get<AuthService>().loggedUid!]);
  }

  static UserPublic empty() => UserPublic(uid: '', firstName: '', lastName: '');
}