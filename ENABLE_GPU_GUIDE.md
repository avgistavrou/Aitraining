# Enable GPU Acceleration for AmaDema Sandbox

Your sandbox is now configured for GPU support! This will make inference **5-10x faster**.

**Your GPU:** NVIDIA GeForce RTX 2050 (4GB VRAM) ✅  
**Drivers:** CUDA 12.8 installed ✅  
**Expected speed:** 3-8 seconds → **0.5-2 seconds** ⚡

---

## Step-by-Step Setup

### Step 1: Start Docker Desktop

1. Open **Docker Desktop** from Start Menu
2. Wait for "Docker Desktop is running" status (2-3 minutes)
3. You should see the whale icon in system tray

---

### Step 2: Enable GPU Support in Docker

1. Click **Settings** (gear icon) in Docker Desktop
2. Go to **General**
3. Ensure these are enabled:
   - ✅ **Use WSL 2 based engine**
   - ✅ **Use the WSL 2 based engine** (should be checked)
4. Go to **Resources** → **WSL Integration**
5. Enable integration with your WSL distribution
6. Click **Apply & Restart**

---

### Step 3: Restart Sandbox with GPU

Open PowerShell and run:

```powershell
# Navigate to your sandbox folder
cd "$env:USERPROFILE\OneDrive - University of Bristol\Documents\AmaDema\Aitraining"

# Stop current containers (if running)
docker-compose down

# Start with GPU support
docker-compose up -d

# Wait 1-2 minutes for services to start
```

---

### Step 4: Verify GPU is Working

```powershell
# Check if Ollama can see the GPU
docker exec amadema-ollama nvidia-smi
```

**Expected output:**
```
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 573.44                 Driver Version: 573.44         CUDA Version: 12.8     |
| GPU  Name                                                  Memory-Usage | GPU-Util      |
|   0  NVIDIA GeForce RTX 2050                                   XXXMiB / 4096MiB | XX%   |
+-----------------------------------------------------------------------------------------+
```

If you see this, **GPU is working!** ✅

---

### Step 5: Re-download Model for GPU Optimization

```powershell
# Download GPU-optimized version
docker exec amadema-ollama ollama pull llama3.2:3b

# Or try a faster quantized version
docker exec amadema-ollama ollama pull llama3.2:3b-instruct-q4_K_M
```

---

### Step 6: Test the Speed

1. Open browser: `http://localhost:3000`
2. Login with your credentials
3. Ask a test question: "Explain electrospinning in 3 sentences"
4. **Before GPU:** 3-8 seconds
5. **With GPU:** 0.5-2 seconds ⚡

---

## Troubleshooting

### Problem: "GPU not found" or still using CPU

**Solution 1: Check Docker GPU Support**
```powershell
docker run --rm --gpus all nvidia/cuda:12.0-base nvidia-smi
```

If this fails, GPU isn't accessible to Docker.

**Solution 2: Update Docker Desktop**
- Download latest version: https://www.docker.com/products/docker-desktop/
- Install and restart

**Solution 3: Reinstall NVIDIA Container Toolkit**

In PowerShell (Admin):
```powershell
# Check if WSL has NVIDIA support
wsl --list --verbose

# Update WSL kernel
wsl --update

# Restart WSL
wsl --shutdown
```

Then restart Docker Desktop.

---

### Problem: "Out of memory" errors

Your RTX 2050 has 4GB VRAM. If models are too large:

**Option 1: Use smaller quantized model**
```powershell
docker exec amadema-ollama ollama pull llama3.2:3b-instruct-q4_K_M
```

**Option 2: Use CPU fallback for large prompts**
(Ollama automatically switches if VRAM is full)

---

### Problem: Docker Desktop won't start

1. Check Windows version: Windows 10 21H2 or newer required
2. Enable Virtualization in BIOS (usually enabled on modern laptops)
3. Restart computer
4. Run Docker Desktop as Administrator

---

## Performance Expectations

| Model | CPU (Current) | GPU (RTX 2050) | Speed Gain |
|-------|--------------|----------------|------------|
| llama3.2:3b | 3-8 seconds | 0.5-2 seconds | **4-6x faster** ⚡ |
| llama3.2:3b (quantized) | 2-5 seconds | 0.3-1 seconds | **6-8x faster** ⚡ |
| Phi3:mini | 1-3 seconds | 0.2-0.8 seconds | **5-10x faster** ⚡ |

---

## Advanced: Monitor GPU Usage

**Real-time monitoring:**
```powershell
# In a separate PowerShell window
docker exec amadema-ollama watch -n 1 nvidia-smi
```

**Check during inference:**
- GPU Utilization: Should show 80-100% when generating
- Memory Usage: Should increase during generation
- Temperature: Should be 50-70°C (normal)

---

## Optional: Try Larger Models

With GPU, you can now run larger models:

```powershell
# 7B model (better quality, still fast on GPU)
docker exec amadema-ollama ollama pull mistral:7b-instruct

# Test it
docker exec amadema-ollama ollama run mistral:7b-instruct "explain polymer synthesis"
```

**Note:** 7B models need ~4-6GB VRAM. Your RTX 2050 (4GB) will use quantized versions automatically.

---

## Summary

✅ **GPU enabled in docker-compose.yml**  
✅ **RTX 2050 detected and ready**  
✅ **Expected: 5-10x speed improvement**

**Next steps:**
1. Start Docker Desktop
2. Run: `docker-compose up -d`
3. Verify GPU: `docker exec amadema-ollama nvidia-smi`
4. Test at `http://localhost:3000`

---

## Need Help?

**Check status:**
```powershell
# Is Docker running?
docker ps

# Is GPU accessible?
docker exec amadema-ollama nvidia-smi

# Check Ollama logs
docker logs amadema-ollama
```

**Common issues:**
- Docker Desktop not starting → Restart computer
- GPU not detected → Update WSL: `wsl --update`
- Still slow → Check if GPU model is downloaded: `docker exec amadema-ollama ollama list`

---

**Questions?** Check logs or contact IT support.

**Ready to train faster!** 🚀
