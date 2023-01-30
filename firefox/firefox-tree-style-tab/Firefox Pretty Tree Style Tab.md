# Firefox pretty sliding sidebar / pinned / active tab theme for Tree Style Tab

## Features
* Auto-sliding draw for TST
* Leaves 'pinned' and 'active' tabs visible in standard browser chrome
* Leaves 'last-active' tabs visible for 3 minutes after becoming inactive
* Where an active tab is pinned, leaves 'last-active' tab (x1) visible for 1hr


![tree-style-tabs-theme](https://user-images.githubusercontent.com/1694740/82731893-370f1780-9d4d-11ea-8217-705c560b5a35.gif)

## Instructions
  1. Choose: (Hamburger menu) -> 'Customize'
    - Switch 'Title bar': off
    - also 'Drag space': off
  2. Browse to URL "about:config"
    - set `toolkit.legacyUserProfileCustomizations.stylesheets: true`
  3. Browse to URL "about:profiles"
    - Select 'Profile in use' -> 'Root Directory' -> 'Show in Finder' (Mac)
    - Save `userChrome.css` under `${Root Directory}/chrome/` (you may need to create this directory)
    - restart the browser
  4. Install Tree Style Tab
  5. Browse to URL: "about:addons"
    - Select 'Tree Style Tab' -> 'Preferences' tab -> 'Extra style rules for sidebar contents'
    - paste in the content from `tree-style-tabs-theme.css`