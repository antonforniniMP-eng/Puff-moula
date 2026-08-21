const SUPABASE_URL = "https://tgxqtuowuxcrmbfbdoih.supabase.co";
const SUPABASE_ANON_KEY = "sb_publishable_gD5PkCtUOXnWdp6WKgYPWQ_rtlvJc3x";
const supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// Doit être IDENTIQUE au mot de passe mis dans schema.sql (change-moi-123)
const ADMIN_PASSWORD = "Mdp4nt0n1603";
