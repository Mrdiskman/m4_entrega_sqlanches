-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes(nome, lealdade)
  VALUES('Georgia', 0)
-- 2)
INSERT INTO pedidos(status, cliente_id)
  VALUES('Recebido', (SELECT id FROM clientes WHERE nome = 'Georgia'));
-- 3)
  INSERT INTO produtos_pedidos(pedido_id, produto_id)
VALUES(6,1),(6,2),(6,6),(6,8),(6,8);
-- Leitura

-- 1)
SELECT 
 cl.id, cl.nome, cl.lealdade,
 pe.status, pe.cliente_id, pe.id,
 pr.id, pr.nome, pr.tipo, pr.preço, pr.pts_de_lealdade
 
  FROM clientes cl
  JOIN pedidos pe ON pe.cliente_id = cl.id
  JOIN produtos_pedidos pr_pe ON pr_pe.pedido_id = pe.id
  JOIN produtos pr ON pr.id = pr_pe.produto_id
  
  WHERE cl.nome = 'Georgia'


-- Atualização

-- 1)
UPDATE clientes cl SET lealdade = 48 WHERE cl.nome = 'Georgia';
-- Deleção

-- 1)
DELETE FROM clientes cl WHERE cl.nome = 'Marcelo'
  RETURNING *;