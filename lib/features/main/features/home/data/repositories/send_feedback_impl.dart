import 'package:skynet/features/main/features/home/data/data_sources/sen_feedback_ds.dart';
import 'package:skynet/features/main/features/home/domain/repositories/send_feedback.dart';

class SendFeedBackImpl implements SendFeedBack {
  SendFeedBackDataSource dataSource;
  SendFeedBackImpl({required this.dataSource});
  @override
  Future<void> sendFeedBack(
      {required String bxId,
      required String feedBackText,
      required String reviewMark}) async {
    await dataSource.sendFeedBack(
        bxId: bxId, feedBackText: feedBackText, mark: reviewMark);
  }
}
