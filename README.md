## Instructions

### Flutter Version

- Flutter version: `3.16.9`

### Running the Project

The project is developed exclusively for web platforms. To run the project, execute:

```bash
flutter run

```

### Handling Model Generation

The project uses Json Serializable for receiving incoming models from a mocked out remote data source. If the .g.dart files are missing, run:

```bash
dart run build_runner watch --delete-conflicting-outputs

```

## Architecture and Design Pattern

### MVVM with Clean Architecture

This project adopts the Model-View-ViewModel (MVVM) design pattern, leveraging the Provider package within the context of Clean Architecture. The rationale behind this architectural choice includes:

- **Demonstration of Best Practices**:

  - Emphasizes maintainable and scalable code structure.
  - Showcases the ability to implement industry best practices.
  - Particularly crucial for projects that may evolve or scale over time.

- **Adherence to SOLID Principles**:

  - Demonstrates proficiency with key software development concepts.
  - Ensures that the project aligns naturally with these essential principles.

- **Real-World Problem Simulation**:
  - Serves as an effective platform for simulating real-world scenarios, despite the project's modest size.
  - Showcases an approach to complex problem solving.
  - The fully mocked data layer facilitates easy connection to a real remote data source with minimal changes, indicating readiness for larger and more intricate projects.

## Final Considerations

- Two details of the requirement got me really thinking:

  1. "Expand the calendar to support more than the current month."; and
  2. Adding/Editing a reminder should allow a user to change the date. Therefore, clicking the date itself in the calendar did not necessarily meant adding a reminder TO that day.

  With these two considerations being said, I implemented every month possible (to the future only, not the past) until the year 2099. I also allowed, as it was requested, the user to change the date of a reminder on creation/edition, and by doing so, allowing them to navigate to the chosen date after completing the action.

- The date field validation is done in two steps: 1. Through a Regular Expression checking for 12 months, 30 days, and future years. And 2. Through real calendar validation, that is, counting for leap years and extra days in February. To experience the validation, try inputting the date "02/29/2024" and then "02/29/2025".

- The codebase includes comprehensive comments for clarity, but I am available to answer any further questions.
