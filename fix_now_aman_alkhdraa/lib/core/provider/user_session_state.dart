class UserSessionState {
  final bool authenticated;
  // final bool viewOnboarding;
  final bool isviewOnboarding;
  UserSessionState({
    required this.authenticated,
    // required this.viewOnboarding,
    required this.isviewOnboarding,
  });

  UserSessionState copyWith({
    bool? authenticated,
    // bool? viewOnboarding,
    bool? isviewOnboarding,
  }) {
    return UserSessionState(
      authenticated: authenticated ?? this.authenticated,
      // viewOnboarding: viewOnboarding ?? this.viewOnboarding,
      isviewOnboarding: isviewOnboarding ?? this.isviewOnboarding,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'authenticated': authenticated,
      // 'viewOnboarding': viewOnboarding,
      'isviewOnboarding': isviewOnboarding,
    };
  }

  factory UserSessionState.fromMap(Map<String, dynamic> map) {
    return UserSessionState(
      authenticated: map['authenticated'] as bool,
      // viewOnboarding: map['viewOnboarding'] as bool,
      isviewOnboarding: map['isviewOnboarding'] as bool,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory UserSessionState.fromJson(String source) => UserSessionState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserSessionState(authenticated: $authenticated, isviewOnboarding: $isviewOnboarding)';
  // String toString() => 'UserSessionState(authenticated: $authenticated, viewOnboarding: $viewOnboarding, isviewOnboarding: $isviewOnboarding)';

  @override
  bool operator ==(covariant UserSessionState other) {
    if (identical(this, other)) return true;
  
    return 
      other.authenticated == authenticated &&
      // other.viewOnboarding == viewOnboarding &&
      other.isviewOnboarding == isviewOnboarding;
  }

  @override
  // int get hashCode => authenticated.hashCode ^ viewOnboarding.hashCode ^ isviewOnboarding.hashCode;
  int get hashCode => authenticated.hashCode ^ isviewOnboarding.hashCode;
}
