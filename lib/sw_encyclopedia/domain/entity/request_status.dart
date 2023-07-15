class RequestStatus {

  final bool peopleRequesting;
  final bool planetsRequesting;
  final bool starshipsRequesting;

  const RequestStatus(this.peopleRequesting, this.planetsRequesting, this.starshipsRequesting);

  factory RequestStatus.none() => const RequestStatus(false, false, false);
  factory RequestStatus.all() => const RequestStatus(true, true, true);

  RequestStatus copyWith({
    bool? peopleRequesting,
    bool? planetsRequesting,
    bool? starshipsRequesting,
  }) => RequestStatus(
      peopleRequesting ?? this.peopleRequesting,
      planetsRequesting ?? this.planetsRequesting,
      starshipsRequesting ?? this.starshipsRequesting,
  );

  @override
  String toString() {
    return 'people: $peopleRequesting, planets: $planetsRequesting, starships: $starshipsRequesting';
  }
}
