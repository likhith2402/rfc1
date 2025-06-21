# Render Deployment Guide for User-Web

## Prerequisites
- A Render account
- Your code pushed to a Git repository (GitHub, GitLab, etc.)

## Deployment Steps

### 1. Connect Your Repository
1. Go to [Render Dashboard](https://dashboard.render.com/)
2. Click "New +" and select "Web Service"
3. Connect your Git repository
4. Select the repository containing this code

### 2. Configure the Web Service

**Basic Settings:**
- **Name**: `user-web` (or your preferred name)
- **Environment**: `Node`
- **Region**: Choose closest to your users
- **Branch**: `main` (or your default branch)

**Build Settings:**
- **Build Command**: `npm install && npm run build`
- **Start Command**: `npm start`
- **Root Directory**: Leave empty (or specify if needed)

### 3. Environment Variables
Add these environment variables in Render dashboard:

```
NEXT_PUBLIC_API_URL=https://your-api-domain.com
NEXT_PUBLIC_APP_URL=https://your-app-domain.com
NEXT_PUBLIC_AUTH_TOKEN_KEY=user_auth_token
NEXT_PUBLIC_ENABLE_ANALYTICS=false
```

### 4. Advanced Settings
- **Auto-Deploy**: Enable for automatic deployments on push
- **Health Check Path**: `/` (optional)

### 5. Deploy
Click "Create Web Service" and wait for the build to complete.

## Important Notes

1. **API URL**: Make sure your API service is also deployed and accessible
2. **CORS**: Ensure your API allows requests from your Render domain
3. **Environment Variables**: Update the API URL to point to your deployed API
4. **Custom Domain**: You can add a custom domain in Render settings

## Troubleshooting

- Check build logs if deployment fails
- Ensure all environment variables are set correctly
- Verify API connectivity from Render's servers
- Check that the build command completes successfully

## Local Development

To run locally:
```bash
npm install
npm run dev
```

The app will be available at `http://localhost:4200` 