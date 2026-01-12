# AmaDema AI Training - Instructor Guide

**Confidential - For Instructor Use Only**

This guide contains the complete setup and deployment instructions for the AmaDema AI Training Programme.

---

## Table of Contents

1. [Pre-Workshop Setup](#pre-workshop-setup)
2. [Sandbox Deployment](#sandbox-deployment)
3. [Website Deployment](#website-deployment)
4. [Workshop Day Procedures](#workshop-day-procedures)
5. [Troubleshooting](#troubleshooting)
6. [Post-Workshop Tasks](#post-workshop-tasks)

---

## Pre-Workshop Setup

### System Requirements

Your Intel Core Ultra 7 165H laptop with 32GB RAM is perfect for this workshop.

**Minimum requirements:**
- CPU: Intel Core i7 or equivalent (6+ cores)
- RAM: 16GB
- Storage: 20GB free space
- OS: Windows 10/11, macOS, or Linux

**Client machines (participants):**
- Any modern browser
- WiFi connection to same network as your laptop

---

## Sandbox Deployment

### Step 1: Install Docker Desktop

1. Download [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/)
2. Run the installer
3. Enable WSL 2 during installation (recommended)
4. Restart your computer
5. Launch Docker Desktop

**Verify installation:**

```powershell
docker --version
docker-compose --version
```

Expected output:
```
Docker version 24.x.x
Docker Compose version v2.x.x
```

---

### Step 2: Create Sandbox Directory

```powershell
# Navigate to your Documents folder
cd "$env:USERPROFILE\Documents"

# Create AmaDema folder if it doesn't exist
mkdir AmaDema -ErrorAction SilentlyContinue
cd AmaDema

# Create sandbox folder
mkdir AITrainingSandbox
cd AITrainingSandbox
```

This creates: `C:\Users\YOUR_USERNAME\Documents\AmaDema\AITrainingSandbox`

---

### Step 3: Create Docker Compose Configuration

Create a file named `docker-compose.yml` in the `AITrainingSandbox` folder:

```yaml
version: '3.8'

services:
  ollama:
    image: ollama/ollama:latest
    container_name: amadema-ollama
    ports:
      - "11434:11434"
    volumes:
      - ollama_data:/root/.ollama
    environment:
      - OLLAMA_HOST=0.0.0.0:11434
    restart: unless-stopped
    networks:
      - amadema-network

  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    container_name: amadema-webui
    ports:
      - "3000:8080"
    environment:
      - OLLAMA_BASE_URL=http://ollama:11434
      - WEBUI_AUTH=true
      - WEBUI_NAME=AmaDema AI Sandbox
      - ENABLE_ADMIN_EXPORT=true
    volumes:
      - webui_data:/app/backend/data
    depends_on:
      - ollama
    restart: unless-stopped
    networks:
      - amadema-network

volumes:
  ollama_data:
  webui_data:

networks:
  amadema-network:
    driver: bridge
```

---

### Step 4: Start the Sandbox

```powershell
docker-compose up -d
```

This will:
1. Download Ollama and Open WebUI images (~2GB)
2. Start both services
3. Create network for communication

**Wait 2-3 minutes** for services to fully start.

---

### Step 5: Download Llama 3.2 Model

```powershell
docker exec amadema-ollama ollama pull llama3.2:3b
```

Downloads ~1.5GB. **Allow 2-5 minutes**.

**Note:** We use 3 billion parameter model for speed and compatibility with CPU inference. Perfect for training purposes.

---

### Step 6: Create Admin Account

1. Open browser: `http://localhost:3000`
2. You'll see Open WebUI login page
3. Create account:
   - Email: your.email@amadema.com
   - Password: (choose strong password)
   - Name: Avgi Stavrou

**First account = Admin automatically**

---

### Step 7: Configure Admin Settings

1. Click profile (top-right) → **Admin Panel**
2. Navigate to **Settings** → **General**
3. Enable:
   - ✅ "Conversation Monitoring"
   - ✅ "Export All Chats"
4. Leave "User Registration" enabled until all participants have accounts

---

### Step 8: Prepare Employee Accounts

**Option A: Pre-create (Recommended)**

1. Admin Panel → **Users** → "Add User"
2. For each participant:
   - Email: employee@amadema.com
   - Name: Employee Name
   - Password: Create simple password (e.g., "amadema123")
   - Role: User

**Option B: Self-Registration (During Workshop)**

1. Share URL with participants
2. They create accounts themselves
3. Disable registration after all join

---

## Finding Your IP Address

Participants need your laptop's IP to connect.

```powershell
ipconfig
```

Look for **IPv4 Address** under WiFi adapter (usually `192.168.x.x`).

Example: `192.168.1.105`

**Share with participants:**
```
http://192.168.1.105:3000
```

---

## Website Deployment

The training website is hosted on GitHub Pages.

### Repository Setup

Already completed, but for reference:

**Repository:** https://github.com/avgistavrou/Aitraining  
**Website:** https://avgistavrou.github.io/Aitraining/  
**Password:** AmaDema2026

### Making Updates

```powershell
# Make changes to docs/
git add .
git commit -m "Update training materials"
git push origin main
```

Site auto-deploys via GitHub Actions in 2-3 minutes.

---

## Workshop Day Procedures

### Before Each Session

#### 1. Start Sandbox (30 min before)

```powershell
cd "$env:USERPROFILE\Documents\AmaDema\AITrainingSandbox"
docker-compose up -d
```

Verify it's running: `http://localhost:3000`

#### 2. Find Your IP Address

```powershell
ipconfig
```

Note the IPv4 address.

#### 3. Test Connection

Open browser: `http://YOUR_IP:3000`

Try a test prompt with llama3.2:3b model.

#### 4. Prepare Credentials

- Write IP address on whiteboard/slide
- Have employee credentials ready (if pre-created)

---

### During Session

#### Monitor Participant Activity

1. Login as admin
2. Admin Panel → **Chats**
3. View real-time conversations
4. Identify participants needing help

#### Common Support Issues

**"Can't connect"**
- Check WiFi network (same as your laptop?)
- Verify IP address correct
- Try refreshing page

**"Model not responding"**
- Check model selected (llama3.2:3b)
- Wait 10-15 seconds (CPU can be slow)
- Start new chat

**"Forgot password"**
- Reset in Admin Panel → Users

---

### After Each Session

```powershell
# Optional - keeps data for next session
docker-compose down
```

Or leave running if continuing next day.

---

## Troubleshooting

### Port 3000 Already in Use

Change port in `docker-compose.yml`:

```yaml
ports:
  - "3001:8080"  # Use 3001 instead
```

Restart: `docker-compose down && docker-compose up -d`

### Model Too Slow

**Expected:** 3-8 seconds per response on CPU

**If slower:**
- Close other applications
- Increase Docker memory: Docker Desktop → Settings → Resources → 16GB

### Participants Can't Connect

1. **Check firewall:** Allow port 3000
2. **Verify network:** All on same WiFi?
3. **Test ping:** `ping YOUR_IP` from participant machine

### Docker Won't Start

1. Ensure Docker Desktop running
2. Restart Docker Desktop
3. Check WSL 2 enabled (Windows Settings → Apps → Optional Features)

---

## Advanced Configuration

### Adjust Model Parameters

In Open WebUI (as admin or user):

Chat interface → Settings icon → Adjust:
- **Temperature**: 0.7 (default), lower = focused, higher = creative
- **Max tokens**: 2048 (response length)
- **Context window**: 4096

### Export Workshop Data

After workshop, backup all conversations:

```powershell
docker exec amadema-webui tar czf /tmp/backup.tar.gz /app/backend/data
docker cp amadema-webui:/tmp/backup.tar.gz ./workshop-backup-2026-01-12.tar.gz
```

---

## Post-Workshop Tasks

### 1. Export Chats

Admin Panel → Export all chats for review

### 2. Gather Feedback

- What worked well?
- What exercises were most effective?
- Technical issues encountered?

### 3. Update Materials

Based on feedback, update:
- Exercises with better examples
- Troubleshooting section
- Timing for each module

### 4. Clean Up (Optional)

If not running workshop again soon:

```powershell
docker-compose down
docker volume rm aitraining_ollama_data aitraining_webui_data
```

This removes all data and models (saves ~6GB).

---

## Workshop Timing Guide

### Day 1-2: Precision Engineering (3 hours)

| Section | Duration | Notes |
|---------|----------|-------|
| Introduction & Setup | 15 min | Get everyone connected |
| AUTOMAT Framework | 45 min | Teach + Exercise 1 |
| CO-STAR Framework | 30 min | Teach + Exercise 2 |
| Break | 10 min | |
| Responsible AI | 40 min | Red List, Hallucination Hunt |
| Wrap-up | 10 min | Q&A, homework |

### Day 3-4: Green AI & Optimization (3 hours)

| Section | Duration | Notes |
|---------|----------|-------|
| Recap & NLMs vs LLMs | 30 min | Quick review + new content |
| Green AI Practices | 45 min | Environmental impact + exercises |
| Break | 10 min | |
| Optimization Strategies | 45 min | 10 techniques + challenge |
| Green Optimization Challenge | 20 min | Team competition |
| Wrap-up & Certification | 10 min | Next steps, resources |

---

## Quick Reference Commands

**Start sandbox:**
```powershell
cd "$env:USERPROFILE\Documents\AmaDema\AITrainingSandbox"
docker-compose up -d
```

**Stop sandbox:**
```powershell
docker-compose down
```

**Check if running:**
```powershell
docker ps
```

**View logs:**
```powershell
docker-compose logs -f
```

**List models:**
```powershell
docker exec amadema-ollama ollama list
```

**Pull new model:**
```powershell
docker exec amadema-ollama ollama pull llama3.2:3b
```

**Find your IP:**
```powershell
ipconfig | findstr IPv4
```

---

## Contact & Support

**For technical issues during setup:**
- Docker documentation: https://docs.docker.com/
- Ollama documentation: https://ollama.com/
- Open WebUI: https://github.com/open-webui/open-webui

**For content questions:**
- Review course materials at: https://avgistavrou.github.io/Aitraining/

---

**Last updated:** January 2026  
**Instructor:** Avgi Stavrou
