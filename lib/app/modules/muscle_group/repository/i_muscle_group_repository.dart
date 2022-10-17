import '../../../models/models.dart';

abstract class IMuscleGroupRepository {
  Future<void> create(MuscleGroupModel muscleGroup);
  Future<List<MuscleGroupModel>> getAll();
  Future<MuscleGroupModel> getById(int id);
}
