// Simple password protection for AmaDema training site
(function() {
  const CORRECT_PASSWORD = 'AmaDema2026'; 
  const AUTH_KEY = 'amadema_auth';
  
  function checkAuth() {
    const isAuthenticated = sessionStorage.getItem(AUTH_KEY);
    
    if (isAuthenticated === 'true') {
      return true;
    }
    
    // Show password prompt
    const password = prompt('This training site is password-protected.\n\nEnter password to access:');
    
    if (password === CORRECT_PASSWORD) {
      sessionStorage.setItem(AUTH_KEY, 'true');
      return true;
    } else if (password !== null) {
      alert('Incorrect password. Please contact Avgi Stavrou for access.');
      window.location.href = 'about:blank';
      return false;
    } else {
      // User cancelled
      window.location.href = 'about:blank';
      return false;
    }
  }
  
  // Run auth check on page load
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', checkAuth);
  } else {
    checkAuth();
  }
})();
