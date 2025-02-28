use [municipale_db];
GO

select * from dbo.anagrafica a
left join dbo.verbale b on a.id_anagrafica = b.id_anagrafica
left join dbo.tipo_violazione c on b.id_violazione = c.id_violazione;


-- 1
select count(*) from dbo.verbale where data_trascrizione_verbale is not null;
-- 2
select a.id_anagrafica, a.cognome, a.nome, count(*)
from dbo.anagrafica a
left join dbo.verbale b on a.id_anagrafica = b.id_anagrafica
left join dbo.tipo_violazione c on b.id_violazione = c.id_violazione
where data_trascrizione_verbale is not null
group by a.id_anagrafica, a.cognome, a.nome;


-- 3
select b.id_violazione, c.descrizione_violazione, count(*) from dbo.verbale b
left join dbo.tipo_violazione c on b.id_violazione = c.id_violazione
where data_trascrizione_verbale is not null
group by b.id_violazione, c.descrizione_violazione
order by b.id_violazione;

--4
select a.id_anagrafica, a.cognome, a.nome, sum(b.decurtamento_punti) AS totale_punti_decurtati
from dbo.anagrafica a
left join dbo.verbale b on a.id_anagrafica = b.id_anagrafica
left join dbo.tipo_violazione c on b.id_violazione = c.id_violazione
where b.data_trascrizione_verbale is not null
group by a.id_anagrafica, a.cognome, a.nome
order by a.id_anagrafica;

--5
select b.id_violazione, a.cognome, a.nome, b.data_violazione, b.indirizzo_violazione, sum(b.importo) somma_importo_verbali, sum(b.decurtamento_punti) somma_punti_decurtati
FROM dbo.anagrafica a
join dbo.verbale b on a.id_anagrafica = b.id_anagrafica
where a.citta = 'Palermo'
group by  b.id_violazione, a.cognome, a.nome, b.data_violazione, b.indirizzo_violazione
order by b.id_violazione;

--6
select a.cognome, a.nome, b.data_violazione, b.indirizzo_violazione, sum(b.importo) somma_importo_verbali, sum(b.decurtamento_punti) somma_punti_decurtati
FROM dbo.anagrafica a
join dbo.verbale b on a.id_anagrafica = b.id_anagrafica
where format(b.data_violazione, 'yyyy-MM-dd') between cast('2009-02-01' as date) and cast('2009-07-31' as date)
group by a.cognome, a.nome, b.data_violazione, b.indirizzo_violazione;
--order by b.id_violazione;

--7
select a.id_anagrafica, a.cognome, a.nome, sum(b.importo) as totale_importo from dbo.anagrafica a
join dbo.verbale b on a.id_anagrafica = b.id_anagrafica 
group by a.id_anagrafica, a.cognome, a.nome
order by totale_importo;

--8
select * from dbo.anagrafica 
where citta = 'Palermo';

--9
select b.data_violazione, b.importo, b.decurtamento_punti from dbo.verbale b
join dbo.tipo_violazione c on b.id_violazione = c.id_violazione
where format(b.data_violazione, 'yyyy-MM-dd') = cast('2009-02-28' as date)
group by b.data_violazione, b.importo, b.decurtamento_punti;


--10
select b.nominativo_agente, count(*) as numero_violazioni from dbo.verbale b
join dbo.anagrafica a on b.id_anagrafica = a.id_anagrafica
group by b.nominativo_agente
order by numero_violazioni desc;

--11
select a.cognome, a.nome, a.indirizzo, b.data_violazione, b.importo, b.decurtamento_punti from dbo.anagrafica a
join dbo.verbale b on a.id_anagrafica = b.id_anagrafica
join dbo.tipo_violazione c on b.id_violazione = c.id_violazione
where b.decurtamento_punti > 5;

--12
select a.cognome, a.nome, a.indirizzo, b.data_violazione, b.importo, b.decurtamento_punti from dbo.anagrafica a
join dbo.verbale b on a.id_anagrafica = b.id_anagrafica
join dbo.tipo_violazione c on b.id_violazione = c.id_violazione
where b.importo >= 400;

--EXTRA A
select b.nominativo_agente, count(*) as numero_verbali, sum(b.importo) as totale_importo from dbo.verbale b
join dbo.anagrafica a on b.id_anagrafica = a.id_anagrafica
group by b.nominativo_agente;

--EXTRA B
select c.descrizione_violazione, avg(b.importo) as media_importo from dbo.verbale b
join dbo.tipo_violazione c on b.id_violazione = c.id_violazione
group by c.descrizione_violazione;