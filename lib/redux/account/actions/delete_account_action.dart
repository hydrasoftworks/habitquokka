import 'package:habitquokka/redux/account/actions/sign_out_action.dart';
import 'package:habitquokka/redux/redux.dart';

class DeleteAccountAction extends Action {
  @override
  Future<AppState?> reduce() async {
    await env.supabase.rpc('delete_account');
    dispatchAndWait(SignOutAction());
    return null;
  }
}
