import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:diarybootcamp/models/page_enum.dart';

class PageBloc extends Bloc<Page, Page> {
  @override
  Page get initialState => Page.Home;

  @override
  Stream<Page> mapEventToState(
    Page event,
  ) async* {
    yield event;
  }
}
