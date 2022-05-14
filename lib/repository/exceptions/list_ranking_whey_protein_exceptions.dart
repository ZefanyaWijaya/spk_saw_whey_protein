class GetListRankingWheyProteinFailed implements Exception {}

class GetListRankingWheyProteinErrorInternalServer implements GetListRankingWheyProteinFailed{}

class GetListRankingWheyUnknownErrorCode implements GetListRankingWheyProteinFailed{}



class PostListWheyFailed implements Exception {}

class PostListWheyFailedErrorInternalServer implements PostListWheyFailed{}

class PostListWheyUnknownErrorCode implements PostListWheyFailed {}



class UpdateListWheyFailed implements Exception {}

class UpdateListWheyFailedErrorInternalServer implements UpdateListWheyFailed{}

class UpdateListWheyUnknownErrorCode implements UpdateListWheyFailed {}



class DeleteListWheyFailed implements Exception {}

class DeleteListWheyFailedErrorInternalServer implements DeleteListWheyFailed {}

class DeleteListWheyUnknownErrorCode implements DeleteListWheyFailed{}