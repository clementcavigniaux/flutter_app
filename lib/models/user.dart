class User {
    final String token;
    final String id;
    final String firstname;
    final String lastname;

    User(this.token, this.id, this.firstname, this.lastname);

    Map<String, dynamic> toJSON() => <String, dynamic>{
        'token': this.token,
        'id': this.id,
        'firstname': this.firstname,
        'lastname': this.lastname
    };

    factory User.fromJSON(Map<String, dynamic> json) => new User(
        json['token'],
        json['id'],
        json['firstname'],
        json['lastname'],
    );

    @override
    String toString() {
        return '{token: $token, id: $id, firstname: $firstname, lastname: $lastname}';
    }
}