import 'package:events_app/Models/PromoterModel.dart';

abstract class IRepositoryPromoter {
  Future<List<PromoterModel>> getAllPromoters();
  Future<void> getPromoterById(String id);
  Future<void> deletePromoter(String id);
  Future<List<String>> getPromotersByName(String name);
  Future<PromoterModel> editPromoter(PromoterModel tblPromoter);
  Future<PromoterModel> addPromoter(PromoterModel tblPromoter);
}
