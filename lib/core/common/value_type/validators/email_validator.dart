import 'package:dartz/dartz.dart';
import 'package:d2_remote/core/common/value_type/failures/email_failure.dart';
import 'package:d2_remote/core/common/value_type/validators/value_type_validator.dart';

class EmailValidator extends ValueTypeValidator<EmailFailure> {
  const EmailValidator();

  static const String EMAIL_PATTERN =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Either<EmailFailure, String> validate(String value) {
    if (RegExp(EMAIL_PATTERN).hasMatch(value)) {
      return right(value);
    } else {
      return left(const EmailFailure.malformedEmailException());
    }
  }
}
