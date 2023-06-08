// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'sign_on.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveSignOnFormConsumer extends StatelessWidget {
  const ReactiveSignOnFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, SignOnForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveSignOnForm.of(context);

    if (formModel is! SignOnForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class SignOnFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const SignOnFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final SignOnForm form;
}

class ReactiveSignOnForm extends StatelessWidget {
  const ReactiveSignOnForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final SignOnForm form;

  final WillPopCallback? onWillPop;

  static SignOnForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<SignOnFormInheritedStreamer>()
          ?.form;
    }

    final element = context
        .getElementForInheritedWidgetOfExactType<SignOnFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as SignOnFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return SignOnFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class SignOnFormBuilder extends StatefulWidget {
  const SignOnFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final SignOn? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, SignOnForm formModel, Widget? child) builder;

  final void Function(BuildContext context, SignOnForm formModel)? initState;

  @override
  _SignOnFormBuilderState createState() => _SignOnFormBuilderState();
}

class _SignOnFormBuilderState extends State<SignOnFormBuilder> {
  late SignOnForm _formModel;

  @override
  void initState() {
    _formModel = SignOnForm(SignOnForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant SignOnFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel = SignOnForm(SignOnForm.formElements(widget.model), null);

      if (_formModel.form.disabled) {
        _formModel.form.markAsDisabled();
      }

      widget.initState?.call(context, _formModel);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveSignOnForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class SignOnForm implements FormModel<SignOn> {
  SignOnForm(
    this.form,
    this.path,
  );

  static const String usernameControlName = "username";

  static const String emailControlName = "email";

  static const String otpControlName = "otp";

  final FormGroup form;

  final String? path;

  String usernameControlPath() => pathBuilder(usernameControlName);
  String emailControlPath() => pathBuilder(emailControlName);
  String otpControlPath() => pathBuilder(otpControlName);
  String get _usernameValue => usernameControl.value ?? "";
  String get _emailValue => emailControl.value ?? "";
  String? get _otpValue => otpControl?.value;
  bool get containsUsername {
    try {
      form.control(usernameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsEmail {
    try {
      form.control(emailControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsOtp {
    try {
      form.control(otpControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get usernameErrors => usernameControl.errors;
  Object? get emailErrors => emailControl.errors;
  Object? get otpErrors => otpControl?.errors;
  void get usernameFocus => form.focus(usernameControlPath());
  void get emailFocus => form.focus(emailControlPath());
  void get otpFocus => form.focus(otpControlPath());
  void otpRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsOtp) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          otpControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            otpControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void usernameValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    usernameControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void emailValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    emailControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void otpValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    otpControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void usernameValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    usernameControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void emailValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    emailControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void otpValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    otpControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void usernameValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      usernameControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void emailValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      emailControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void otpValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      otpControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String> get usernameControl =>
      form.control(usernameControlPath()) as FormControl<String>;
  FormControl<String> get emailControl =>
      form.control(emailControlPath()) as FormControl<String>;
  FormControl<String>? get otpControl => containsOtp
      ? form.control(otpControlPath()) as FormControl<String>?
      : null;
  void usernameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      usernameControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      usernameControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void emailSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      emailControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      emailControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void otpSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      otpControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      otpControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  SignOn get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'SignOnForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return SignOn(username: _usernameValue, email: _emailValue, otp: _otpValue);
  }

  void submit({
    required void Function(SignOn model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    SignOn value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(SignOnForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    SignOn? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(SignOn? signOn) => FormGroup({
        usernameControlName: FormControl<String>(
            value: signOn?.username,
            validators: [requiredValidator],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        emailControlName: FormControl<String>(
            value: signOn?.email,
            validators: [requiredValidator, emailValidator],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        otpControlName: FormControl<String>(
            value: signOn?.otp,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveSignOnFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveSignOnFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(SignOnForm formModel)? control;

  final Widget Function(
          BuildContext context, List<Widget> itemList, SignOnForm formModel)?
      builder;

  final Widget Function(
      BuildContext context, int i, T? item, SignOnForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveSignOnForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final itemList = (formArray.value ?? [])
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveSignOnFormFormGroupArrayBuilder<V> extends StatelessWidget {
  const ReactiveSignOnFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<V>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<V>> Function(
      SignOnForm formModel)? getExtended;

  final Widget Function(
          BuildContext context, List<Widget> itemList, SignOnForm formModel)?
      builder;

  final Widget Function(
      BuildContext context, int i, V? item, SignOnForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveSignOnForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <V>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
