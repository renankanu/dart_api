import '../../../models/models.dart';

abstract class IMuscularGroupService {
  Future<void> createMuscularGroup(MuscularGroupModel muscularGroup);
}