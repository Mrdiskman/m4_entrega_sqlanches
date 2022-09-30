-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT 
  pe.id, pe.status, pe.cliente_id,
  pr.id, pr.nome, pr.tipo, pr.preço, pr.pts_de_lealdade
FROM pedidos pe
  JOIN produtos_pedidos pr_pe ON pe.id = pr_pe.pedido_id
  JOIN produtos pr ON pr.id = pr_pe.produto_id
-- 2)
SELECT 
  pe.id
FROM pedidos pe
  JOIN produtos_pedidos pr_pe ON pe.id = pr_pe.pedido_id
  JOIN produtos pr ON pr.id = pr_pe.produto_id
  WHERE pr.nome = 'Fritas';
-- 3)
SELECT 
  cl.nome gostam_de_fritas
FROM pedidos pe
  JOIN produtos_pedidos pr_pe ON pe.id = pr_pe.pedido_id
  JOIN produtos pr ON pr.id = pr_pe.produto_id
  JOIN clientes cl ON cl.id = pe.cliente_id
  WHERE pr.nome = 'Fritas';
-- 4)
SELECT
 SUM(pr.preço) AS sum
FROM produtos pr
  JOIN produtos_pedidos pr_pe ON pr.id = pr_pe.produto_id
  JOIN pedidos pe ON pe.id = pr_pe.pedido_id
  JOIN clientes cl ON cl.id = pe.cliente_id
WHERE cl.nome = 'Laura';
-- 5)
SELECT 
	pr.nome nome, COUNT(pe)
  FROM produtos pr
  JOIN produtos_pedidos pr_pe ON pr_pe.produto_id = pr.id
  JOIN pedidos pe ON pr_pe.pedido_id = pe.id
  
  GROUP BY pr.nome ORDER BY pr.nome ASC;