import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../core/core.dart';
import '../../../models/models.dart';
import '../service/i_muscular_group_service.dart';

@Injectable()
class MuscularGroupController {
  final IMuscularGroupService muscularGroupService;
  final ILogger log;

  MuscularGroupController({
    required this.muscularGroupService,
    required this.log,
  });

  @Route.post('/')
  Future<Response> listAllMuscularGroup(Request request) async {
    return ResponseHelper.makeResponse(
      handlerResponse: () async {
        final body = await request.readAsString();
        final muscularGroup = MuscularGroupModel.requestMapping(body);
        await muscularGroupService.createMuscularGroup(muscularGroup);
        return ResponseHelper.baseResponse(
          201,
          responseModel: ResponseModel(
            data: null,
            message: 'Personal Training criado com sucesso.',
          ),
        );
      },
      log: log,
    );
  }
}