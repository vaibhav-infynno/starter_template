class AppValidation {
  // Validates if the input is a valid address format
  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    // You can add more complex validation logic here if needed
    return null; // Validation passes
  }

  // Validates if the input is a valid city format
  static String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'City is required';
    }
    // You can add more complex validation logic here if needed
    return null; // Validation passes
  }

  // Validates if the input is a valid company name format
  static String? validateCompanyName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your company name';
    }
    // You can add more complex validation logic here if needed
    return null; // Validation passes
  }

  // Validates confirmation password
  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null; // Validation passes
  }

  // Validates if the input is a valid country format
  static String? validateCountry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your country';
    }
    // You can add more complex validation logic here if needed
    return null; // Validation passes
  }

  static String? validateCustomer(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please select a customer';
    }
    return null;
  }

  // Validates if the input is a valid date format
  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a date';
    }
    // if (!RegExp(
    //   r'^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[0-2])[- /.](\d{4})$',
    // ).hasMatch(value)) {
    //   return 'Invalid date format (e.g., DD/MM/YYYY)';
    // }
    // You can add more complex validation logic here if needed
    return null; // Validation passes
  }

  // Validates if the input is a valid email format
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
      return 'Invalid email format';
    }
    return null; // Validation passes
  }

  // Validates if the input is a valid first name format
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'First name required';
    }
    return null; // Validation passes
  }

  // Validates the gst number format
  static String? validateGstNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your GST number';
    }
    if (!RegExp(
      r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z][A-Z0-9][A-Z0-9][0-9]$',
    ).hasMatch(value)) {
      return 'Invalid GST number format';
    }

    return null; // Validation passes
  }

  static String? validateIdentifier(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }

    return null;
  }

  // Validates if the input is a valid last name format
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Last name required';
    }
    return null; // Validation passes
  }

  // Validates if the input is a valid password format
  static String? validateLoginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    // Password validation can be more complex, e.g., minimum length
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null; // Validation passes
  }

  static String? validateModelName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter model name';
    }
    return null;
  }

  // Validates if the input is a valid name format (first and last name)
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    // You can add more complex validation logic here if needed
    return null; // Validation passes
  }

  // Validates if the input is a valid note format
  static String? validateNote(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a note';
    }
    // You can add more complex validation logic here if needed
    return null; // Validation passes
  }

  static String? validateNotes(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the price';
    }
    return null;
  }

  // Validates otp format
  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the correct OTP';
    }
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'Invalid OTP format (must be 6 digits)';
    }
    return null; // Validation passes
  }

  // Validates if the input is a valid password format
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Minimum 8 characters required';
    }
    return null;
  }

  // Validates a 10-digit Indian phone number (without country code)
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number required';
    }

    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
      return 'Enter a valid 10-digit Indian phone number';
    }

    return null; // Validation passes
  }

  static String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Service Charge';
    }
    if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(value)) {
      return 'Invalid price format (e.g., 100 or 100.00)';
    }
    return null;
  }

  static String? validateServices(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please Enter Model Name';
    }
    return null;
  }

  // Validates if the input is a valid state format
  static String? validateState(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a state';
    }
    // You can add more complex validation logic here if needed
    return null; // Validation passes
  }

  // Validates if the input is a valid time format
  static String? validateTime(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a time';
    }
    if (!RegExp(r'^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$').hasMatch(value)) {
      return 'Invalid time format (e.g., HH:MM)';
    }
    // You can add more complex validation logic here if needed
    return null; // Validation passes
  }

  // Validates if the input is a valid website format
  static String? validateWebsite(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your website';
    }
    if (!RegExp(
      r'^(https?:\/\/)?([\w-]+(\.[\w-]+)+)(\/[\w- .\/?%&=]*)?$',
    ).hasMatch(value)) {
      return 'Invalid website format';
    }
    return null; // Validation passes
  }

  // Validates if the input is a valid Indian zip code (PIN code) format
  static String? validateZipCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Zip code is required';
    }
    // Indian PIN codes are exactly 6 digits and cannot start with 0
    if (!RegExp(r'^[1-9][0-9]{5}$').hasMatch(value)) {
      return 'Invalid zip code';
    }
    return null; // Validation passes
  }

  static String? validateProductName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter product name';
    }
    return null;
  }

  static String? validateProductPrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the price';
    }
    if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(value)) {
      return 'Invalid price format (e.g., 100 or 100.00)';
    }
    return null;
  }

  static String? validateProductDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter product description';
    }
    return null;
  }
}
