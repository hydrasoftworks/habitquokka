# Habit Quokka

[![Fluter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Netlify Status](https://api.netlify.com/api/v1/badges/db37a603-3dd6-43c9-afd4-17494b69c7bc/deploy-status)](https://app.netlify.com/sites/habitquokka/deploys)
[![Melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

> Build better habits, one window at a time

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

## Git setup

Habit Quokka uses [conventional commits](https://h.daily-dev-tips.com/git-basics-conventional-commits) to keep commits well organized and to automatically generate a changelog.
[Git hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) are used to ensure that the commit message has proper syntax.

Please run the following commands from the root of this repository to set it up:

```bash
git config core.hooksPath .githooks/  # To change default .git hooks directory
chmod ug+x .githooks/commit-msg  # To allow execution in commit-msg file
```
