# FLOWORA 2.0

Luxury, mobile-first menstrual cycle awareness and daily wellness tracker built as a static Progressive Web App (PWA).

**Branding:** Dev by minn_saqii  
**Credit line:** Health care with Gynecologist Manahil Saqlain

## Features
- Responsive five-tab interface: Home, Calendar, Daily Log, Reports, Settings.
- Cycle length settings from 21–40 days and bleeding duration from 3–10 days.
- Estimated next period, ovulation, and fertile-window calendar.
- Daily flow and symptom logs stored in the current browser's local storage.
- Local JSON export, local-data deletion, and printable report / Save as PDF.
- Web app manifest, SVG app icon, and same-origin service-worker caching.

## GitHub Pages
1. Open Settings → Pages in this repository.
2. Under Build and deployment, choose Deploy from a branch.
3. Select branch main and folder /(root), then Save.
4. Wait for the Pages deployment to complete. Intended URL: https://geminimodel-git.github.io/FlowOra2.0/

Serve over HTTPS (GitHub Pages does this) for service-worker and installability support. After publishing, open the URL in a mobile browser and use its browser menu to install/add to home screen where supported.

## Privacy and medical limitations
- Cycle settings and logs are saved in local storage on the device/browser profile; they are not encrypted or synced to a server. Anyone with access to the unlocked browser profile may be able to view them.
- Offline caching applies to the app shell. The first load requires a network connection.
- Calendar, period, ovulation, and fertile-window dates are estimates based on the entered start date and average cycle length. They are not a diagnosis and must not be relied on as contraception.
- FLOWORA is an educational tracking tool, not a medical device. The app does not provide a clinician's diagnosis or imply that a clinician has reviewed an individual user's data.

## Development
This is a static HTML/CSS/JavaScript project and has no build step. Test by serving the repository root over HTTP(S); service workers do not work from ordinary file URLs.
