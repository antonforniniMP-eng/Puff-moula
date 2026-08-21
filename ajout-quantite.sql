-- ============================================================
-- AJOUT : réserver plusieurs unités en une fois
-- Colle ce code EN PLUS de ce qui existe déjà
-- ============================================================

-- Garde une trace de la quantité réservée (utile pour l'historique)
alter table reservations add column if not exists quantite int not null default 1;

-- Remplace la fonction pour qu'elle accepte une quantité
drop function if exists reserver_produit(uuid, text);

create or replace function reserver_produit(p_produit_id uuid, p_nom_client text, p_quantite int default 1)
returns table(succes boolean, nouveau_stock int)
language plpgsql
security definer
as $$
declare
  v_stock int;
begin
  if p_quantite < 1 then
    return query select false, 0;
    return;
  end if;

  update produits
  set stock = stock - p_quantite
  where id = p_produit_id and stock >= p_quantite
  returning stock into v_stock;

  if v_stock is null then
    return query select false, 0;
    return;
  end if;

  insert into reservations (produit_id, nom_client, quantite)
  values (p_produit_id, p_nom_client, p_quantite);

  return query select true, v_stock;
end;
$$;

grant execute on function reserver_produit(uuid, text, int) to anon;
