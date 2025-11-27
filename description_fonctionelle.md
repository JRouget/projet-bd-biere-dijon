**1. Entités principales**

a. Quartier

Représente les différents quartiers de la ville de Dijon où peuvent se situer les bars.
C’est une entité de référence.

Rôle : structurer géographiquement les bars.

b. Bar

Représente un établissement réel situé à Dijon.

Chaque bar est caractérisé par : son nom, son adresse et le quartier dans lequel il se trouve.

Rôle : référencer les lieux où les bières sont vendues.

c. Bière

Représente une bière réellement servie dans les bars dijonnais.
Chaque bière possède un nom, un type (IPA, Blonde…), et un degré d’alcool.

Rôle : référencer les produits vendus dans les bars.

d. Prix

Table associative permettant de définir le prix d’une bière dans un bar donné.

Un même bar peut proposer plusieurs bières.
Une même bière peut être vendue dans plusieurs bars.
Les prix peuvent varier d’un bar à l’autre.

Rôle : associer bar ↔ bière ↔ prix.

**2. Relations**

a. Quartier 1—N Bar

Un quartier peut contenir plusieurs bars.
Un bar appartient obligatoirement à un seul quartier.

Justification : logique géographique.

b. Bar N—N Bière (via Prix)

La relation entre Bar et Bière est multiple dans les deux sens :

un bar peut vendre plusieurs bières,

une bière peut être vendue dans plusieurs bars.

➡️ Cette relation N—N est représentée par la table Prix.

c. Prix : Bar 1—N Prix et Bière 1—N Prix

La table Prix contient :

un identifiant de bar (FK),

un identifiant de bière (FK),

le prix associé.

Il n’est pas possible d’avoir un prix sans bar ni bière.

**3. Règles métier**

1. Un bar appartient obligatoirement à un quartier.

Pas de bar “hors Dijon”.

2. Une bière possède un type et un degré obligatoires.

Une entrée incomplète est invalide.

3. Le prix est dépendant du bar ET de la bière.

Pour savoir combien coûte une bière, il faut savoir où elle est vendue.

4. Un bar ne doit pas avoir deux prix pour la même bière.

Contrainte logique définie par la clé composite (id_bar, id_biere).

5. Les prix doivent être positifs.

Aucune bière ne peut avoir un prix ≤ 0.

6. Le nombre de bières vendues n’est pas limité pour un bar.

Un bar peut avoir une carte réduite ou très fournie.

7. Une bière peut exister même si aucun bar ne la vend encore.

Permet d’enregistrer des bières avant leur mise en vente.

**4. Attributs importants**

Quartier
id_quartier (Primary Key)
nom (unique)

Bar

id_bar (Primary Key)
nom (unique)
adresse
id_quartier (Foreign Key)

Bière
id_biere (Primary Key)
nom (unique)
type
deg (CHECK > 0)

Prix
id_bar (Foreign Key)
id_biere (Foreign Key)
prix (CHECK > 0)
clé primaire composite (id_bar, id_biere)