CREATE SCHEMA IF NOT EXISTS dbex;

-- Inserindo em diet

INSERT INTO diet (objective, date, is_active, nutritionist_id, contract_id)
VALUES 
  ('Emagrecimento', '2025-08-01', TRUE, 1, 1),
  ('Ganho de massa', '2025-08-02', TRUE, 2, 2);

-- Inserindo em meals

INSERT INTO meals (name, schedule)
VALUES 
  ('Café da manhã', 1),
  ('Lanche da manhã', 2),
  ('Almoço', 3),
  ('Lanche da tarde', 4),
  ('Jantar', 5),
  ('Ceia', 6);

-- Inserindo em mealitem

INSERT INTO mealitem (name, weight, portion)
VALUES 
  ('Ovo cozido', 50, 50),
  ('Arroz integral', 100, 100),
  ('Frango grelhado', 120, 120),
  ('Salada de folhas', 80, 80),
  ('Batata doce', 150, 150),
  ('Iogurte natural', 200, 200);

-- Atualizando um campo dos registros que satisfazem uma condição simples
UPDATE diet
SET objective = 'Definição muscular'
WHERE id = 2;

-- Atualizar um campo dos registros que satisfazem uma condição composta
UPDATE mealitem
SET weight = 60
WHERE name = 'Ovo cozido' AND portion = 50;

-- Atualizar dois campos dos registros que satisfazem uma condição
UPDATE meals
SET name = 'Brunch', schedule = 7
WHERE name = 'Lanche da manhã';

-- DELETE com condição simples (remove todos os itens chamados 'Ovo cozido')

DELETE FROM mealitem
WHERE name = 'Ovo cozido';

-- DELETE com condição composta (remove refeições com nome 'Brunch' e schedule 7)

DELETE FROM meals
WHERE name = 'Brunch' AND schedule = 7;

-- DELETE envolvendo coluna de outra tabela (remove dietas do nutricionista com id 1)

DELETE FROM diet
WHERE nutritionist_id IN (
  SELECT id FROM consultant WHERE id = 1
);