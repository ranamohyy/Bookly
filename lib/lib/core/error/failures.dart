
import 'package:dio/dio.dart';
abstract class Failure{

       final String errMessage;
      Failure(this.errMessage);
}
     class ServerFailure extends Failure{
           ServerFailure(super.errMessage);


     factory ServerFailure.fromDioException(DioException dioException){


       switch(dioException.type){
       case DioExceptionType.connectionTimeout:
         return ServerFailure('connection timeout');

        case DioExceptionType.sendTimeout:
         return ServerFailure('send timeout');

        case DioExceptionType.receiveTimeout:
         return ServerFailure('recive timeout');

         case DioExceptionType.badCertificate:
           return ServerFailure('connection timeout');

        case DioExceptionType.badResponse:
          return ServerFailure.fromResponse(
                 dioException.response!.statusCode,dioException.response!.data);

          case DioExceptionType.cancel:
             return ServerFailure('Request to ApiServer was canceld');

           case DioExceptionType.connectionError:
              break;
              case DioExceptionType.unknown:
                     if (dioException.message!.contains('SocketException')) {
                        return ServerFailure('No Internet Connection');
                           }else{
                              return ServerFailure('Unexpected Error, Please try again!');}
                  default:
               return ServerFailure('Opps There was an Error, Please try again');
                  }
       return ServerFailure('error');



     }

factory ServerFailure.fromResponse(int?statusCode,dynamic response){


if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
return ServerFailure(response['error']['message']);
} else if (statusCode == 404) {
return ServerFailure('Your request not found, Please try later!');
} else if (statusCode == 500) {
return ServerFailure('Internal Server error, Please try later');
} else {
return ServerFailure('Opps There was an Error, Please try again');
}
}
}