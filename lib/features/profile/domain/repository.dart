
import 'package:seclob/features/profile/domain/entities.dart';

abstract class ProfileRepository {
  Future<UserEntity> getUserProfile();
}
