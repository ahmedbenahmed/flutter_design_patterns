// singleton class
class MySingleton {
  MySingleton._(); // Private constructor to prevent instantiation from outside the class

  static final MySingleton _instance = MySingleton._(); // Single instance

  // Factory method to provide access to the singleton instance
  factory MySingleton() {
    return _instance;
  }

  String getHelloMessage() {
    return 'Hello from MySingleton!';
  }
}
