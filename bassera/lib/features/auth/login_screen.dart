import 'package:baseera/design_system/baseera_tokens.dart';
import 'package:baseera/features/auth/baseera_logo_mark.dart';
import 'package:baseera/l10n/app_localizations.dart';
import 'package:baseera/providers/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  bool _looksLikeEmail(String value) {
    final String v = value.trim();
    return v.contains('@') && v.contains('.') && v.length >= 5;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() => _busy = true);
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if (!mounted) {
      return;
    }
    await ref.read(sessionProvider.notifier).setSignedIn(true);
    if (mounted) {
      setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final ColorScheme cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.loginTitle),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.all(BaseeraSpacing.lg),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Center(
                  child: BaseeraLogoMark(size: 72, iconSize: 36),
                ),
                const SizedBox(height: BaseeraSpacing.xl),
                Text(
                  l10n.loginSubtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                        height: 1.4,
                      ),
                ),
                const SizedBox(height: BaseeraSpacing.xl),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: l10n.loginEmailLabel,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(BaseeraRadii.md),
                    ),
                  ),
                  validator: (String? v) {
                    if (v == null || v.trim().isEmpty) {
                      return l10n.validatorEmail;
                    }
                    if (!_looksLikeEmail(v)) {
                      return l10n.validatorEmailFormat;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: BaseeraSpacing.md),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    if (!_busy) {
                      _submit();
                    }
                  },
                  decoration: InputDecoration(
                    labelText: l10n.loginPasswordLabel,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(BaseeraRadii.md),
                    ),
                  ),
                  validator: (String? v) {
                    if (v == null || v.isEmpty) {
                      return l10n.validatorPassword;
                    }
                    if (v.length < 6) {
                      return l10n.validatorPasswordLength;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: BaseeraSpacing.lg),
                FilledButton(
                  onPressed: _busy ? null : _submit,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: BaseeraSpacing.md,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(BaseeraRadii.lg),
                    ),
                  ),
                  child: _busy
                      ? SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: cs.onPrimary,
                          ),
                        )
                      : Text(l10n.loginSubmit),
                ),
                const SizedBox(height: BaseeraSpacing.md),
                Text(
                  l10n.loginBackendNote,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
