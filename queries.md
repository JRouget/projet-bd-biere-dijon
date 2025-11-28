**Prix moyen de la bière par quartier**

SELECT 
    q.nom AS quartier,
    ROUND(AVG(p.prix), 2) AS prix_moyen
FROM quartier q
JOIN bar b ON b.id_quartier = q.id_quartier
JOIN prix p ON p.id_bar = b.id_bar
GROUP BY q.nom
ORDER BY prix_moyen ASC;


**Bars vendant l’IPA la moins chère**

SELECT 
    b.nom AS bar,
    p.prix AS prix_ipa
FROM prix p
JOIN bar b ON b.id_bar = p.id_bar
JOIN biere bi ON bi.id_biere = p.id_biere
WHERE bi.type = 'IPA'
  AND p.prix = (
        SELECT MIN(p2.prix)
        FROM prix p2
        JOIN biere bi2 ON bi2.id_biere = p2.id_biere
        WHERE bi2.type = 'IPA'
  );

**Bières vendues dans ≥ 5 bars**

SELECT 
    bi.nom AS biere,
    COUNT(p.id_bar) AS nb_bars
FROM biere bi
JOIN prix p ON p.id_biere = bi.id_biere
GROUP BY bi.nom
HAVING COUNT(p.id_bar) >= 5
ORDER BY nb_bars DESC;

**Bars sans bière à moins de 6 €**

SELECT 
    b.nom AS bar
FROM bar b
WHERE NOT EXISTS (
    SELECT 1
    FROM prix p
    WHERE p.id_bar = b.id_bar
      AND p.prix < 6
)
ORDER BY b.nom;

**Top bar avec le panier moyen maximum**
```SQL
SELECT 
    b.nom AS bar,
    ROUND(AVG(p.prix), 2) AS panier_moyen
FROM bar b
JOIN prix p ON p.id_bar = b.id_bar
GROUP BY b.id_bar, b.nom
ORDER BY panier_moyen DESC
LIMIT 1;
```
