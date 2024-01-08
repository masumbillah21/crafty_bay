class AppMessages {
  static const String emailVerificationSuccess =
      "Verification code has been sent.";
  static const String emailVerificationFailed =
      "Failed to send verification code, Try again.";

  static const String requiredOTP = 'OTP is required';
  static const String otpLength = 'OTP must be 4 digits.';
  static const String otpSuccess = "OTP verified.";
  static const String otpFailed = "Failed to verify OTP.";

  static const String profileUpdateSuccess = "Profile updated.";
  static const String profileUpdateFailed = "Failed to update profile.";

  static const String requiredEmail = 'Email is required';

  static const String requiredFirstName = 'First name is required';

  static const String requiredLastName = 'Last name is required';

  static const String requiredMobileNumber = 'Mobile number is required';
  static const String invalidMobileNumber = 'Invalid mobile number';

  static const String requiredCity = 'City is required';

  static const String requiredShippingAddress = 'Shipping address is required';

  static const String requiredPassword = 'Password is required';
  static const String requiredConfirmPassword = 'Confirm password is required';
  static const String missMatchConfirmPassword =
      'Password & confirm password are not same';
  static const String passwordLength =
      'Password must be at least 8 characters.';

  static const String inValidEmail = 'Invalid Email.';

  static emptyMessage(String message) => "Your $message is empty!";
}
