# Habit Quokka

> Build better habits, one window at a time

[![Fluter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white)](https://flutter.dev)
[![Supabase](https://img.shields.io/badge/Supabase-2B825B?logo=supabase&logoColor=white)](https://supabase.com)
[![Netlify Status](https://api.netlify.com/api/v1/badges/db37a603-3dd6-43c9-afd4-17494b69c7bc/deploy-status)](https://app.netlify.com/sites/habitquokka/deploys)
[![Melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

[![License](https://img.shields.io/github/license/hydrasoftworks/habitquokka)](https://github.com/hydrasoftworks/habitquokka/blob/master/LICENSE)

Habit Quokka is an online habit-tracking app that uses a unique design inspired by advent calendars. Users can create habit trackers for any habit they want to follow and open a window on the grid every time they perform that habit. This reveals a hidden image one step at a time and makes building good habits fun and playful. The app's design is a refreshing change from traditional habit trackers, and it motivates users to stick to their habits.

## Build from source code

### Flutter

The frontend application is built with Flutter and uses [FVM](https://fvm.app/) to manage Flutter versions. The easiest way is to install FVM with `brew`.

```bash
brew tap leoafarias/fvm
brew install fvm
```

With FVM installed, head to the project directory and call

```bash
fvm use
```

it will download the used Flutter version and link it to the project directory. Thanks to that, you can use different Flutter versions for different projects.

All scripts in the project are managed with `melos`. You have to install it with:

```bash
fvm dart pub global activate melos
```

Then, run `melos bootstrap` in the root of the project to get all the dependencies and generate the translation files and other generated content.

Call `melos run` to see other useful scripts.

## Supabase

Application data are stored on [Supabase](https://supabase.com/). To create a local environment install [Docker Desktop](https://docs.docker.com/desktop/) and [Supabase CLI](https://supabase.com/docs/guides/cli) first.

Next from the project root, call `supabase start`. After a while, you will get project configuration details. If you need more info, consult [this page](https://supabase.com/docs/guides/getting-started/local-development).

## Local environment

In the project root, there is a file named `example.development.json`. Copy it to `development.json`.

```bash
cp example.development.json development.json
```

and fill required values before starting the Flutter project.

The environment configuration file can be passed to Flutter with `--dart-define-from-file=[environment].json` parameter.


## Git setup

Habit Quokka uses [conventional commits](https://h.daily-dev-tips.com/git-basics-conventional-commits) to keep commits well organized and to automatically generate a changelog.
[Git hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) are used to ensure that the commit message has proper syntax.

Please run the following commands from the root of this repository to set it up:

```bash
git config core.hooksPath .githooks/  # To change default .git hooks directory
chmod ug+x .githooks/commit-msg  # To allow execution in commit-msg file
```
