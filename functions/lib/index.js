"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
const firestore = admin.firestore();
//const messaging = admin.messaging();
const auth = admin.auth();
exports.proCompleteAccountCreation = functions.https.onCall(async (data, context) => {
    // Check if the user is authenticated
    if (!context.auth) {
        throw new functions.https.HttpsError('unauthenticated', 'The user must be authenticated to perform this operation.');
    }
    try {
        const uid = data.uid;
        const appFlavor = data.appFlavor;
        if (appFlavor != 'pro' && appFlavor != 'salo') {
            throw new functions.https.HttpsError('failed-precondition', 'Invalid claim');
        }
        const docRef = firestore.collection(`${appFlavor}_users`).doc(uid);
        await docRef.set({
            firstName: data.firstName,
            lastName: data.lastName,
            province: data.province,
            city: data.city,
            gender: data.gender,
            categoryId: data.categoryId,
            subcategoryIds: data.subcategoryIds,
        });
        // Set custom claim (e.g., 'pro' or 'salo' role)
        await auth.setCustomUserClaims(uid, { role: appFlavor });
        return { message: 'Success' };
    }
    catch (error) {
        console.info(`ERROR: ${JSON.stringify(error)}`);
        throw new functions.https.HttpsError('internal', `SERVER: ${error}`, error);
    }
});
//# sourceMappingURL=index.js.map