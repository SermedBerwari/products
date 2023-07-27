class ServeceApi {
  login(username, password) {
    if (username != "Ahmed") {
      return {"status": "Username is wrong"};
    } else {
      if (password != '123') {
        return {"status": "Password is wrong"};
      } else {
        return {"status": "Logined Succefully"};
      }
    }
  }
}
