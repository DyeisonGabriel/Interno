SELECT
  ITEM_TICKET.ID_TICKET                AS TICKET,
  TICKET.ID_CLIENTE                    AS CODCLIENTE,
  CLIENTE.NOME_FANTASIA                AS CLIENTE,
  TICKET.ID_USUARIO_CLIENTE            AS CODUSUARIO,
  USUARIO_CLIENTE.NOME_USUARIO_CLIENTE AS USUARIO,
  TICKET.DATA_REGISTRO                 AS DATA_REGISTRO,
  TICKET.DATA_PREVISTA                 AS DATA_PREVISTA,
  TICKET.DIAS_PREVISTO                 AS DIAS_PREVISTO,
  TICKET.DATA_ENTREGA                  AS DATA_ENTREGA,
  TICKET.DIAS_ENTREGA                  AS DIAS_ENTREGA,
  TICKET.ID_STATUS_TICKET              AS CODSTATUS,
  STATUS_TICKET.STATUS_TICKET          AS STATUS,
  TICKET.ID_MODULO                     AS CODMODULO,
  MODULO.MODULO                        AS MODULO, 
  TICKET.ID_VERSAO                     AS CODVERSAO,
  VERSAO.VERSAO                        AS VERSAO,
  TICKET.ID_USUARIO_EMPRESA_RESP       AS CODRESPONSAVEL,
  RESPONSAVEL.NOME_USUARIO_EMPRESA     AS RESPONSAVEL,
  ITEM_TICKET.ID_ITEM_TICKET           AS ITEM_TICKET,
  TECNICO.ID_USUARIO_EMPRESA           AS CODTECNICO,
  TECNICO.NOME_USUARIO_EMPRESA         AS TECNICO,
  ITEM_TICKET.ID_SERVICO               AS CODSERVICO,
  SERVICO.SERVICO                      AS SERVICO,
  ITEM_TICKET.DESCRICAO                AS DESCRICAO,
  ITEM_TICKET.DATA                     AS DATA,
  ITEM_TICKET.HORA_INICIO              AS HORA_INICIO,
  ITEM_TICKET.HORA_FINAL               AS HORA_FINAL,
  ITEM_TICKET.TEMPO_APONTADO           AS TEMPO,
  ITEM_TICKET.CUSTO_HORA               AS CUSTO_HORA,
  ITEM_TICKET.CUSTO_SERVICO            AS CUSTO_TICKET
FROM
  ITEM_TICKET
LEFT JOIN EMPRESA ON
  EMPRESA.ID_EMPRESA = ITEM_TICKET.ID_EMPRESA
LEFT JOIN SERVICO ON
  SERVICO.ID_SERVICO = ITEM_TICKET.ID_SERVICO
LEFT JOIN USUARIO_EMPRESA AS TECNICO ON
  TECNICO.ID_USUARIO_EMPRESA = ITEM_TICKET.ID_USUARIO_EMPRESA
LEFT JOIN TICKET ON
  TICKET.ID_TICKET   = ITEM_TICKET.ID_TICKET
LEFT JOIN CLIENTE ON
  CLIENTE.ID_CLIENTE = TICKET.ID_CLIENTE
LEFT JOIN USUARIO_CLIENTE ON
  USUARIO_CLIENTE.ID_USUARIO_CLIENTE = TICKET.ID_USUARIO_CLIENTE
LEFT JOIN STATUS_TICKET ON
  STATUS_TICKET.ID_STATUS_TICKET     = TICKET.ID_STATUS_TICKET
LEFT JOIN MODULO ON
  MODULO.ID_MODULO                   = TICKET.ID_MODULO
LEFT JOIN VERSAO ON
  VERSAO.ID_VERSAO                   = TICKET.ID_VERSAO
LEFT JOIN USUARIO_EMPRESA AS RESPONSAVEL ON
  RESPONSAVEL.ID_USUARIO_EMPRESA     = TICKET.ID_USUARIO_EMPRESA_RESP
ORDER BY
  ITEM_TICKET.DATA,
  ITEM_TICKET.ID_TICKET,
  ITEM_TICKET.ID_ITEM_TICKET