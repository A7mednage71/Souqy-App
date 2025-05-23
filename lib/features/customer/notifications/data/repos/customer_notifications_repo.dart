import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_store/core/services/shared_pref/shared_pref.dart';
import 'package:my_store/core/services/shared_pref/shared_pref_keys.dart';
import 'package:my_store/features/customer/notifications/data/models/customer_notification_model.dart';

class CustomerNotificationsRepo {
  static Stream<List<CustomerNotificationModel>> getNotificationsStream() {
    final userId = SharedPrefService.getInt(SharedPrefKeys.userId).toString();

    final firestore = FirebaseFirestore.instance;
    return firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .snapshots()
        .map(
      (snapshot) {
        return snapshot.docs.map((doc) {
          return CustomerNotificationModel.fromJson(doc.data());
        }).toList();
      },
    );
  }
}
