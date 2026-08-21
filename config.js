const SUPABASE_URL = "https://TON-PROJET.supabase.co";
const SUPABASE_ANON_KEY = "TA-CLE-ANON-PUBLIQUE";
const supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// Doit être IDENTIQUE au mot de passe mis dans schema.sql (change-moi-123)
const ADMIN_PASSWORD = "change-moi-123";
