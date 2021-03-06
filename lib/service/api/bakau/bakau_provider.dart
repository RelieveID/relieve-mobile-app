import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:relieve_app/datamodel/chat.dart';
import 'package:relieve_app/datamodel/contact.dart';
import 'package:relieve_app/datamodel/family.dart';
import 'package:relieve_app/datamodel/location.dart';
import 'package:relieve_app/datamodel/relieve_user.dart';
import 'package:relieve_app/service/api/bakau/bakau_api.dart';
import 'package:relieve_app/service/api/base/provider.dart';
import 'package:relieve_app/service/firebase/firestore_helper.dart';
import 'package:relieve_app/utils/preference_utils.dart';

class BakauProvider extends Provider implements BakauApi {
  @override
  final String name = "bakau";

  @override
  Future<ContactResponse> getNearbyEmergencyContact(Coordinate location) async {
    this.checkProvider();

    var url = '$completeUri/emergency-contact/nearby';
    final response = await http.post(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'authorization': await PreferenceUtils.get().getIdToken(),
        'secret': secret,
      },
      body: jsonEncode({
        'coordinates': location.toString(),
        'radius': 2000,
      }),
    );

    return ContactResponse.fromJson(jsonDecode(response.body));
  }

  Future<List<Family>> getFamilies() async {
    return FirestoreHelper.get().getFamilies();
  }

  /// send request to other user
  // TODO: implement direct fcm
  // generate Firebase doc ID, set direction as field.
  // send fcm to uid with request code
  // only other can see the request code
  @override
  Future<AddFamilyState> addFamily(RelieveUser other) async {
    this.checkProvider();

    final uid = await PreferenceUtils.get().getUid();
    if (uid == null) return throw StateError('User is not logged in');

    final requestData = {
      "requester": uid,
      "requested": other.uid,
      "timeout":
          DateTime.now().add(Duration(minutes: 1)).millisecondsSinceEpoch,
    };

//    final newRequest = await _fireStore
//        .collection(CollectionPath.FAMILIES)
//        .document(uid)
//        .collection(CollectionPath.REQUEST)
//        .add(requestData);

//    CloudMessageHelper.get().sendFamilyRequest(otherUserToken, requestData);

    return AddFamilyState.PENDING;
  }

  @override
  Future<AddFamilyState> confirmFamilyAuth(String code) async {
    this.checkProvider();

    // TODO: implement check code
    return AddFamilyState.CANCELED;
  }

  @override
  Future<bool> editFamilyLabel(RelieveUser other, String label) async {
    this.checkProvider();

    // TODO: implement edit label
    return false;
  }

  @override
  Future<bool> sendChatMessage(String otherUserId, Message message) async {
    this.checkProvider();

    return false;
  }

  /// start from page 1, must access the data on order, page 1..2..3..n
  /// return null on error
  /// return empty on no more data
  @override
  Future<List<Message>> getAllMessage(
      String chatId, int page, int limit) async {
    return FirestoreHelper.get().getAllMessage(chatId, page, limit);
  }

  /// start from page 1, must access the data on order, page 1..2..3..n
  /// return null on error
  /// return empty on no more data
  @override
  Future<List<Chat>> getAllChat(int page, int limit) async {
    return FirestoreHelper.get().getAllChat(page, limit);
  }
}
