class GetCalculateWheyBySearchFailed implements Exception {}

class GetCalculateWheyBySearchErrorInternalServer implements GetCalculateWheyBySearchFailed {}

class GetCalculateWheyUnknownErrorCode implements GetCalculateWheyBySearchFailed{}



class UpdateCalculateWheyFailed implements Exception {}

class UpdateCalculateWheyErrorInternalServer implements UpdateCalculateWheyFailed {}

class UpdateCalculateWheyUnknownErrorCode implements UpdateCalculateWheyFailed {}