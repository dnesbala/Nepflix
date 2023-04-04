String handleFirebaseFailure(String errorCode) {
  switch (errorCode) {
    case "permission-denied":
      return "Permission Denied";
    case "not-found":
      return "Resource Not Found";
    default:
      return "Something Went Wrong";
  }
}
