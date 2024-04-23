




import '../../../../core/domain/entities/user_public.dart';
import '../../../../core/domain/services/users_service.dart';
import '../../../../injection_container.dart';

class UsersToTalkToController {

  Stream<List<UserPublic>> stream() {
    return getIt.get<UsersService>().streamAllUsersExceptLogged();
  }

}