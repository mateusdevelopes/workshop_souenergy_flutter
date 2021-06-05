import 'package:workshop_souenergy_flutter/shared/models/inverter_model.dart';

abstract class IInverterRepository {
  Future<List<InverterModel>> fetchPaginatedInverters(
      int page, int limit, String orderBy, String order);

  Future<List<InverterModel>> fetchAllInverters(String orderBy, String order);

  Future addNewInverter(String brand);

  Future<InverterModel> deleteInverter(String id);
}
