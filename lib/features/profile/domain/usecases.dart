
import 'package:seclob/features/profile/domain/entities.dart';
import 'package:seclob/features/profile/domain/repository.dart';

class GetUserProfile {
  final ProfileRepository repository;

  GetUserProfile(this.repository);

  Future<UserEntity> call() async {
    return await repository.getUserProfile();
  }
}
