# Login Video Background Setup

## Overview

The Well-Tegra SPA now supports a custom video background on the login screen. The system is designed to use `login.mp4` as the primary video with automatic fallback to `hero1.mp4` if the login video is not available.

## Adding Your Login Video

### Step 1: Add the Video File

1. Place your `login.mp4` file in the `assets/media/` directory
2. Recommended specifications:
   - Format: MP4 (H.264 codec recommended)
   - Resolution: 1920x1080 or higher for best quality
   - Duration: 30 seconds to 2 minutes (loops automatically)
   - File size: Optimize for web (2-10MB recommended)

### Step 2: Video Requirements

- **Muted by default**: The video starts muted for better user experience
- **Autoplay**: Will automatically start playing when the page loads
- **Loop**: Continuously loops for seamless background experience
- **Responsive**: Automatically scales to fit different screen sizes

### Current Fallback System

```html
<video id="login-video" class="absolute inset-0 w-full h-full object-cover" muted playsinline loop autoplay>
    <source src="assets/media/login.mp4" type="video/mp4">
    <source src="assets/media/hero1.mp4" type="video/mp4">
    <!-- Fallback to hero1.mp4 if login.mp4 doesn't exist -->
</video>
```

### Video Controls Available

- **🔇 Mute/Unmute**: Toggle audio on/off
- **⏸️ Play/Pause**: Control video playback
- **Backdrop Blur**: Overlay effect for better text readability

### File Structure

```text
assets/
  media/
    login.mp4          ← Your login video goes here
    hero1.mp4          ← Current fallback video
    hero2.mp4
    icon.mp4
    Global_Data_Integration_Visualization (2).mp4
```

## Technical Implementation

### Video Styling

The login video includes:

- Brightness filter (70%) for better text visibility
- Backdrop blur overlay for improved readability
- Object-fit cover for proper aspect ratio maintenance

### Error Handling

- Graceful fallback if login.mp4 fails to load
- Console warnings for debugging
- Automatic video control initialization

### Performance Considerations

- Video preloading is automatic
- Playback starts immediately when possible
- Optimized for mobile devices with `playsinline` attribute

## Usage

Once you add `login.mp4` to the `assets/media/` folder, the login screen will automatically use it as the background video. No code changes are required - the system will detect and use the new video immediately upon page refresh.
