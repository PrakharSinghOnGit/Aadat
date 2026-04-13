# Aadat

A native iOS habit tracker and day planner designed around a timeline-based visualization

## Overview

Aadat combines the functional structure of a calendar with the logging mechanics of a habit tracker. Users can plan their days by adding habits, tasks, or reminders to a continuous timeline. It features a gamified progression system where completing daily logs contributes to an ELO score, unlocking cosmetic UI enhancements.

## Core Features

- **Timeline Visualization:** A split-screen layout featuring a top calendar view (10-15% of the screen) and a vertical timeline representing the day's schedule.
- **Strict Logging:** Enforcement of a "You can't change the past" rule; missed logs by the end of the day are automatically marked incomplete.
- **Dynamic Recurrence:** Support for daily, weekly, monthly, or custom habit repetition.
- **Gamification System:** Daily calculation of completion percentages feeds into an ELO progression system.
- **Cosmetic Unlocks:** ELO milestones unlock visual effects for the timeline (e.g., Golden, Glowing, Snake, Rope, Tron).

## Tech Stack

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Persistence:** SwiftData
- **Notifications:** UserNotifications

## Architecture: MVVM (Model-View-ViewModel)

The project follows a strict MVVM pattern to separate data logic from the UI.

- **Models:** Define the core `Habit` entities using SwiftData (ID, name, dates, recurrence logic, status
- **ViewModels:** Handle all business logic, such as sorting lists by priority, calculating ELO, and enforcing time-locks on past entries.
- **Views:** Declarative UI built with SwiftUI Stacks (`VStack`, `ZStack`, `HStack`), ensuring a native iOS look and feel.

## Development Philosophy

Built using a "Function-First" approach. Data structures and logical operations (MVP) are prioritized and validated using basic visual representations before applying extensive UI polish or modifiers.
