import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../../models/student_model.dart';
import '../repository/i_student_repository.dart';
import 'i_student_service.dart';

@LazySingleton(as: IStudentService)
class StudentService implements IStudentService {
  IStudentRepository studentRepository;
  ILogger log;

  StudentService({
    required this.studentRepository,
    required this.log,
  });

  @override
  Future<void> createStudent(StudentModel student) {
    return studentRepository.createStudent(student);
  }

  @override
  Future<StudentModel> login(String email, String password) {
    return studentRepository.login(email, password);
  }

  @override
  Future<List<StudentModel>> getAll() => studentRepository.getAll();

  @override
  Future<StudentModel> getInfo(int id) => studentRepository.getInfo(id);
}
