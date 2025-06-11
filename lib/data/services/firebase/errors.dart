String getFirebaseAuthErrorMessage(String code, String languageCode) {
  const messages = {
    // Email validation errors
    'invalid-email': {
      'en': 'The email address is badly formatted.',
      'ar': 'عنوان البريد الإلكتروني غير صالح.',
    },

    // Sign in errors
    'user-disabled': {
      'en': 'This user has been disabled.',
      'ar': 'تم تعطيل هذا المستخدم.',
    },
    'user-not-found': {
      'en': 'No user found with this email.',
      'ar': 'لا يوجد مستخدم بهذا البريد الإلكتروني.',
    },
    'wrong-password': {
      'en': 'Incorrect password.',
      'ar': 'كلمة المرور غير صحيحة.',
    },
    'invalid-credential': {
      'en': 'The email or password is incorrect.',
      'ar': 'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
    },

    // Sign up errors
    'email-already-in-use': {
      'en': 'The email is already in use.',
      'ar': 'البريد الإلكتروني مستخدم بالفعل.',
    },
    'operation-not-allowed': {
      'en': 'Email/password accounts are not enabled.',
      'ar': 'حسابات البريد الإلكتروني/كلمة المرور غير مفعلة.',
    },
    'weak-password': {
      'en': 'The password is too weak.',
      'ar': 'كلمة المرور ضعيفة جداً.',
    },
    'too-many-requests': {
      'en': 'Too many requests. Try again later.',
      'ar': 'عدد كبير من المحاولات. حاول لاحقاً.',
    },
    'network-request-failed': {
      'en': 'Network error occurred.',
      'ar': 'حدث خطأ في الشبكة.',
    },

    'user-token-expired': {
      'en': 'Your session has expired. Please sign in again.',
      'ar': 'انتهت جلستك. يرجى تسجيل الدخول مرة أخرى.',
    },
    'requires-recent-login': {
      'en': 'This operation requires recent authentication. Please sign in again.',
      'ar': 'هذه العملية تتطلب مصادقة حديثة. يرجى تسجيل الدخول مرة أخرى.',
    },
    'user-not-logged-in': {
      'en': 'User is not authenticated.',
      'ar': 'المستخدم غير مسجل الدخول.',
    },
  };

  return messages[code]?[languageCode] ??
      (languageCode == 'ar' ? 'حدث خطأ، حاول مرة أخرى.' : 'An error occurred. Please try again.');
}
