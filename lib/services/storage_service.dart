/// Handles file uploads (images, videos, PDFs, docs) to cloud storage.
///
/// Skeleton only — wire this up to Firebase Storage, S3, or your chosen
/// provider. Paths follow the module-based structure agreed on for the
/// project:
///
/// ```
/// /users/{userId}/avatar/
/// /work/portfolios/{userId}/
/// /work/proposals/{proposalId}/
/// /work/jobs/{jobId}/attachments/
/// /academy/courses/{courseId}/videos|materials|thumbnail/
/// /academy/certificates/{userId}/{courseId}/
/// /media/posts/{postId}/images|videos|pdfs/
/// /community/groups/{groupId}/icon/
/// /messaging/chats/{chatId}/files|voice-notes/
/// ```
class StorageService {
  StorageService._internal();
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;

  /// Uploads a file and returns its public/download URL.
  ///
  /// [path] should follow the structure above, e.g.
  /// `users/$userId/avatar/profile_photo.jpg`.
  Future<String> uploadFile({
    required String path,
    required String localFilePath,
  }) async {
    throw UnimplementedError(
      'Connect to your storage provider (e.g. Firebase Storage or S3) '
      'and upload $localFilePath to $path',
    );
  }

  Future<void> deleteFile(String path) async {
    throw UnimplementedError('Implement delete for $path.');
  }

  /// Builds a namespaced path so upload calls stay consistent across
  /// the app instead of hand-writing strings at each call site.
  static String buildPath({
    required String module,
    required String entityId,
    required String category,
    required String fileName,
  }) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return '$module/$entityId/$category/${timestamp}_$fileName';
  }
}
