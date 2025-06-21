# 🚀 User-Web Render Deployment Guide (Static Site)

This guide provides instructions for deploying the `user-web` application as a **Static Site** on Render. This method is fast, cost-effective, and ideal for front-end applications.

## ✅ Prerequisites
- A Render account.
- Your code is pushed to a Git repository (GitHub, GitLab, etc.).

## 📋 Deployment Steps

### 1. Create a New Static Site on Render
1.  Go to the [Render Dashboard](https://dashboard.render.com/).
2.  Click **"New +"** and select **"Static Site"**.
3.  Connect your Git repository.

### 2. Configure the Static Site
Fill in the following settings during creation:

| Setting | Value | Notes |
| :--- | :--- | :--- |
| **Name** | `user-web` (or your choice) | A unique name for your service. |
| **Branch** | `main` | The branch you want to deploy. |
| **Build Command** | `npm install && npx nx build user-web` | Installs dependencies and builds the static assets. |
| **Publish Directory** | `dist/apps/user-web` | **Crucial!** This is where Next.js exports the static files. |
| **Auto-Deploy** | ✅ Enable | Automatically deploys new commits. |

### 3. Add Environment Variables
Even for a static site, environment variables are needed *at build time* to be included in the code.

1.  After creating the site, go to the **"Environment"** tab.
2.  Add the following variables:

| Key | Value |
| :--- | :--- |
| `NEXT_PUBLIC_API_URL` | `https://your-api-domain.com` |
| `NEXT_PUBLIC_APP_URL` | The URL Render gives you. |
| `NEXT_PUBLIC_AUTH_TOKEN_KEY` | `your_auth_token_key` |

### 4. Deploy
1.  Click **"Create Static Site"**.
2.  Render will automatically start the first deployment. You can monitor the progress in the **"Events"** or **"Logs"** tab.
3.  Once the deployment is complete, your site will be live at the URL provided by Render.

## ⚠️ Important Notes
- **API Calls**: Since server `rewrites` are not available, all API calls in your frontend code must use the full URL of your backend (i.e., the value of `NEXT_PUBLIC_API_URL`).
- **Image Optimization**: The Next.js Image component's optimization features are disabled (`unoptimized: true`). Images will be served as-is. For optimization, you would need a third-party loader.
- **No API Routes**: Any functions in `src/app/api` will not be available.

## 🔧 Troubleshooting
- **Build Fails**: Check the deploy logs. The most common issues are incorrect build commands or missing dependencies in `package.json`.
- **404 Errors**: Ensure the **Publish Directory** is set correctly to `dist/apps/user-web`. If this is wrong, Render won't find your `index.html` file.
- **Environment Variables not working**: Make sure you set the variables in the "Environment" tab *before* triggering a build, as they are used during the build process.

Your `user-web` application is now configured and ready for a static site deployment! 