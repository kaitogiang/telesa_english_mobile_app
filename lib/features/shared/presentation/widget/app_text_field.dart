import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/core/extensions/context_extension.dart';
import 'package:telesa_english_app/features/shared/presentation/base/widget_view.dart';
import 'package:telesa_english_app/telesa_english.dart';


enum ValidateType {
  none,
  name,
  notEmpty,
  email,
  password,
  phone,
  numeric,
  required,

  ///Need to provide the [confirmPasswordController]
  confirmPassword,
}

class AppTextField extends StatefulWidget {
  //Value and Controller properties
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? onValid;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;

  //UI-related properties
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final InputDecoration? decoration;
  final EdgeInsetsGeometry? contentPadding;
  final bool? filled;
  final Color? fillColor;

  //Behavior-related properties
  final bool? obscureText;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final bool? enableSuggestions;
  final bool? autocorrect;

  //Keyboard
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;

  //Validator
  final ValidateType validateType;
  final TextEditingController? confirmPasswordController;

  const AppTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.initialValue,
    this.onChanged,
    this.onValid,
    this.onTap,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.textStyle,
    this.hintStyle,
    this.decoration,
    this.contentPadding,
    this.filled,
    this.fillColor,
    this.obscureText,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.enableSuggestions,
    this.autocorrect,
    this.keyboardType,
    this.textInputAction,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.validateType = ValidateType.none,
    this.confirmPasswordController,
    this.onFieldSubmitted,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldController();
}

//Controller
class _AppTextFieldController extends State<AppTextField> {
  final TextFieldEvents validator = TextFieldEvents();

  @override
  void initState() {
    super.initState();
    _validatorField();
  }

  bool isShowPasswordToggle() {
    return widget.validateType == ValidateType.password ||
        widget.validateType == ValidateType.confirmPassword;
  }

  Widget _buildDefaultSuffixIcon() {
    if (isShowPasswordToggle()) {
      final isShowPassword = validator.isShowPassword;
      final icon = Builder(
        builder: (context) {
          if (!isShowPassword) {
            return AppAssets.iconsMdiEye.svg(
              colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
            );
          }
          return AppAssets.iconsMdiHide.svg(
            colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
          );
        },
      );
      return GestureDetector(
        onTap: () {
          print('Press suffix icon');
          validator.handleVisibilityPassword();
        },
        child: Container(padding: AppSizes.s10.allPadding, child: icon),
      );
    }
    return const SizedBox.shrink();
  }

  TextInputType _getKeyboardType() {
    switch (widget.validateType) {
      case ValidateType.email:
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  void _validatorField() {
    widget.controller.addListener(() {
      final value = widget.controller.text;
      switch (widget.validateType) {
        case ValidateType.email:
          {
            final errorText = context.tr.invalidEmail;
            final errorEmptyText = context.tr.fieldIsNotEmpty;
            final isValid = validator.validateEmail(
              email: value,
              errorString: errorText,
              errorEmptyString: errorEmptyText,
            );
            widget.onValid?.call(isValid);
          }
          break;
        case ValidateType.notEmpty:
          {
            final errorText = context.tr.fieldIsNotEmpty;
            final isValid = validator.validateNotEmpty(
              value: value,
              errorString: errorText,
            );
            widget.onValid?.call(isValid);
          }
          break;
        case ValidateType.password:
          {
            final errorEmptyText = context.tr.fieldIsNotEmpty;
            final errorPassword = context.tr.passwordAtLeast8;
            final isValid = validator.validatePassword(
              password: value,
              notEmptyString: errorEmptyText,
              errorString: errorPassword,
            );
            widget.onValid?.call(isValid);
          }
          break;
        case ValidateType.confirmPassword:
          {
            final errorEmptyText = context.tr.fieldIsNotEmpty;
            final notMatchError = context.tr.passwordNotMatch;
            final isValid = validator.validateConfirmPassword(
              value: value,
              notEmptyString: errorEmptyText,
              errorString: notMatchError,
              confirmController: widget.confirmPasswordController,
            );
            widget.onValid?.call(isValid);
          }
          break;
        default:
          break;
      }
      // if (widget.validateType == ValidateType.email) {
      //
      // }
    });
  }

  bool shouldUpdateObscureText() {
    if (widget.validateType == ValidateType.password ||
        widget.validateType == ValidateType.confirmPassword) {
      return !validator.isShowPassword;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return _AppTextFieldView(this);
  }
}

//View
class _AppTextFieldView
    extends WidgetView<AppTextField, _AppTextFieldController> {
  const _AppTextFieldView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: state.validator,
      builder: (context, child) {
        return TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          initialValue: widget.initialValue,
          onTap: widget.onTap,
          forceErrorText: state.validator.errorText,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.lightGreenColor),
            ),
            focusColor: AppColors.greenColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.greenColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.mediumGreenColor),
            ),
            hintText: widget.hintText,
            labelText: widget.labelText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon ?? state._buildDefaultSuffixIcon(),
            hintStyle: AppTextStyle.textSize16(textColor: Colors.grey),
            suffix: widget.suffix,
            prefix: widget.prefix,
            contentPadding: widget.contentPadding ?? EdgeInsets.all(16),
            filled: widget.filled,
            fillColor: widget.fillColor ?? AppColors.whiteColor,
          ),
          obscureText: widget.obscureText ?? state.shouldUpdateObscureText(),
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType ?? state._getKeyboardType(),
          style: AppTextStyle.textSize16(),
          onFieldSubmitted: (value) {
            print('Field submit');
            widget.onFieldSubmitted?.call(value);
          },
        );
      },
    );
  }
}

class TextFieldEvents extends ChangeNotifier {
  String? _errorText;
  bool isFirstFocus = true;
  bool _isShowPassword = false;

  String? get errorText => _errorText;

  bool get isShowPassword => _isShowPassword;

  void resetErrorText() {
    _errorText = null;
    notifyListeners();
  }

  bool validateEmail({
    required String email,
    required String errorString,
    required String errorEmptyString,
  }) {
    final emailRegExp = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,}$');
    final hasMatch = emailRegExp.hasMatch(email);
    if (email.isEmpty && !isFirstFocus) {
      _errorText = errorEmptyString;
      notifyListeners();
      return false;
    } else {
      isFirstFocus = false;
    }
    if (email.isNotEmpty && !hasMatch) {
      _errorText = errorString;
      notifyListeners();
      return false;
    }
    resetErrorText();
    return true;
  }

  bool validateNotEmpty({required String value, required String errorString}) {
    if (value.isEmpty && !isFirstFocus) {
      _errorText = errorString;
      notifyListeners();
      return false;
    }
    isFirstFocus = false;
    resetErrorText();
    return true;
  }

  bool validatePassword({
    required String password,
    required String notEmptyString,
    required String errorString,
  }) {
    if (password.isEmpty && !isFirstFocus) {
      _errorText = notEmptyString;
      notifyListeners();
      return false;
    }
    if (password.length < 8 && !isFirstFocus) {
      _errorText = errorString;
      notifyListeners();
      return false;
    }
    isFirstFocus = false;
    resetErrorText();
    return true;
  }

  bool validateConfirmPassword({
    required String value,
    required String notEmptyString,
    required String errorString,
    required TextEditingController? confirmController,
  }) {
    if (value.isEmpty && !isFirstFocus) {
      _errorText = notEmptyString;
      notifyListeners();
      return false;
    }

    if (value.compareTo(confirmController?.text.trim() ?? '') != 0 &&
        !isFirstFocus) {
      _errorText = errorString;
      notifyListeners();
      return false;
    }

    isFirstFocus = false;
    resetErrorText();
    return true;
  }

  //Handle show/hide password field
  void handleVisibilityPassword() {
    _isShowPassword = !_isShowPassword;
    notifyListeners();
  }
}
