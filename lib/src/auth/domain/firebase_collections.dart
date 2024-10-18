import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:salo/src/professionals/domain/professional_user.dart';

const proUsersCollectionPath = '${appFlavor}_users';

DocumentReference<ProfessionalUser> getProUserDataDoc(String userId) =>
    FirebaseFirestore.instance
        .collection(proUsersCollectionPath)
        .doc(userId)
        .withConverter(
          fromFirestore: (json, _) => ProfessionalUser.fromJson(json.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

DocumentReference getProUserDoc(String userId) =>
    FirebaseFirestore.instance.collection(proUsersCollectionPath).doc(userId);
