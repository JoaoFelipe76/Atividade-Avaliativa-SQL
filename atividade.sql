
-- 2 A

SELECT 
    c.nome AS nome_cliente,
    m.numero AS numero_mesa,
    SUM(v.valor_total) AS total_gasto
FROM vendas v
JOIN mesas m ON v.id_mesa = m.id
JOIN clientes c ON v.id_cliente = c.id
GROUP BY c.nome, m.numero;


-- 2 B

SELECT 
    m.numero AS numero_mesa,
    p.nome AS produto,
    iv.quantidade,
    iv.preco_unitario
FROM itens_venda iv
JOIN vendas v ON iv.id_venda = v.id
JOIN mesas m ON v.id_mesa = m.id
JOIN produtos p ON iv.id_produto = p.id
WHERE m.numero = 101;  


-- 2 C



CREATE OR REPLACE FUNCTION redefinir_status_mesa(mesa_numero INT)
RETURNS VOID AS
$$
BEGIN

    UPDATE mesas
    SET status = 'Livre'
    WHERE numero = mesa_numero;
END;
$$
LANGUAGE plpgsql;

SELECT redefinir_status_mesa(102);  

