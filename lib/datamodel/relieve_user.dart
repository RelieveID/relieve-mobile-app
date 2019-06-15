import 'package:relieve_app/datamodel/profile.dart';

class RelieveUser {
  final String uid;
  final Profile profile;
  final String label;

  const RelieveUser(this.uid, this.profile, {this.label});
}