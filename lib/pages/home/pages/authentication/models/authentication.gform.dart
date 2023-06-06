// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'authentication.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveAuthenticationFormConsumer extends StatelessWidget {
  const ReactiveAuthenticationFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
          BuildContext context, AuthenticationForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveAuthenticationForm.of(context);

    if (formModel is! AuthenticationForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class AuthenticationFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const AuthenticationFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final AuthenticationForm form;
}

class ReactiveAuthenticationForm extends StatelessWidget {
  const ReactiveAuthenticationForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final AuthenticationForm form;

  final WillPopCallback? onWillPop;

  static AuthenticationForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              AuthenticationFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        AuthenticationFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as AuthenticationFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class AuthenticationFormBuilder extends StatefulWidget {
  const AuthenticationFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final Authentication? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
          BuildContext context, AuthenticationForm formModel, Widget? child)
      builder;

  final void Function(BuildContext context, AuthenticationForm formModel)?
      initState;

  @override
  _AuthenticationFormBuilderState createState() =>
      _AuthenticationFormBuilderState();
}

class _AuthenticationFormBuilderState extends State<AuthenticationFormBuilder> {
  late AuthenticationForm _formModel;

  @override
  void initState() {
    _formModel =
        AuthenticationForm(AuthenticationForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant AuthenticationFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel = AuthenticationForm(
          AuthenticationForm.formElements(widget.model), null);

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
    return ReactiveAuthenticationForm(
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

class AuthenticationForm implements FormModel<Authentication> {
  AuthenticationForm(
    this.form,
    this.path,
  );

  static const String emailControlName = "email";

  final FormGroup form;

  final String? path;

  String emailControlPath() => pathBuilder(emailControlName);
  String get _emailValue => emailControl.value ?? "";
  bool get containsEmail {
    try {
      form.control(emailControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get emailErrors => emailControl.errors;
  void get emailFocus => form.focus(emailControlPath());
  void emailValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    emailControl.updateValue(value,
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

  void emailValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      emailControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String> get emailControl =>
      form.control(emailControlPath()) as FormControl<String>;
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

  @override
  Authentication get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'AuthenticationForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return Authentication(email: _emailValue);
  }

  void submit({
    required void Function(Authentication model) onValid,
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
    Authentication value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(AuthenticationForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    Authentication? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(Authentication? authentication) => FormGroup({
        emailControlName: FormControl<String>(
            value: authentication?.email,
            validators: [requiredValidator, emailValidator],
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

class ReactiveAuthenticationFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveAuthenticationFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(AuthenticationForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      AuthenticationForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, AuthenticationForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveAuthenticationForm.of(context);

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

class ReactiveAuthenticationFormFormGroupArrayBuilder<V>
    extends StatelessWidget {
  const ReactiveAuthenticationFormFormGroupArrayBuilder({
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
      AuthenticationForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      AuthenticationForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, V? item, AuthenticationForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveAuthenticationForm.of(context);

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
