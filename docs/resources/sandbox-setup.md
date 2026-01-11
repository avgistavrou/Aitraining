# Sandbox Setup Guide

This guide will help you set up the **AmaDema AI Sandbox**—a local, air-gapped environment for practicing prompt engineering with real, sensitive data.

## Overview

The sandbox consists of:

- **Ollama**: Runs Llama 3.3 8B model locally
- **Open WebUI**: Provides chat interface and admin monitoring
- **Docker Compose**: Orchestrates both services

**Key benefits:**

✅ Complete data privacy—your prompts never leave the server  
✅ No API costs or usage limits  
✅ Admin can monitor all conversations in real-time  
✅ Employees need only a browser—no installations

---

## System Requirements

### Host Machine (Workshop Server)

**Minimum:**
- CPU: Intel Core i7 or equivalent (6+ cores)
- RAM: 16GB
- Storage: 20GB free space
- OS: Windows 10/11, macOS, or Linux

**Recommended (for your Intel Core Ultra 7 165H):**
- CPU: Intel Core Ultra 7 165H ✓
- RAM: 32GB ✓
- Storage: 50GB free space
- OS: Windows 11 ✓

Your laptop exceeds the requirements—**you're all set!**

### Client Machines (Employees)

- Any modern browser (Chrome, Firefox, Edge)
- WiFi connection to same network as server

---

## Installation Steps

### Step 1: Install Docker Desktop

#### For Windows 11:

1. Download [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/)
2. Run the installer
3. Enable WSL 2 during installation (recommended)
4. Restart your computer
5. Launch Docker Desktop
6. Verify installation:

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

Create a folder for the sandbox:

```powershell
cd C:\Users\fo18437\OneDrive - University of Bristol\Documents\AmaDema
mkdir AITrainingSandbox
cd AITrainingSandbox
```

---

### Step 3: Create Docker Compose Configuration

Create a file named `docker-compose.yml` with the following content:

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

**Save this file** in your `AITrainingSandbox` folder.

---

### Step 4: Start the Sandbox

In PowerShell, from the `AITrainingSandbox` folder:

```powershell
docker-compose up -d
```

This will:
1. Download Ollama and Open WebUI images (~2GB)
2. Start both services
3. Create a network for them to communicate

**Wait 2-3 minutes** for services to fully start.

---

### Step 5: Download Llama 3.3 8B Model

Once services are running:

```powershell
docker exec -it amadema-ollama ollama pull llama3.3:8b
```

This will download the model (~4.7GB). **Allow 5-10 minutes** depending on your internet speed.

---

### Step 6: Verify Installation

1. Open your browser
2. Navigate to: `http://localhost:3000`
3. You should see the Open WebUI login page

**Create your admin account:**
- Email: your.email@amadema.com
- Password: (choose a strong password)
- Name: Avgi Stavrou

The **first account created** automatically becomes the admin.

---

### Step 7: Configure Admin Settings

Once logged in:

1. Click your profile (top-right)
2. Go to **Admin Panel**
3. Navigate to **Settings** → **General**
4. Configure:
   - Enable "Conversation Monitoring"
   - Enable "Export All Chats"
   - Disable "User Registration" (after creating employee accounts)

---

### Step 8: Create Employee Accounts

**Option A: Pre-create Accounts (Recommended)**

1. Admin Panel → **Users**
2. Click "Add User"
3. Create account for each employee:
   - Email: employee@amadema.com
   - Name: Employee Name
   - Password: (provide them individually)
   - Role: User

**Option B: Self-Registration (Workshop Start)**

1. Share the URL: `http://YOUR_LAPTOP_IP:3000`
2. Employees create accounts
3. You disable registration once all are joined

---

## Finding Your Laptop's IP Address

Employees need your laptop's IP to connect. Find it:

```powershell
ipconfig
```

Look for **IPv4 Address** under your WiFi adapter (usually `192.168.x.x`).

Example: `192.168.1.105`

**Share this URL with employees:**
```
http://192.168.1.105:3000
```

---

## Workshop Day Usage

### Starting the Sandbox

Before each workshop session:

```powershell
cd C:\Users\fo18437\OneDrive - University of Bristol\Documents\AmaDema\AITrainingSandbox
docker-compose up -d
```

### Monitoring Employee Chats

1. Login to Open WebUI as admin
2. Navigate to **Admin Panel** → **Chats**
3. View all conversations in real-time
4. Export chats for post-workshop review

### Stopping the Sandbox

After each session:

```powershell
docker-compose down
```

(Data is preserved in volumes—chats remain available next time)

---

## Troubleshooting

### Issue: "Port 3000 already in use"

Change the port in `docker-compose.yml`:

```yaml
ports:
  - "3001:8080"  # Change to any free port
```

Then access via `http://localhost:3001`

### Issue: Model is slow

**Expected:** CPU inference is slower than GPU. Llama 3.3 8B should respond in **5-15 seconds** on your CPU.

**If too slow:**
- Close unnecessary applications
- Increase Docker memory: Docker Desktop → Settings → Resources → Memory (allocate 16GB)

### Issue: Employees can't connect

1. Check firewall: Allow incoming connections on port 3000
2. Verify same WiFi network
3. Ping test: `ping YOUR_LAPTOP_IP`

### Issue: "Cannot connect to Docker daemon"

1. Ensure Docker Desktop is running
2. Restart Docker Desktop
3. Check WSL 2 is enabled (for Windows)

---

## Advanced Configuration

### Custom Model Parameters

Adjust temperature, context window, etc. in Open WebUI:

1. Chat interface → Settings (gear icon)
2. Adjust:
   - **Temperature**: 0.7 (default), lower = more focused
   - **Max tokens**: 2048 (default), higher = longer responses
   - **Context window**: 4096

### Backing Up Workshop Data

Export all chats after workshop:

```powershell
docker exec amadema-webui tar czf /tmp/backup.tar.gz /app/backend/data
docker cp amadema-webui:/tmp/backup.tar.gz ./workshop-backup.tar.gz
```

---

## Security Considerations

!!! warning "Air-Gapped Security"
    
    ✅ **What this protects:**
    - Your prompts never leave the local network
    - Model runs entirely offline (after initial download)
    - No external API calls
    
    ⚠️ **What to still protect:**
    - Employees should still follow Red List protocols
    - Admin has access to all chats—handle responsibly
    - Backup files contain all conversations—encrypt if storing

---

## Next Steps

1. ✅ Complete this setup before Day 1
2. ✅ Test with a sample prompt
3. ✅ Create employee accounts
4. ✅ Share access URL and credentials

**Workshop ready!** Proceed to [Day 1 Overview](../day1-2/overview.md) →

---

## Quick Reference

**Start sandbox:**
```powershell
docker-compose up -d
```

**Stop sandbox:**
```powershell
docker-compose down
```

**View logs:**
```powershell
docker-compose logs -f
```

**Update model:**
```powershell
docker exec -it amadema-ollama ollama pull llama3.3:8b
```

**Access URL (local):**
```
http://localhost:3000
```

**Access URL (employees):**
```
http://YOUR_LAPTOP_IP:3000
```
