# Flutter Starter with Supabase Auth

A Flutter boilerplate project featuring user authentication with Supabase and basic multi-page navigation.

## Features

- **Auth**: Register/Login with Supabase.
- **Navigation**: 4 main pages:
  - **Homepage**
  - **Expenses Page**
  - **About Page**
  - **Contact Page**
- **Logout**: Simple logout button.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.x+)
- [Supabase account](https://supabase.io/)

### Installation

1. **Clone** the repository:

    ```bash
    git clone https://github.com/almanoduerme/flutter-starter-with-supabase-auth.git
    cd flutter-supabase-boilerplate
    ```

2. **Install dependencies**:

    ```bash
    flutter pub get
    ```

3. **Configure Supabase**: Add your `SUPABASE_URL` and `SUPABASE_ANON_KEY` to a `.env` file.

4. **Run the app**:

    ```bash
    flutter run
    ```

## Usage

- `Auth`: Register and login users with Supabase.
- `Pages`: Navigate to Homepage, Expenses, About, and Contact.
- `Logout`: Log out to clear session and return to login.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
