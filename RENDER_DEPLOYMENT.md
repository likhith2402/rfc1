# 🚀 User-Web Render Deployment Guide (Web Service)

This guide provides instructions for deploying the `user-web` application as a **Web Service** on Render. This is the correct method for applications that include API routes or other server-side logic.

## ✅ Prerequisites
- A Render account.
- Your code is pushed to a Git repository (GitHub, GitLab, etc.).

## 📋 Deployment Steps

### 1. Create a New Web Service on Render
1.  Go to the [Render Dashboard](https://dashboard.render.com/).
2.  Click **"New +"** and select **"Web Service"**.
3.  Connect your Git repository.

### 2. Configure the Web Service
Fill in the following settings during creation:

| Setting | Value | Notes |
| :--- | :--- | :--- |
| **Name** | `user-web` (or your choice) | A unique name for your service. |
| **Environment** | `Node` | Specifies the runtime. |
| **Branch** | `main` | The branch you want to deploy. |
| **Build Command** | `npm install && npx nx build user-web` | Installs dependencies and builds the application. |
| **Start Command** | `npx nx start user-web` | Starts the Next.js server. |
| **Auto-Deploy** | ✅ Enable | Automatically deploys new commits. |

### 3. Add Environment Variables
After creating the service, go to the **"Environment"** tab and add the variables your application needs.

| Key | Value |
| :--- | :--- |
| `NEXT_PUBLIC_API_URL` | `https://your-api-domain.com` |
| `NEXT_PUBLIC_APP_URL` | The URL Render gives you. |
| `NEXT_PUBLIC_AUTH_TOKEN_KEY` | `your_auth_token_key` |

### 4. Deploy
1.  Click **"Create Web Service"**.
2.  Render will automatically start the first deployment. You can monitor the progress in the **"Events"** or **"Logs"** tab.
3.  Once the deployment is complete, your site will be live at the URL provided by Render.

## ⚠️ Important Notes
- **Health Check**: Render automatically checks the root URL (`/`). Since your `/api/health` route is available, you can optionally set the **Health Check Path** in your service's settings to `/api/health` for more precise monitoring.
- **Root Directory**: Ensure the **Root Directory** field in your Render settings is left **empty**, as your `package.json` is at the top level of your repository.

## 🔧 Troubleshooting
- **Build Fails**: Check the deploy logs. Ensure all dependencies are correctly listed in `package.json`.
- **Application Errors**: Review the runtime logs in Render. Check that all necessary environment variables are set.
- **Not Found Errors**: If you see 404s, verify that your **Start Command** is correct and that the build process completed successfully.

Your `user-web` application is now re-configured and ready for a Web Service deployment! 