import 'package:daily_leaves_task/core/network/network_info.dart';
import 'package:daily_leaves_task/core/utils/strings/theme.dart';
import 'package:daily_leaves_task/features/auth/data/data%20sources/auth_local_data_source.dart';
import 'package:daily_leaves_task/features/auth/data/data%20sources/auth_remote_data_source.dart';
import 'package:daily_leaves_task/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:daily_leaves_task/features/auth/domain/usecases/login/login_usecase.dart';
import 'package:daily_leaves_task/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:daily_leaves_task/features/leaves/data/data%20sources/leave_remote_data_source.dart';
import 'package:daily_leaves_task/features/leaves/data/repositories/leave_repostiory_impl.dart';
import 'package:daily_leaves_task/features/leaves/domain/usecases/getleavesCount/get_leaves_count.dart';
import 'package:daily_leaves_task/features/leaves/presentation/bloc/leave_bloc/leave_bloc.dart';
import 'package:daily_leaves_task/features/leaves/presentation/bloc/leaves_count/leaves_count_bloc.dart';
import 'package:daily_leaves_task/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/services/auto_logout_service.dart';
import 'core/services/navigation_service.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/leaves/domain/usecases/getAllLeaves/get_all_leaves.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

   final AutoLogoutService _autoLogoutService = AutoLogoutService();
NavigationService service = NavigationService();
final AuthRemoteImplWithDio _authService = AuthRemoteImplWithDio();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            LoginUseCase(
                authRepository: AuthRepositoryImplementaion(
                    authLocalDataSource: AuthLocalImplWithSharedPref(),
                    authRemoteDataSource: AuthRemoteImplWithDio(),
                    networkInfo: NetworkInfoImpl(InternetConnectionChecker()))),
          ),
        ),
        BlocProvider(
            create: (context) => LeaveBloc(getAllLeavesUseCase: GetAllLeavesUseCase(
                leaveRepository: LeaveRepositoryImpl(
                    leaveRemoteDataImplWithDio: LeaveRemoteDataImplWithDio(),
                    networkInfo:
                        NetworkInfoImpl(InternetConnectionChecker()))),
                        networkInfo:  NetworkInfoImpl(InternetConnectionChecker())
                      
            ),
                        
                        ),
                         BlocProvider(
            create: (context) => LeavesCountBloc(GetLeavesCountUseCase(
                leaveRepository: LeaveRepositoryImpl(
                    leaveRemoteDataImplWithDio: LeaveRemoteDataImplWithDio(),
                    networkInfo:
                        NetworkInfoImpl(InternetConnectionChecker()))),
                      
            ),
                        
                        ),
      ],
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
         if(state is AutoLogOut){
          print('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
          navigatorKey.currentState!.push(MaterialPageRoute(
    builder: (context) => LoginPage(),
));
          }
          
          },
        
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
      //        onGenerateRoute: RouteGenerator.generateRoutes,
      // initialRoute: '/',
       navigatorKey: navigatorKey,
            theme: themeData,
            home: LoginPage(),
          );
        },
      ),
    );
  }
}
