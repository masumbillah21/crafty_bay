class AppMessages {
  static const String requiredEmail = 'Email is required';
  static const String inValidEmail = 'Invalid Email.';
  static const String emailVerificationSuccess =
      "Verification code has been sent.";
  static const String emailVerificationFailed =
      "Failed to send verification code, Try again.";

  static const String requiredOTP = 'OTP is required';
  static const String otpLength = 'OTP must be 6 digits.';
  static const String otpSuccess = "OTP verified.";
  static const String otpFailed = "Failed to verify OTP.";

  static const String profileUpdateSuccess = "Profile updated.";
  static const String profileUpdateFailed = "Failed to update profile.";

  static const String requiredName = 'Name is required';
  static const String requiredAddress = 'Address is required';
  static const String requiredCity = 'City is required';
  static const String requiredPostalCode = 'Postal Code is required';
  static const String requiredMobileNumber = 'Mobile number is required';
  static const String invalidMobileNumber = 'Invalid mobile number';

  static const String cartUpdateSuccess = 'Cart updated successfully.';
  static const String cartUpdateFailed = 'Failed to update cart.';
  static const String cartQytChanged =
      'You changed cart quantity but have not updated yet. Do you want to continue to checkout?';

  static const String notingToUpdate = 'There is nothing to update.';

  static const String paymentSuccess = 'Your payment has been succeeded.';
  static const String paymentFailed = 'Your payment failed to proceed.';

  static const String reviewDetailsRequired = 'Review is required.';
  static const String reviewStarRequired = 'Star is required.';
  static const String reviewSuccess = 'Review added successfully.';
  static const String reviewFailed = 'Failed to add review, try again later.';

  static const String wishlistAddSuccess = 'Added to wishlist.';
  static const String wishlistAddFailed = 'Failed to add into wishlist.';
  static const String wishlistRemoveSuccess = 'Delete from wishlist.';
  static const String wishlistRemoveFailed = 'Failed to remove from wishlist.';

  static emptyMessage(String message) => "There is no $message found!";
}
