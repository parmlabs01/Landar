# LANDER — Flutter Frontend

Learn. Connect. Work. Grow. — Powered by Parm

## What's included

This is a frontend-only Flutter skeleton implementing the LANDER PRD's four core modules with mock data (no backend/API wired up yet):

- **Splash screen** — matches PRD spec (white background, logo, tagline, "Powered by Parm")
- **Auth** — login screen + signup screen with user-type selection (Student, Freelancer, Client, Instructor, Media Creator)
- **Home shell** — bottom navigation across the 4 modules + profile
- **LANDER Work** — job feed with category filters, job detail screen, proposal submission UI
- **Parm Academy** — course explore/my-learning tabs, course detail with curriculum + progress
- **LANDER Media** — social feed supporting text/image/poll post formats, trending tags
- **LANDER Community** — community directory with category filters, join/joined state
- **Profile** — XP/level progress bar, badges, role-based dashboard menu (gamification per PRD section 11)

Brand colors (orange #FF6B00, white, dark gray #1A1A1A, light gray) are centralized in `lib/core/theme.dart`.

## Project structure

```
lib/
  core/          theme + constants
  models/        data models with mock data (Job, Course, Post, Community, User)
  screens/       one folder per module/flow
  widgets/       reusable cards (JobCard, CourseCard, PostCard, CommunityCard, XpProgressBar)
  main.dart
```

## Running it

You'll need the Flutter SDK installed locally (this sandbox has no Flutter/network access to fetch packages or run a build).

```bash
flutter pub get
flutter run
```

## Not yet implemented (next steps)

- Backend integration (auth, payments, real job/course/post data)
- LANDER AI assistant, job/talent matching engine
- Messaging (chat, voice notes, video meetings)
- Admin dashboard
- Push notifications, deep linking
- State management (currently local `setState`/mock data only — consider Riverpod or Bloc as the app grows)
