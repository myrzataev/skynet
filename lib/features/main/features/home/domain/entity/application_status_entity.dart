class ApplicationStatusEntity {
    String id;
    String title;
    String stageId;
    String lsAbon;
    String description;
    String arrivalDate;
    String executor;

    ApplicationStatusEntity({
        required this.id,
        required this.title,
        required this.stageId,
        required this.lsAbon,
        required this.description,
        required this.arrivalDate,
        required this.executor,
    });
}