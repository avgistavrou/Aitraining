# Adding Participants to AmaDema Sandbox

Your sandbox is ready at: **http://192.168.1.177:3000**

---

## Method 1: Pre-Create Accounts (Recommended)

**Best for:** Controlled training environment, professional setup

### Step 1: Access Admin Panel

1. Open browser: `http://localhost:3000` (or `http://192.168.1.177:3000`)
2. **First time?** Create your admin account:
   - Click **"Sign up"**
   - Email: your.email@amadema.com
   - Password: (choose strong password)
   - Name: Avgi Stavrou
   - Click **"Create Account"**
   - ✅ **First account = Admin automatically**

3. **Already have account?** Just login

### Step 2: Create Participant Accounts

1. Click your **profile icon** (top-right corner)
2. Click **"Admin Panel"**
3. Click **"Settings"** → **"Users"**
4. Click **"+ Add User"** button

**For each participant:**

```
Email: participant@amadema.com
Name: Participant Name
Password: AmaDema2026
Role: User (NOT Admin)
```

✅ **Click "Add User"**

**Repeat for all participants**

### Step 3: Share Access Information

Send participants this information:

```
📧 Email Template:

Subject: AmaDema AI Training - Sandbox Access

Hi [Name],

Your AI sandbox access is ready for the training!

URL: http://192.168.1.177:3000

Login credentials:
• Email: [their email]
• Password: AmaDema

Please test access before Day 1. You can change your password after first login.

See you at the training!

Best,
Avgi
```

---

## Method 2: Self-Registration (Alternative)

**Best for:** Quick setup, participants create own passwords

### Step 1: Enable Registration

1. Login as admin
2. Go to **Admin Panel** → **Settings** → **General**
3. Find **"Enable New User Registrations"**
4. ✅ **Toggle ON**
5. Click **"Save"**

### Step 2: Share Registration Link

Send participants:

```
📧 Email Template:

Subject: AmaDema AI Training - Sandbox Registration

Hi [Name],

Please register for the AI training sandbox:

URL: http://192.168.1.177:3000

1. Click "Sign up"
2. Use your AmaDema email
3. Choose a password
4. Complete registration

Test before Day 1!

Best,
Avgi
```

### Step 3: Disable Registration After Training

After everyone has registered:
1. Admin Panel → Settings → General
2. **Toggle OFF** "Enable New User Registrations"
3. Prevents unauthorized access

---

## Participant Email List Template

Create a spreadsheet with participant details:

| Name | Email | Password | Status |
|------|-------|----------|--------|
| Alice Smith | alice@amadema.com | AmaDema2026 | ✅ Created |
| Bob Jones | bob@amadema.com | AmaDema2026 | ✅ Created |
| Charlie Brown | charlie@amadema.com | AmaDema2026 | ⏳ Pending |

---

## Quick Account Creation Script

If you have many participants, use PowerShell:

```powershell
# List of participant emails
$participants = @(
    "alice@amadema.com",
    "bob@amadema.com", 
    "charlie@amadema.com"
)

# Note: Open WebUI doesn't have CLI user creation
# You'll need to use the web interface Admin Panel
# Or use the API (see advanced section below)

Write-Host "Create these accounts in Admin Panel:"
foreach ($email in $participants) {
    Write-Host "  - $email" -ForegroundColor Cyan
}
```

---

## Verifying Participant Access

### Before Training Day:

**Send test email 1-2 days before:**

```
Subject: Test Your AI Sandbox Access

Please test your sandbox access:

1. Visit: http://192.168.1.177:3000
2. Login with your credentials
3. Ask the AI: "What is prompt engineering?"
4. Reply to confirm it works

If you have issues, let me know ASAP!
```

### During Training:

**Check who's online:**
1. Admin Panel → **Users**
2. See "Last Active" timestamps
3. Help anyone having connection issues

---

## Troubleshooting for Participants

### "Cannot connect to sandbox"

**Solution:**
- Ensure they're on same WiFi network as you
- Share correct IP: `192.168.1.177:3000`
- Check your laptop firewall allows port 3000

**Test connectivity:**
```powershell
# Run on YOUR laptop to allow firewall
New-NetFirewallRule -DisplayName "AI Sandbox" -Direction Inbound -LocalPort 3000 -Protocol TCP -Action Allow
```

### "Login credentials not working"

**Solution:**
1. Admin Panel → Users
2. Find their account
3. Click "Reset Password"
4. Give them new password

### "AI responses are slow"

**Solution:**
- Normal on first request (model loads)
- Subsequent requests much faster
- Expected: 1-3 seconds with GPU

---

## Managing Users During Training

### Reset a User's Password

1. Admin Panel → Users
2. Find user
3. Click **"..."** → **"Reset Password"**
4. Enter new password
5. Tell them the new password

### Disable a User

1. Admin Panel → Users
2. Find user
3. Click **"..."** → **"Disable"**

### View User Activity

1. Admin Panel → **Users**
2. Click on username
3. See their chat history and activity

---

## Security Best Practices

✅ **DO:**
- Use unique passwords for each training
- Change default password after first login
- Disable registration after everyone joins
- Monitor user activity during training

❌ **DON'T:**
- Share admin credentials with participants
- Leave registration open permanently
- Use same password for external services

---

## Advanced: API User Creation

If you have MANY participants, use the API:

```powershell
# Set admin credentials
$adminEmail = "your.email@amadema.com"
$adminPassword = "your-admin-password"

# Login and get token
$loginResponse = Invoke-RestMethod -Uri "http://localhost:3000/api/v1/auths/signin" -Method Post -Body (@{
    email = $adminEmail
    password = $adminPassword
} | ConvertTo-Json) -ContentType "application/json"

$token = $loginResponse.token

# Create user
$newUser = @{
    email = "participant@amadema.com"
    password = "AmaDema2026"
    name = "Participant Name"
    role = "user"
}

Invoke-RestMethod -Uri "http://localhost:3000/api/v1/users" -Method Post `
    -Headers @{Authorization = "Bearer $token"} `
    -Body ($newUser | ConvertTo-Json) `
    -ContentType "application/json"

Write-Host "✓ User created successfully" -ForegroundColor Green
```

---

## Day of Training Checklist

**30 minutes before:**
- [ ] Start Docker Desktop
- [ ] Run: `docker-compose up -d`
- [ ] Verify GPU: `docker exec amadema-ollama nvidia-smi`
- [ ] Test login at `http://localhost:3000`
- [ ] Write your IP on whiteboard: `192.168.1.177:3000`

**During training:**
- [ ] Monitor Admin Panel for connection issues
- [ ] Help participants who can't connect
- [ ] Check GPU usage periodically

**After training:**
- [ ] Export user chats (Admin Panel → Export)
- [ ] Optional: Keep sandbox running for post-training practice
- [ ] Or stop: `docker-compose down`

---

## Summary

**Your sandbox URL:** `http://192.168.1.177:3000`

**Recommended method:** Pre-create accounts via Admin Panel

**Default participant password:** `AmaDema2026` (they can change it)

**Admin access:** You have full control via Admin Panel

**Ready for training!** 🚀

---

## Need Help?

**Check connection:**
```powershell
# On your laptop
docker ps  # Should show 2 containers running

# Check participants can ping you
# Ask them to run: ping 192.168.1.177
```

**View logs:**
```powershell
docker logs amadema-webui    # WebUI logs
docker logs amadema-ollama   # AI model logs
```

**Restart sandbox:**
```powershell
cd "$env:USERPROFILE\OneDrive - University of Bristol\Documents\AmaDema\Aitraining"
docker-compose restart
```
