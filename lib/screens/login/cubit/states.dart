abstract class LoginStates {

}
class LoginInitialStates extends LoginStates
{

}

class LoginLoadingStates extends LoginStates
{

}
class LoginSuccessStates extends LoginStates
{
  final String uId;
  LoginSuccessStates(this.uId);
}
class LoginErrorStates extends LoginStates
{
  final String error;
  LoginErrorStates(this.error);

}
class LoginChangePasswordVisibilityStates extends LoginStates
{

}
class GetUserLoadingState extends LoginStates{

}
class GetUserSuccessState extends LoginStates{

}
class GetUserErrorState extends LoginStates{
  final String error;
  GetUserErrorState(this.error);
}
