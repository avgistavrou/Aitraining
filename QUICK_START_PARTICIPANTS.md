# Quick Start: Adding Participants

**Your Sandbox URL:** `http://192.168.1.177:3000`

---

## 🚀 Setup Checklist (Do Once)

### Step 1: Enable Firewall (2 minutes)

```powershell
# Right-click → Run as Administrator
.\enable-participant-access.ps1
```

✅ This allows participants to connect through your firewall

---

### Step 2: Create Admin Account (2 minutes)

1. Open browser: `http://localhost:3000`
2. Click **"Sign up"**
3. Enter:
   - Email: your.email@amadema.com
   - Password: (your choice)
   - Name: Avgi Stavrou
4. Click **"Create Account"**

✅ First account = Admin automatically

---

### Step 3: Add Participants (5-10 minutes)

**Method A: Pre-Create Accounts** (Recommended)

1. Login to sandbox
2. Click profile icon → **"Admin Panel"**
3. Click **"Settings"** → **"Users"**
4. For each participant:
   - Click **"+ Add User"**
   - Email: participant@amadema.com
   - Password: AmaDema2026
   - Role: **User**
   - Click **"Add User"**

**Method B: Enable Self-Registration**

1. Admin Panel → Settings → General
2. Toggle **ON**: "Enable New User Registrations"
3. Participants register themselves
4. Toggle **OFF** after everyone joins

---

### Step 4: Send Access Email (5 minutes)

Copy from `PARTICIPANT_EMAIL_TEMPLATE.txt`:

```
Subject: AmaDema AI Training - Your Sandbox Access

Hi [Name],

Your AI sandbox access is ready!

URL: http://192.168.1.177:3000
Email: [their email]
Password: AmaDema2026

Test before Day 1!

Best,
Avgi
```

---

## 📋 Participant List Template

Track participants:

| Name | Email | Account Created | Access Tested |
|------|-------|----------------|---------------|
| Alice Smith | alice@amadema.com | ✅ | ✅ |
| Bob Jones | bob@amadema.com | ✅ | ⏳ |
| Charlie Brown | charlie@amadema.com | ⏳ | ⏳ |

---

## 🧪 Test Before Training Day

1. Ask a colleague to connect
2. They should:
   - Visit `http://192.168.1.177:3000`
   - Login
   - Ask AI: "Hello"
   - Get response

✅ If this works, everyone can connect!

---

## 📅 Day of Training Checklist

**Before participants arrive:**

- [ ] Start Docker Desktop
- [ ] Verify containers running: `docker ps`
- [ ] Test your login: `http://localhost:3000`
- [ ] Write URL on whiteboard: `http://192.168.1.177:3000`
- [ ] Have participant credentials ready

**When participants arrive:**

- [ ] Share WiFi name
- [ ] Show URL on screen
- [ ] Help anyone with connection issues
- [ ] Monitor Admin Panel for activity

---

## 🔥 Common Issues & Fixes

### "Cannot connect to sandbox"

**Fix:**
- Check your laptop WiFi is on
- Verify firewall rule: Run `enable-participant-access.ps1` again
- Share correct IP: `192.168.1.177:3000`

### "Login not working"

**Fix:**
- Admin Panel → Users → Reset their password
- Check email is exactly correct (case-sensitive)

### "AI not responding"

**Fix:**
- First response takes 10-15 seconds (model loading)
- Subsequent responses: 1-3 seconds
- Check GPU: `docker exec amadema-ollama nvidia-smi`

---

## 📖 Documentation Files

| File | Purpose |
|------|---------|
| **ADD_PARTICIPANTS.md** | Detailed instructions for adding users |
| **PARTICIPANT_EMAIL_TEMPLATE.txt** | Ready-to-send email templates |
| **enable-participant-access.ps1** | Enable firewall (run as admin) |
| **ENABLE_GPU_GUIDE.md** | GPU setup guide |
| **enable-gpu.ps1** | GPU enablement script |

---

## 🎯 Quick Commands Reference

```powershell
# Start sandbox
cd "$env:USERPROFILE\OneDrive - University of Bristol\Documents\AmaDema\Aitraining"
docker-compose up -d

# Check status
docker ps

# Verify GPU
docker exec amadema-ollama nvidia-smi

# View logs
docker logs amadema-webui
docker logs amadema-ollama

# Restart sandbox
docker-compose restart

# Stop sandbox
docker-compose down

# Your IP address
ipconfig | findstr IPv4
```

---

## 💡 Pro Tips

1. **Test Early**: Add one participant and test 1-2 days before training
2. **Screenshot**: Take screenshot of successful login to include in emails
3. **Backup Credentials**: Keep participant list in secure document
4. **Monitor**: Watch Admin Panel during training for issues
5. **Export Data**: After training, export chats for review

---

## ✅ You're Ready When:

- [ ] Sandbox running with GPU
- [ ] Firewall allows port 3000
- [ ] Admin account created
- [ ] At least one test participant can connect
- [ ] Email templates customized and ready
- [ ] Training materials accessible

---

**Need Help?** Check `ADD_PARTICIPANTS.md` for detailed instructions!

**Ready to go!** 🚀
