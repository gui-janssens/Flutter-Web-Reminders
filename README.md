## Instructions

### Flutter Version

- Flutter version: `3.16.9`

### Running the Project

The project is developed exclusively for web platforms. To run the project, execute:

```bash
flutter run

```

### Handling Model Generation

The project uses Json Serializable for mocking incoming models from a remote data source. If the .g.dart files are missing, run:

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

- The codebase includes comprehensive comments for clarity, but I am available to answer any further questions.
- The application is deployed and accessible [here](https://linkhere.com)
