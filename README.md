# Notes Project for NetForeMost

The goal of this project is to demonstrate the use of clean code best practices and basic design patterns 
in Ruby. The project consists of developing a basic virtual notebook in which the user can create, view, 
and edit notes, as well as search for notes by title or body content.

## User Stories
### [User Story 1](https://github.com/Wusinho/proyecto_notas/tree/dev-historia_1)
The user should be able to create notes that contain:

- Title
- Body
- Date

### [User Story 2](https://github.com/Wusinho/proyecto_notas/tree/dev-historia_2)
The user can view all notes, sort them by topic, title, or date, and open a specific note.

### [User Story 3](https://github.com/Wusinho/proyecto_notas/tree/dev-historia_3)

The user should be able to create and edit these notes.

### [User Story 4](https://github.com/Wusinho/proyecto_notas/tree/dev-historia_4)
The user is able to search for a note by title or body content and open it.

## How to Complete the Project
To complete the project, follow these instructions:

- Develop the virtual notebook on any platform.
- Make sure to follow clean code best practices and use basic design patterns in Ruby.
- Verify that there are no bugs or anti-patterns in your project.
- Complete the provided user stories, noting the completion time (hours it took to complete the story).
- Send the user stories and the .zip file of your solution by email.

## Video Link

[video](https://www.loom.com/share/a2f8e72879d2411b9e10c4622ec6d01b)

## Built With

- Ruby 2.7.2
- Ruby on Rails 7.0.4
- PostgreSQL
- Rspec gem
- Devise gem
- Faker gem
- Bootstrap

### Setup

To run this project locally, please ensure you have Ruby and Ruby on Rails installed on your machine, then clone this repository by running.

```bash
git clone https://github.com/Wusinho/proyecto_notas.git
```

Open your terminal and CD to the directory where you create the clone repository.

Now run:

```bash
bundle install
```
```bash
rails db:create && rails db:migrate
```

Is super important to populate the app, so now run:

```bash
rails db:seed
```

To set up the server put:

```bash
rails s
```

After this you can open your favorite web-browser and copy paste the next:

```bash
http://localhost:3000
```

### Author

👤 **Heber Lazo**

- Github: [@Wusinho](https://github.com/Wusinho)
- LinkedIn: [Heber Lazo](https://www.linkedin.com/in/heber-lazo/)

## Show your support

Give a ⭐️ if you like this project!
