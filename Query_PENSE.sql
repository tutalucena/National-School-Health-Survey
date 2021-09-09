--------------------------------------------------------------------------------------------------------------------------------------------
--	Query para tratativa e an�lise dos dados da pesquisa PENSE 2012, 2015A1, 2015A2
--------------------------------------------------------------------------------------------------------------------------------------------
-- QUESTOES SELECIONADAS
-- Para realizar o teste selecionei quest�es que me permitam fazer uma an�lise sob a perspectiva da quest�o do bullying e como alguns 
-- fatores escolares e familiares podem, ou n�o influenciar, de forma que seja poss�vel estabelecer um plano de a��o  em prol dos 
-- dados observados.

--		VARI�VEL	QUESTION�RIO DO ALUNO

--1.	REGEOGR		Regi�o geogr�fica
--2.	VB01001		Qual � o seu sexo?
--3.	VB01002		Qual � a sua cor ou ra�a?
--4.	VB07001		NOS �LTIMOS 30 DIAS, em quantos dias voc� faltou �s aulas ou � escola sem permiss�o dos seus pais ou respons�veis?
--5.	VB07002		NOS �LTIMOS 30 DIAS, com que frequ�ncia seus pais ou respons�veis sabiam realmente o que voc� estava fazendo em seu tempo livre?
--6.	VB07003		NOS �LTIMOS 30 DIAS, com que frequ�ncia seus pais ou respons�veis verificaram se os seus deveres de casa (li��o de casa) foram feitos?
--7.	VB07004		NOS �LTIMOS 30 DIAS, com que frequ�ncia seus pais ou respons�veis entenderam seus problemas e preocupa��es?
--8.	VB07006		NOS �LTIMOS 30 DIAS, com que frequ�ncia os colegas de sua escola trataram voc� bem e/ou foram prestativos contigo?
--9.	VB07007		NOS �LTIMOS 30 DIAS, com que frequ�ncia algum dos seus colegas de escola te esculacharam, zoaram, mangaram, intimidaram ou ca�oaram tanto que voc� ficou magoado, incomodado, aborrecido, ofendido ou humilhado?
--10.	VB07008		NOS �LTIMOS 30 DIAS, qual o motivo/causa de seus colegas terem te esculachado, zombado, zoado, ca�oado, mangado, intimidado ou humilhado?
--11.	VB07009		NOS �LTIMOS 30 DIAS, voc� esculachou, zombou, mangou, intimidou ou ca�oou algum de seus colegas da escola tanto que ele ficou magoado, aborrecido, ofendido ou humilhado?
--12.	VB12001		NOS �LTIMOS 12 MESES com que frequ�ncia tem se sentido sozinho(a)? 
--13.	VB12003		Quantos amigos(as) pr�ximos voc� tem?
--14.	VB12002		NOS �LTIMOS 12 MESES, com que frequ�ncia voc� n�o conseguiu dormir � noite porque algo o(a) preocupava muito?
--15.	VB09010		NOS �LTIMOS 12 MESES, quantas vezes voc� foi agredido(a) fisicamente?

-- CONSIDERA��ES FEITAS
-- 1: Optei por quest�es que estejam presentes em ambas as bases (2012 e 2015), para que seja poss�vel uma an�lise temporal padronizada.
-- 2: Os nomes das vari�veis podem n�o estar id�nticos, por isso ser� feita uma padroniza��o dos nomes mais adiante. Para fins
--	de exemplo, deixei as variaveis conforme est�o denominadas na tabela dicion�rio alunos referente a 2015.
-- 3: Para a analise foi utilizado as bases de dados relativas aos ESTUDANTES/ALUNOS somente conforme descrito no PDF.
-- 4: Para o estudo do ano de 2015 haviam duas amostras, foram considerados as duas para o estudo, onde cada uma possui sua pr�pria tabela.

--------------------------------------------------------------------------------------------------------------------------------------------
--	PROCESSAMENTO E TRATATIVA DOS DADOS
--------------------------------------------------------------------------------------------------------------------------------------------
-- Selecionando as tableas no SQL
SELECT * FROM alunos_2012	--109.104	rows
SELECT * FROM alunosI_2015	--102.072	rows
SELECT * FROM alunosII_2015	--16.556	rows

-- Padronizando o nome das colunas que vamos usar, de todas as tabelas para tornar a analise mais legivel
-- alunos_2012					'Variavel RENOMEADA'
sp_rename 'alunos_2012.REGIAO', 'Regiao', 'COLUMN'
sp_rename 'alunos_2012.B01001', 'Sexo', 'COLUMN'
sp_rename 'alunos_2012.B01002', 'Raca', 'COLUMN'
sp_rename 'alunos_2012.B07001', 'Qnt_Flt_aula', 'COLUMN'
sp_rename 'alunos_2012.B07002', 'Frq_pais_t_lvr', 'COLUMN'
sp_rename 'alunos_2012.B07003', 'Frq_pais_dvr_csa', 'COLUMN'
sp_rename 'alunos_2012.B07004', 'Frq_pais_pbl_pcp', 'COLUMN'
sp_rename 'alunos_2012.B07006', 'Frq_clg_bem', 'COLUMN'
sp_rename 'alunos_2012.B07007', 'Frq_clg_mal', 'COLUMN'
sp_rename 'alunos_2012.B07008', 'Mtv_clg_mal', 'COLUMN'
sp_rename 'alunos_2012.B07009', 'Prt_clg_mal', 'COLUMN'
sp_rename 'alunos_2012.B09010', 'Sfr_agrs_fis', 'COLUMN'
sp_rename 'alunos_2012.B12001', 'Frq_soz', 'COLUMN'
sp_rename 'alunos_2012.B12002', 'Frq_drm_prp', 'COLUMN'
sp_rename 'alunos_2012.B12003', 'Qnt_amgs', 'COLUMN'

-- alunosI_2015
sp_rename 'alunosI_2015.REGEOGR', 'Regiao', 'COLUMN'
sp_rename 'alunosI_2015.VB01001', 'Sexo', 'COLUMN'
sp_rename 'alunosI_2015.VB01002', 'Raca', 'COLUMN'
sp_rename 'alunosI_2015.VB07001', 'Qnt_Flt_aula', 'COLUMN'
sp_rename 'alunosI_2015.VB07002', 'Frq_pais_t_lvr', 'COLUMN'
sp_rename 'alunosI_2015.VB07003', 'Frq_pais_dvr_csa', 'COLUMN'
sp_rename 'alunosI_2015.VB07004', 'Frq_pais_pbl_pcp', 'COLUMN'
sp_rename 'alunosI_2015.VB07006', 'Frq_clg_bem', 'COLUMN'
sp_rename 'alunosI_2015.VB07007', 'Frq_clg_mal', 'COLUMN'
sp_rename 'alunosI_2015.VB07008', 'Mtv_clg_mal', 'COLUMN'
sp_rename 'alunosI_2015.VB07009', 'Prt_clg_mal', 'COLUMN'
sp_rename 'alunosI_2015.VB09010', 'Sfr_agrs_fis', 'COLUMN'
sp_rename 'alunosI_2015.VB12001', 'Frq_soz', 'COLUMN'
sp_rename 'alunosI_2015.VB12002', 'Frq_drm_prp', 'COLUMN'
sp_rename 'alunosI_2015.VB12003', 'Qnt_amgs', 'COLUMN'

-- alunosII_2015
sp_rename 'alunosII_2015.REGEOGR', 'Regiao', 'COLUMN'
sp_rename 'alunosII_2015.VB01001', 'Sexo', 'COLUMN'
sp_rename 'alunosII_2015.VB01002', 'Raca', 'COLUMN'
sp_rename 'alunosII_2015.VB07001', 'Qnt_Flt_aula', 'COLUMN'
sp_rename 'alunosII_2015.VB07002', 'Frq_pais_t_lvr', 'COLUMN'
sp_rename 'alunosII_2015.VB07003', 'Frq_pais_dvr_csa', 'COLUMN'
sp_rename 'alunosII_2015.VB07004', 'Frq_pais_pbl_pcp', 'COLUMN'
sp_rename 'alunosII_2015.VB07006', 'Frq_clg_bem', 'COLUMN'
sp_rename 'alunosII_2015.VB07007', 'Frq_clg_mal', 'COLUMN'
sp_rename 'alunosII_2015.VB07008', 'Mtv_clg_mal', 'COLUMN'
sp_rename 'alunosII_2015.VB07009', 'Prt_clg_mal', 'COLUMN'
sp_rename 'alunosII_2015.VB09010', 'Sfr_agrs_fis', 'COLUMN'
sp_rename 'alunosII_2015.VB12001', 'Frq_soz', 'COLUMN'
sp_rename 'alunosII_2015.VB12002', 'Frq_drm_prp', 'COLUMN'
sp_rename 'alunosII_2015.VB12003', 'Qnt_amgs', 'COLUMN'

-- As respostas n�o est�o em um formato pass�vel de an�lise.
-- Com a refer�ncia do dicion�rio de cada base de dados vamos realizar um UPDATE nas tabelas para que possamos...
-- realizar nossa an�lise e posteriormente, utiliz�-la no power bi. Apenas para a analise, seria possivel utilizar o CASE, ou at� mesmo...
-- o IIF, por�m como � necess�rio a vizualiza��o correta das observa��es, ser� feito o processo de UPDATE nas tabelas.

-- UPDATE na tabela alunos_2012 para respostas observ�veis (aprx: 6min)
--1		Regiao
UPDATE alunos_2012
SET Regiao = IIF(Regiao = '1', 'Norte', Regiao)
UPDATE alunos_2012
SET Regiao = IIF(Regiao = '2', 'Nordeste', Regiao)
UPDATE alunos_2012
SET Regiao = IIF(Regiao = '3', 'Sudeste', Regiao)
UPDATE alunos_2012
SET Regiao = IIF(Regiao = '4', 'Sul', Regiao)
UPDATE alunos_2012
SET Regiao = IIF(Regiao = '5', 'Centro-Oeste', Regiao)

--2		Sexo
UPDATE alunos_2012
SET Sexo = IIF(Sexo = '1', 'Masculino', Sexo)
UPDATE alunos_2012
SET Sexo = IIF(Sexo = '2', 'Feminino', Sexo)

--3		Raca
UPDATE alunos_2012
SET Raca = IIF(Raca = '1', 'Branca', Raca)
UPDATE alunos_2012
SET Raca = IIF(Raca = '2', 'Preta', Raca)
UPDATE alunos_2012
SET Raca = IIF(Raca = '3', 'Amarela', Raca)
UPDATE alunos_2012
SET Raca = IIF(Raca = '4', 'Parda', Raca)
UPDATE alunos_2012
SET Raca = IIF(Raca = '5', 'ND', Raca)
UPDATE alunos_2012
SET Raca = IIF(Raca = '9', 'ND', Raca)
UPDATE alunos_2012
SET Raca = IIF(Raca = '99', 'ND', Raca)

--4		Qnt_Flt_aula
UPDATE alunos_2012
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '1', 'Nenhum dia (0 dia)', Qnt_Flt_aula)
UPDATE alunos_2012
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '2', '1 ou 2 dias', Qnt_Flt_aula)
UPDATE alunos_2012
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '3', '3 a 5 dias', Qnt_Flt_aula)
UPDATE alunos_2012
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '4', '6 a 9 dias', Qnt_Flt_aula)
UPDATE alunos_2012
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '5', '10 ou mais dias', Qnt_Flt_aula)
UPDATE alunos_2012
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '9', 'ND', Qnt_Flt_aula)
UPDATE alunos_2012
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '99', 'ND', Qnt_Flt_aula)

--5		Frq_pais_t_lvr
UPDATE alunos_2012
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '1', 'Nunca', Frq_pais_t_lvr)
UPDATE alunos_2012
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '2', 'Raramente', Frq_pais_t_lvr)
UPDATE alunos_2012
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '3', '�s vezes', Frq_pais_t_lvr)
UPDATE alunos_2012
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '4', 'Na maior parte do tempo', Frq_pais_t_lvr)
UPDATE alunos_2012
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '5', 'Sempre', Frq_pais_t_lvr)
UPDATE alunos_2012
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '9', 'ND', Frq_pais_t_lvr)
UPDATE alunos_2012
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '99', 'ND', Frq_pais_t_lvr)

--6		Frq_pais_dvr_csa
UPDATE alunos_2012
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '1', 'Nunca', Frq_pais_dvr_csa)
UPDATE alunos_2012
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '2', 'Raramente', Frq_pais_dvr_csa)
UPDATE alunos_2012
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '3', '�s vezes', Frq_pais_dvr_csa)
UPDATE alunos_2012
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '4', 'Na maior parte do tempo', Frq_pais_dvr_csa)
UPDATE alunos_2012
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '5', 'Sempre', Frq_pais_dvr_csa)
UPDATE alunos_2012
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '9', 'ND', Frq_pais_dvr_csa)
UPDATE alunos_2012
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '99', 'ND', Frq_pais_dvr_csa)

--7		Frq_pais_pbl_pcp
UPDATE alunos_2012
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '1', 'Nunca', Frq_pais_pbl_pcp)
UPDATE alunos_2012
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '2', 'Raramente', Frq_pais_pbl_pcp)
UPDATE alunos_2012
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '3', '�s vezes', Frq_pais_pbl_pcp)
UPDATE alunos_2012
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '4', 'Na maior parte do tempo', Frq_pais_pbl_pcp)
UPDATE alunos_2012
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '5', 'Sempre', Frq_pais_pbl_pcp)
UPDATE alunos_2012
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '9', 'ND', Frq_pais_pbl_pcp)
UPDATE alunos_2012
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '99', 'ND', Frq_pais_pbl_pcp)


--8		Frq_clg_bem
UPDATE alunos_2012
SET Frq_clg_bem = IIF(Frq_clg_bem = '1', 'Nunca', Frq_clg_bem)
UPDATE alunos_2012
SET Frq_clg_bem = IIF(Frq_clg_bem = '2', 'Raramente', Frq_clg_bem)
UPDATE alunos_2012
SET Frq_clg_bem = IIF(Frq_clg_bem = '3', '�s vezes', Frq_clg_bem)
UPDATE alunos_2012
SET Frq_clg_bem = IIF(Frq_clg_bem = '4', 'Na maior parte do tempo', Frq_clg_bem)
UPDATE alunos_2012
SET Frq_clg_bem = IIF(Frq_clg_bem = '5', 'Sempre', Frq_clg_bem)
UPDATE alunos_2012
SET Frq_clg_bem = IIF(Frq_clg_bem = '9', 'ND', Frq_clg_bem)
UPDATE alunos_2012
SET Frq_clg_bem = IIF(Frq_clg_bem = '99', 'ND', Frq_clg_bem)

--9		Frq_clg_mal
UPDATE alunos_2012
SET Frq_clg_mal = IIF(Frq_clg_mal = '1', 'Nunca', Frq_clg_mal)
UPDATE alunos_2012
SET Frq_clg_mal = IIF(Frq_clg_mal = '2', 'Raramente', Frq_clg_mal)
UPDATE alunos_2012
SET Frq_clg_mal = IIF(Frq_clg_mal = '3', '�s vezes', Frq_clg_mal)
UPDATE alunos_2012
SET Frq_clg_mal = IIF(Frq_clg_mal = '4', 'Na maior parte do tempo', Frq_clg_mal)
UPDATE alunos_2012
SET Frq_clg_mal = IIF(Frq_clg_mal = '5', 'Sempre', Frq_clg_mal)
UPDATE alunos_2012
SET Frq_clg_mal = IIF(Frq_clg_mal = '9', 'ND', Frq_clg_mal)
UPDATE alunos_2012
SET Frq_clg_mal = IIF(Frq_clg_mal = '99', 'ND', Frq_clg_mal)

--10	Mtv_clg_mal
UPDATE alunos_2012
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '1', 'A minha cor ou ra�a', Mtv_clg_mal)
UPDATE alunos_2012
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '2', 'A minha religi�o', Mtv_clg_mal)
UPDATE alunos_2012
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '3', 'A apar�ncia do meu rosto', Mtv_clg_mal)
UPDATE alunos_2012
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '4', 'A apar�ncia do meu corpo', Mtv_clg_mal)
UPDATE alunos_2012
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '5', 'A minha orienta��o sexual', Mtv_clg_mal)
UPDATE alunos_2012
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '6', 'A minha regi�o de origem', Mtv_clg_mal)
UPDATE alunos_2012
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '7', 'Outros motivos/causas', Mtv_clg_mal)
UPDATE alunos_2012
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '-1', 'Pulo no question�rio', Mtv_clg_mal)
UPDATE alunos_2012
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '9', 'ND', Mtv_clg_mal)
UPDATE alunos_2012
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '99', 'ND', Mtv_clg_mal)

--11	Prt_clg_mal
UPDATE alunos_2012
SET Prt_clg_mal = IIF(Prt_clg_mal = '1', 'Sim', Prt_clg_mal)
UPDATE alunos_2012
SET Prt_clg_mal = IIF(Prt_clg_mal = '2', 'N�o', Prt_clg_mal)
UPDATE alunos_2012
SET Prt_clg_mal = IIF(Prt_clg_mal = '9', 'ND', Prt_clg_mal)
UPDATE alunos_2012
SET Prt_clg_mal = IIF(Prt_clg_mal = '99', 'ND', Prt_clg_mal)

--12	Frq_soz
UPDATE alunos_2012
SET Frq_soz = IIF(Frq_soz = '1', 'Nunca', Frq_soz)
UPDATE alunos_2012
SET Frq_soz = IIF(Frq_soz = '2', 'Raramente', Frq_soz)
UPDATE alunos_2012
SET Frq_soz = IIF(Frq_soz = '3', '�s vezes', Frq_soz)
UPDATE alunos_2012
SET Frq_soz = IIF(Frq_soz = '4', 'Na maior parte do tempo', Frq_soz)
UPDATE alunos_2012
SET Frq_soz = IIF(Frq_soz = '5', 'Sempre', Frq_soz)
UPDATE alunos_2012
SET Frq_soz = IIF(Frq_soz = '9', 'ND', Frq_soz)
UPDATE alunos_2012
SET Frq_soz = IIF(Frq_soz = '99', 'ND', Frq_soz)

--13	Qnt_amgs
UPDATE alunos_2012
SET Qnt_amgs = IIF(Qnt_amgs = '1', 'Nenhum amigo (0)', Qnt_amgs)
UPDATE alunos_2012
SET Qnt_amgs = IIF(Qnt_amgs = '2', '1 amigo', Qnt_amgs)
UPDATE alunos_2012
SET Qnt_amgs = IIF(Qnt_amgs = '3', '2 amigos', Qnt_amgs)
UPDATE alunos_2012
SET Qnt_amgs = IIF(Qnt_amgs = '4', '3 ou mais amigos', Qnt_amgs)
UPDATE alunos_2012
SET Qnt_amgs = IIF(Qnt_amgs = '5', 'ND', Qnt_amgs)
UPDATE alunos_2012
SET Qnt_amgs = IIF(Qnt_amgs = '9', 'ND', Qnt_amgs)
UPDATE alunos_2012
SET Qnt_amgs = IIF(Qnt_amgs = '99', 'ND', Qnt_amgs)

--14	Frq_drm_prp
UPDATE alunos_2012
SET Frq_drm_prp = IIF(Frq_drm_prp = '1', 'Nunca', Frq_drm_prp)
UPDATE alunos_2012
SET Frq_drm_prp = IIF(Frq_drm_prp = '2', 'Raramente', Frq_drm_prp)
UPDATE alunos_2012
SET Frq_drm_prp = IIF(Frq_drm_prp = '3', '�s vezes', Frq_drm_prp)
UPDATE alunos_2012
SET Frq_drm_prp = IIF(Frq_drm_prp = '4', 'Na maior parte do tempo', Frq_drm_prp)
UPDATE alunos_2012
SET Frq_drm_prp = IIF(Frq_drm_prp = '5', 'Sempre', Frq_drm_prp)
UPDATE alunos_2012
SET Frq_drm_prp = IIF(Frq_drm_prp = '9', 'ND', Frq_drm_prp)
UPDATE alunos_2012
SET Frq_drm_prp = IIF(Frq_drm_prp = '99', 'ND', Frq_drm_prp)


--15	Sfr_agrs_fis
UPDATE alunos_2012
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '1', 'Nenhuma vez', Sfr_agrs_fis)
UPDATE alunos_2012
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '2', '1 vez', Sfr_agrs_fis)
UPDATE alunos_2012
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '3', '2 a 3 vezes', Sfr_agrs_fis)
UPDATE alunos_2012
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '4', '4 a 5 vezes', Sfr_agrs_fis)
UPDATE alunos_2012
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '5', '6 a 7 vezes', Sfr_agrs_fis)
UPDATE alunos_2012
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '6', '8 a 9 vezes', Sfr_agrs_fis)
UPDATE alunos_2012
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '7', '10 a 11 vezes', Sfr_agrs_fis)
UPDATE alunos_2012
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '8', '12 ou mais', Sfr_agrs_fis)
UPDATE alunos_2012
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '9', 'ND', Sfr_agrs_fis)
UPDATE alunos_2012
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '99', 'ND', Sfr_agrs_fis)

-- UPDATE na tabela alunosI_2015 para respostas observ�veis (aprx: 7min)
--1		Regiao
UPDATE alunosI_2015
SET Regiao = IIF(Regiao = '1', 'Norte', Regiao)
UPDATE alunosI_2015
SET Regiao = IIF(Regiao = '2', 'Nordeste', Regiao)
UPDATE alunosI_2015
SET Regiao = IIF(Regiao = '3', 'Sudeste', Regiao)
UPDATE alunosI_2015
SET Regiao = IIF(Regiao = '4', 'Sul', Regiao)
UPDATE alunosI_2015
SET Regiao = IIF(Regiao = '5', 'Centro-Oeste', Regiao)

--2		Sexo
UPDATE alunosI_2015
SET Sexo = IIF(Sexo = '1', 'Masculino', Sexo)
UPDATE alunosI_2015
SET Sexo = IIF(Sexo = '2', 'Feminino', Sexo)

--3		Raca
UPDATE alunosI_2015
SET Raca = IIF(Raca = '1', 'Branca', Raca)
UPDATE alunosI_2015
SET Raca = IIF(Raca = '2', 'Preta', Raca)
UPDATE alunosI_2015
SET Raca = IIF(Raca = '3', 'Amarela', Raca)
UPDATE alunosI_2015
SET Raca = IIF(Raca = '4', 'Parda', Raca)
UPDATE alunosI_2015
SET Raca = IIF(Raca = '5', 'ND', Raca)
UPDATE alunosI_2015
SET Raca = IIF(Raca = '9', 'ND', Raca)
UPDATE alunosI_2015
SET Raca = IIF(Raca = '99', 'ND', Raca)

--4		Qnt_Flt_aula
UPDATE alunosI_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '1', 'Nenhum dia (0 dia)', Qnt_Flt_aula)
UPDATE alunosI_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '2', '1 ou 2 dias', Qnt_Flt_aula)
UPDATE alunosI_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '3', '3 a 5 dias', Qnt_Flt_aula)
UPDATE alunosI_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '4', '6 a 9 dias', Qnt_Flt_aula)
UPDATE alunosI_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '5', '10 ou mais dias', Qnt_Flt_aula)
UPDATE alunosI_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '9', 'ND', Qnt_Flt_aula)
UPDATE alunosI_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '99', 'ND', Qnt_Flt_aula)

--5		Frq_pais_t_lvr
UPDATE alunosI_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '1', 'Nunca', Frq_pais_t_lvr)
UPDATE alunosI_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '2', 'Raramente', Frq_pais_t_lvr)
UPDATE alunosI_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '3', '�s vezes', Frq_pais_t_lvr)
UPDATE alunosI_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '4', 'Na maior parte do tempo', Frq_pais_t_lvr)
UPDATE alunosI_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '5', 'Sempre', Frq_pais_t_lvr)
UPDATE alunosI_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '9', 'ND', Frq_pais_t_lvr)
UPDATE alunosI_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '99', 'ND', Frq_pais_t_lvr)

--6		Frq_pais_dvr_csa
UPDATE alunosI_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '1', 'Nunca', Frq_pais_dvr_csa)
UPDATE alunosI_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '2', 'Raramente', Frq_pais_dvr_csa)
UPDATE alunosI_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '3', '�s vezes', Frq_pais_dvr_csa)
UPDATE alunosI_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '4', 'Na maior parte do tempo', Frq_pais_dvr_csa)
UPDATE alunosI_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '5', 'Sempre', Frq_pais_dvr_csa)
UPDATE alunosI_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '9', 'ND', Frq_pais_dvr_csa)
UPDATE alunosI_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '99', 'ND', Frq_pais_dvr_csa)

--7		Frq_pais_pbl_pcp
UPDATE alunosI_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '1', 'Nunca', Frq_pais_pbl_pcp)
UPDATE alunosI_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '2', 'Raramente', Frq_pais_pbl_pcp)
UPDATE alunosI_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '3', '�s vezes', Frq_pais_pbl_pcp)
UPDATE alunosI_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '4', 'Na maior parte do tempo', Frq_pais_pbl_pcp)
UPDATE alunosI_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '5', 'Sempre', Frq_pais_pbl_pcp)
UPDATE alunosI_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '9', 'ND', Frq_pais_pbl_pcp)
UPDATE alunosI_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '99', 'ND', Frq_pais_pbl_pcp)

--8		Frq_clg_bem
UPDATE alunosI_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '1', 'Nunca', Frq_clg_bem)
UPDATE alunosI_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '2', 'Raramente', Frq_clg_bem)
UPDATE alunosI_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '3', '�s vezes', Frq_clg_bem)
UPDATE alunosI_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '4', 'Na maior parte do tempo', Frq_clg_bem)
UPDATE alunosI_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '5', 'Sempre', Frq_clg_bem)
UPDATE alunosI_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '9', 'ND', Frq_clg_bem)
UPDATE alunosI_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '99', 'ND', Frq_clg_bem)

--9		Frq_clg_mal
UPDATE alunosI_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '1', 'Nunca', Frq_clg_mal)
UPDATE alunosI_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '2', 'Raramente', Frq_clg_mal)
UPDATE alunosI_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '3', '�s vezes', Frq_clg_mal)
UPDATE alunosI_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '4', 'Na maior parte do tempo', Frq_clg_mal)
UPDATE alunosI_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '5', 'Sempre', Frq_clg_mal)
UPDATE alunosI_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '9', 'ND', Frq_clg_mal)
UPDATE alunosI_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '99', 'ND', Frq_clg_mal)

--10	Mtv_clg_mal
UPDATE alunosI_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '1', 'A minha cor ou ra�a', Mtv_clg_mal)
UPDATE alunosI_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '2', 'A minha religi�o', Mtv_clg_mal)
UPDATE alunosI_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '3', 'A apar�ncia do meu rosto', Mtv_clg_mal)
UPDATE alunosI_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '4', 'A apar�ncia do meu corpo', Mtv_clg_mal)
UPDATE alunosI_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '5', 'A minha orienta��o sexual', Mtv_clg_mal)
UPDATE alunosI_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '6', 'A minha regi�o de origem', Mtv_clg_mal)
UPDATE alunosI_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '7', 'Outros motivos/causas', Mtv_clg_mal)
UPDATE alunosI_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '-1', 'Pulo no question�rio', Mtv_clg_mal)
UPDATE alunosI_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '9', 'ND', Mtv_clg_mal)
UPDATE alunosI_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '99', 'ND', Mtv_clg_mal)

--11	Prt_clg_mal
UPDATE alunosI_2015
SET Prt_clg_mal = IIF(Prt_clg_mal = '1', 'Sim', Prt_clg_mal)
UPDATE alunosI_2015
SET Prt_clg_mal = IIF(Prt_clg_mal = '2', 'N�o', Prt_clg_mal)
UPDATE alunosI_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '9', 'ND', Mtv_clg_mal)
UPDATE alunosI_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '99', 'ND', Mtv_clg_mal)

--12	Frq_soz
UPDATE alunosI_2015
SET Frq_soz = IIF(Frq_soz = '1', 'Nunca', Frq_soz)
UPDATE alunosI_2015
SET Frq_soz = IIF(Frq_soz = '2', 'Raramente', Frq_soz)
UPDATE alunosI_2015
SET Frq_soz = IIF(Frq_soz = '3', '�s vezes', Frq_soz)
UPDATE alunosI_2015
SET Frq_soz = IIF(Frq_soz = '4', 'Na maior parte do tempo', Frq_soz)
UPDATE alunosI_2015
SET Frq_soz = IIF(Frq_soz = '5', 'Sempre', Frq_soz)
UPDATE alunosI_2015
SET Frq_soz = IIF(Frq_soz = '9', 'ND', Frq_soz)
UPDATE alunosI_2015
SET Frq_soz = IIF(Frq_soz = '99', 'ND', Frq_soz)

--13	Qnt_amgs
UPDATE alunosI_2015
SET Qnt_amgs = IIF(Qnt_amgs = '1', 'Nenhum amigo (0)', Qnt_amgs)
UPDATE alunosI_2015
SET Qnt_amgs = IIF(Qnt_amgs = '2', '1 amigo', Qnt_amgs)
UPDATE alunosI_2015
SET Qnt_amgs = IIF(Qnt_amgs = '3', '2 amigos', Qnt_amgs)
UPDATE alunosI_2015
SET Qnt_amgs = IIF(Qnt_amgs = '4', '3 ou mais amigos', Qnt_amgs)
UPDATE alunosI_2015
SET Qnt_amgs = IIF(Qnt_amgs = '5', 'ND', Qnt_amgs)
UPDATE alunosI_2015
SET Qnt_amgs = IIF(Qnt_amgs = '9', 'ND', Qnt_amgs)
UPDATE alunosI_2015
SET Qnt_amgs = IIF(Qnt_amgs = '99', 'ND', Qnt_amgs)


--14	Frq_drm_prp
UPDATE alunosI_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '1', 'Nunca', Frq_drm_prp)
UPDATE alunosI_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '2', 'Raramente', Frq_drm_prp)
UPDATE alunosI_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '3', '�s vezes', Frq_drm_prp)
UPDATE alunosI_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '4', 'Na maior parte do tempo', Frq_drm_prp)
UPDATE alunosI_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '5', 'Sempre', Frq_drm_prp)
UPDATE alunosII_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '9', 'ND', Frq_drm_prp)
UPDATE alunosII_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '99', 'ND', Frq_drm_prp)


--15	Sfr_agrs_fis
UPDATE alunosI_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '1', 'Nenhuma vez', Sfr_agrs_fis)
UPDATE alunosI_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '2', '1 vez', Sfr_agrs_fis)
UPDATE alunosI_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '3', '2 a 3 vezes', Sfr_agrs_fis)
UPDATE alunosI_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '4', '4 a 5 vezes', Sfr_agrs_fis)
UPDATE alunosI_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '5', '6 a 7 vezes', Sfr_agrs_fis)
UPDATE alunosI_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '6', '8 a 9 vezes', Sfr_agrs_fis)
UPDATE alunosI_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '7', '10 a 11 vezes', Sfr_agrs_fis)
UPDATE alunosI_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '8', '12 ou mais', Sfr_agrs_fis)
UPDATE alunosI_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '9', 'ND', Sfr_agrs_fis)
UPDATE alunosI_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '99', 'ND', Sfr_agrs_fis)


-- UPDATE na tabela alunosII_2015 para respostas observ�veis (aprx: 30s)
--1		Regiao
UPDATE alunosII_2015
SET Regiao = IIF(Regiao = '1', 'Norte', Regiao)
UPDATE alunosII_2015
SET Regiao = IIF(Regiao = '2', 'Nordeste', Regiao)
UPDATE alunosII_2015
SET Regiao = IIF(Regiao = '3', 'Sudeste', Regiao)
UPDATE alunosII_2015
SET Regiao = IIF(Regiao = '4', 'Sul', Regiao)
UPDATE alunosII_2015
SET Regiao = IIF(Regiao = '5', 'Centro-Oeste', Regiao)

--2		Sexo
UPDATE alunosII_2015
SET Sexo = IIF(Sexo = '1', 'Masculino', Sexo)
UPDATE alunosII_2015
SET Sexo = IIF(Sexo = '2', 'Feminino', Sexo)

--3		Raca
UPDATE alunosII_2015
SET Raca = IIF(Raca = '1', 'Branca', Raca)
UPDATE alunosII_2015
SET Raca = IIF(Raca = '2', 'Preta', Raca)
UPDATE alunosII_2015
SET Raca = IIF(Raca = '3', 'Amarela', Raca)
UPDATE alunosII_2015
SET Raca = IIF(Raca = '4', 'Parda', Raca)
UPDATE alunosII_2015
SET Raca = IIF(Raca = '5', 'ND', Raca)
UPDATE alunosII_2015
SET Raca = IIF(Raca = '9', 'ND', Raca)
UPDATE alunosII_2015
SET Raca = IIF(Raca = '99', 'ND', Raca)

--4		Qnt_Flt_aula
UPDATE alunosII_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '1', 'Nenhum dia (0 dia)', Qnt_Flt_aula)
UPDATE alunosII_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '2', '1 ou 2 dias', Qnt_Flt_aula)
UPDATE alunosII_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '3', '3 a 5 dias', Qnt_Flt_aula)
UPDATE alunosII_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '4', '6 a 9 dias', Qnt_Flt_aula)
UPDATE alunosII_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '5', '10 ou mais dias', Qnt_Flt_aula)
UPDATE alunosII_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '9', 'ND', Qnt_Flt_aula)
UPDATE alunosII_2015
SET Qnt_Flt_aula = IIF(Qnt_Flt_aula = '99', 'ND', Qnt_Flt_aula)

--5		Frq_pais_t_lvr
UPDATE alunosII_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '1', 'Nunca', Frq_pais_t_lvr)
UPDATE alunosII_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '2', 'Raramente', Frq_pais_t_lvr)
UPDATE alunosII_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '3', '�s vezes', Frq_pais_t_lvr)
UPDATE alunosII_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '4', 'Na maior parte do tempo', Frq_pais_t_lvr)
UPDATE alunosII_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '5', 'Sempre', Frq_pais_t_lvr)
UPDATE alunosII_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '9', 'ND', Frq_pais_t_lvr)
UPDATE alunosII_2015
SET Frq_pais_t_lvr = IIF(Frq_pais_t_lvr = '99', 'ND', Frq_pais_t_lvr)

--6		Frq_pais_dvr_csa
UPDATE alunosII_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '1', 'Nunca', Frq_pais_dvr_csa)
UPDATE alunosII_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '2', 'Raramente', Frq_pais_dvr_csa)
UPDATE alunosII_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '3', '�s vezes', Frq_pais_dvr_csa)
UPDATE alunosII_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '4', 'Na maior parte do tempo', Frq_pais_dvr_csa)
UPDATE alunosII_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '5', 'Sempre', Frq_pais_dvr_csa)
UPDATE alunosII_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '9', 'ND', Frq_pais_dvr_csa)
UPDATE alunosII_2015
SET Frq_pais_dvr_csa = IIF(Frq_pais_dvr_csa = '99', 'ND', Frq_pais_dvr_csa)

--7		Frq_pais_pbl_pcp
UPDATE alunosII_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '1', 'Nunca', Frq_pais_pbl_pcp)
UPDATE alunosII_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '2', 'Raramente', Frq_pais_pbl_pcp)
UPDATE alunosII_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '3', '�s vezes', Frq_pais_pbl_pcp)
UPDATE alunosII_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '4', 'Na maior parte do tempo', Frq_pais_pbl_pcp)
UPDATE alunosII_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '5', 'Sempre', Frq_pais_pbl_pcp)
UPDATE alunosII_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '9', 'ND', Frq_pais_pbl_pcp)
UPDATE alunosII_2015
SET Frq_pais_pbl_pcp = IIF(Frq_pais_pbl_pcp = '99', 'ND', Frq_pais_pbl_pcp)

--8		Frq_clg_bem
UPDATE alunosII_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '1', 'Nunca', Frq_clg_bem)
UPDATE alunosII_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '2', 'Raramente', Frq_clg_bem)
UPDATE alunosII_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '3', '�s vezes', Frq_clg_bem)
UPDATE alunosII_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '4', 'Na maior parte do tempo', Frq_clg_bem)
UPDATE alunosII_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '5', 'Sempre', Frq_clg_bem)
UPDATE alunosII_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '9', 'ND', Frq_clg_bem)
UPDATE alunosII_2015
SET Frq_clg_bem = IIF(Frq_clg_bem = '99', 'ND', Frq_clg_bem)

--9		Frq_clg_mal
UPDATE alunosII_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '1', 'Nunca', Frq_clg_mal)
UPDATE alunosII_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '2', 'Raramente', Frq_clg_mal)
UPDATE alunosII_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '3', '�s vezes', Frq_clg_mal)
UPDATE alunosII_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '4', 'Na maior parte do tempo', Frq_clg_mal)
UPDATE alunosII_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '5', 'Sempre', Frq_clg_mal)
UPDATE alunosII_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '9', 'ND', Frq_clg_mal)
UPDATE alunosII_2015
SET Frq_clg_mal = IIF(Frq_clg_mal = '99', 'ND', Frq_clg_mal)

--10	Mtv_clg_mal
UPDATE alunosII_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '1', 'A minha cor ou ra�a', Mtv_clg_mal)
UPDATE alunosII_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '2', 'A minha religi�o', Mtv_clg_mal)
UPDATE alunosII_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '3', 'A apar�ncia do meu rosto', Mtv_clg_mal)
UPDATE alunosII_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '4', 'A apar�ncia do meu corpo', Mtv_clg_mal)
UPDATE alunosII_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '5', 'A minha orienta��o sexual', Mtv_clg_mal)
UPDATE alunosII_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '6', 'A minha regi�o de origem', Mtv_clg_mal)
UPDATE alunosII_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '7', 'Outros motivos/causas', Mtv_clg_mal)
UPDATE alunosII_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '-1', 'Pulo no question�rio', Mtv_clg_mal)
UPDATE alunosII_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '9', 'ND', Mtv_clg_mal)
UPDATE alunosII_2015
SET Mtv_clg_mal = IIF(Mtv_clg_mal = '99', 'ND', Mtv_clg_mal)

--11	Prt_clg_mal
UPDATE alunosII_2015
SET Prt_clg_mal = IIF(Prt_clg_mal = '1', 'Sim', Prt_clg_mal)
UPDATE alunosII_2015
SET Prt_clg_mal = IIF(Prt_clg_mal = '2', 'N�o', Prt_clg_mal)
UPDATE alunosII_2015
SET Prt_clg_mal = IIF(Prt_clg_mal = '9', 'ND', Prt_clg_mal)
UPDATE alunosII_2015
SET Prt_clg_mal = IIF(Prt_clg_mal = '99', 'ND', Prt_clg_mal)

--12	Frq_soz
UPDATE alunosII_2015
SET Frq_soz = IIF(Frq_soz = '1', 'Nunca', Frq_soz)
UPDATE alunosII_2015
SET Frq_soz = IIF(Frq_soz = '2', 'Raramente', Frq_soz)
UPDATE alunosII_2015
SET Frq_soz = IIF(Frq_soz = '3', '�s vezes', Frq_soz)
UPDATE alunosII_2015
SET Frq_soz = IIF(Frq_soz = '4', 'Na maior parte do tempo', Frq_soz)
UPDATE alunosII_2015
SET Frq_soz = IIF(Frq_soz = '5', 'Sempre', Frq_soz)
UPDATE alunosII_2015
SET Frq_soz = IIF(Frq_soz = '9', 'ND', Frq_soz)
UPDATE alunosII_2015
SET Frq_soz = IIF(Frq_soz = '99', 'ND', Frq_soz)

--13	Qnt_amgs
UPDATE alunosII_2015
SET Qnt_amgs = IIF(Qnt_amgs = '1', 'Nenhum amigo (0)', Qnt_amgs)
UPDATE alunosII_2015
SET Qnt_amgs = IIF(Qnt_amgs = '2', '1 amigo', Qnt_amgs)
UPDATE alunosII_2015
SET Qnt_amgs = IIF(Qnt_amgs = '3', '2 amigos', Qnt_amgs)
UPDATE alunosII_2015
SET Qnt_amgs = IIF(Qnt_amgs = '4', '3 ou mais amigos', Qnt_amgs)
UPDATE alunosII_2015
SET Qnt_amgs = IIF(Qnt_amgs = '5', 'ND', Qnt_amgs)
UPDATE alunosII_2015
SET Qnt_amgs = IIF(Qnt_amgs = '9', 'ND', Qnt_amgs)
UPDATE alunosII_2015
SET Qnt_amgs = IIF(Qnt_amgs = '99', 'ND', Qnt_amgs)

--14	Frq_drm_prp
UPDATE alunosII_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '1', 'Nunca', Frq_drm_prp)
UPDATE alunosII_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '2', 'Raramente', Frq_drm_prp)
UPDATE alunosII_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '3', '�s vezes', Frq_drm_prp)
UPDATE alunosII_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '4', 'Na maior parte do tempo', Frq_drm_prp)
UPDATE alunosII_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '5', 'Sempre', Frq_drm_prp)
UPDATE alunosII_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '9', 'ND', Frq_drm_prp)
UPDATE alunosII_2015
SET Frq_drm_prp = IIF(Frq_drm_prp = '99', 'ND', Frq_drm_prp)

--15	Sfr_agrs_fis
UPDATE alunosII_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '1', 'Nenhuma vez', Sfr_agrs_fis)
UPDATE alunosII_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '2', '1 vez', Sfr_agrs_fis)
UPDATE alunosII_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '3', '2 a 3 vezes', Sfr_agrs_fis)
UPDATE alunosII_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '4', '4 a 5 vezes', Sfr_agrs_fis)
UPDATE alunosII_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '5', '6 a 7 vezes', Sfr_agrs_fis)
UPDATE alunosII_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '6', '8 a 9 vezes', Sfr_agrs_fis)
UPDATE alunosII_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '7', '10 a 11 vezes', Sfr_agrs_fis)
UPDATE alunosII_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '8', '12 ou mais', Sfr_agrs_fis)
UPDATE alunosII_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '9', 'ND', Sfr_agrs_fis)
UPDATE alunosII_2015
SET Sfr_agrs_fis = IIF(Sfr_agrs_fis = '99', 'ND', Sfr_agrs_fis)



--------------------------------------------------------------------------------------------------------------------------------------------
-- Com o banco de dados com respostas observ�veis e padronizadas, agora vamos selecionar apenas as nossas colunas de interesse
-- alunos_2012 109.104 rows (ok)
SELECT Regiao,Sexo,Raca,Qnt_Flt_aula,Frq_pais_t_lvr,Frq_pais_dvr_csa,Frq_pais_pbl_pcp,Frq_clg_bem,Frq_clg_mal,Mtv_clg_mal,Prt_clg_mal,
	Sfr_agrs_fis,Frq_soz,Frq_drm_prp,Qnt_amgs FROM alunos_2012

-- alunosI_2015 102.072 rows (ok)
SELECT Regiao,Sexo,Raca,Qnt_Flt_aula,Frq_pais_t_lvr,Frq_pais_dvr_csa,Frq_pais_pbl_pcp,Frq_clg_bem,Frq_clg_mal,Mtv_clg_mal,Prt_clg_mal,
	Sfr_agrs_fis,Frq_soz,Frq_drm_prp,Qnt_amgs FROM alunosI_2015

-- alunosII_2015 16.556 rows (ok)
SELECT Regiao,Sexo,Raca,Qnt_Flt_aula,Frq_pais_t_lvr,Frq_pais_dvr_csa,Frq_pais_pbl_pcp,Frq_clg_bem,Frq_clg_mal,Mtv_clg_mal,Prt_clg_mal,
	Sfr_agrs_fis,Frq_soz,Frq_drm_prp,Qnt_amgs FROM alunosII_2015

-- Como temos duas amostras pertencentes ao mesmo ano (2015) vamos criar uma nova tabela onde iremos registrar todos os dados da pesquisa
-- de 2015.

CREATE TABLE alunos_2015(
    Regiao varchar(50),
    Sexo varchar(50),
    Raca varchar(50),
    Qnt_Flt_aula varchar(50),
    Frq_pais_t_lvr varchar(50),
	Frq_pais_dvr_csa varchar(50),
    Frq_pais_pbl_pcp varchar(50),
    Frq_clg_bem varchar(50),
    Frq_clg_mal varchar(50),
	Mtv_clg_mal varchar(50),
    Prt_clg_mal varchar(50),
    Sfr_agrs_fis varchar(50),
    Frq_soz varchar(50),
	Frq_drm_prp varchar(50),
    Qnt_amgs varchar(50),
);

-- Inserindo os dados da amostra I de 2015
INSERT INTO alunos_2015
    SELECT Regiao,Sexo,Raca,Qnt_Flt_aula,Frq_pais_t_lvr,Frq_pais_dvr_csa,Frq_pais_pbl_pcp,Frq_clg_bem,Frq_clg_mal,Mtv_clg_mal,Prt_clg_mal,
	Sfr_agrs_fis,Frq_soz,Frq_drm_prp,Qnt_amgs
    FROM alunosI_2015;
SELECT * FROM alunos_2015 -- 102.072 rows (ok)

-- Inserindo os dados da amostra II de 2015
INSERT INTO alunos_2015
    SELECT Regiao,Sexo,Raca,Qnt_Flt_aula,Frq_pais_t_lvr,Frq_pais_dvr_csa,Frq_pais_pbl_pcp,Frq_clg_bem,Frq_clg_mal,Mtv_clg_mal,Prt_clg_mal,
	Sfr_agrs_fis,Frq_soz,Frq_drm_prp,Qnt_amgs
    FROM alunosII_2015;
SELECT * FROM alunos_2015 -- 118.628 rows (ok) >> 102.072 + 16.556 rows

-- Para facilitar a an�lise, vamos criar uma tabela alunos_geral que ir� conter todos os dados. Para isso precisamos saber o respectivo ano
-- das pesquisas, portanto vamos adicionar uma coluna chamada ano em cada tabela e atribuir o ano de cada pesquisa
-- alunos_2012
ALTER TABLE alunos_2012 
    ADD Ano VARCHAR (50) NULL;

-- Substituindo os valores nulos por 2012
UPDATE alunos_2012
SET Ano = '2012'
WHERE ANO IS NULL;

-- alunos_2015
ALTER TABLE alunos_2015
    ADD Ano VARCHAR (50) NULL;

-- Substituindo os valores nulos por 2015
UPDATE alunos_2015
SET Ano = '2015'
WHERE ANO IS NULL;

-- Agora que temos todos os dados de 2015 numa �nica tabela, alinhados com os dados de 2012, vamos criar uma tabela final onde iremos 
-- realizar nossas consultas.

CREATE TABLE alunos_geral(
    Regiao varchar(50),
    Sexo varchar(50),
    Raca varchar(50),
    Qnt_Flt_aula varchar(50),
    Frq_pais_t_lvr varchar(50),
	Frq_pais_dvr_csa varchar(50),
    Frq_pais_pbl_pcp varchar(50),
    Frq_clg_bem varchar(50),
    Frq_clg_mal varchar(50),
	Mtv_clg_mal varchar(50),
    Prt_clg_mal varchar(50),
    Sfr_agrs_fis varchar(50),
    Frq_soz varchar(50),
	Frq_drm_prp varchar(50),
    Qnt_amgs varchar(50),
	Ano varchar(50),
);

-- Inserindo os dados de 2012
INSERT INTO alunos_geral
    SELECT Regiao,Sexo,Raca,Qnt_Flt_aula,Frq_pais_t_lvr,Frq_pais_dvr_csa,Frq_pais_pbl_pcp,Frq_clg_bem,Frq_clg_mal,Mtv_clg_mal,Prt_clg_mal,
	Sfr_agrs_fis,Frq_soz,Frq_drm_prp,Qnt_amgs, Ano
    FROM alunos_2012;
SELECT * FROM alunos_geral -- 109.104 rows

-- Inserindo os dados de 2015
INSERT INTO alunos_geral
    SELECT Regiao,Sexo,Raca,Qnt_Flt_aula,Frq_pais_t_lvr,Frq_pais_dvr_csa,Frq_pais_pbl_pcp,Frq_clg_bem,Frq_clg_mal,Mtv_clg_mal,Prt_clg_mal,
	Sfr_agrs_fis,Frq_soz,Frq_drm_prp,Qnt_amgs, Ano
    FROM alunos_2015;
SELECT * FROM alunos_geral -- 227.732 rows (ok) >> 118.628 + 109.104 rows

-- Limpeza de dados para o POWER BI 

--Prt_clg_mal
UPDATE alunos_geral
SET Prt_clg_mal = IIF(Prt_clg_mal = '99', 'ND', Prt_clg_mal)
UPDATE alunos_geral
SET Frq_drm_prp = IIF(Frq_drm_prp = '99', 'ND', Frq_drm_prp)

-- Agora com a tabela alunos_geral podemos trabalhar nossas an�lises de uma forma padronizada.

--------------------------------------------------------------------------------------------------------------------------------------------
-- ANALISE DOS DADOS
--------------------------------------------------------------------------------------------------------------------------------------------
-- DESCRITIVA

-- No total temos 227.732 respostas.

--Regiao:
-- Nordeste possui o a maior fatia dos respondentes da pesquisa;
-- Centro-Oeste e Sul tiveram menos inscritos em rela��o a 2012;
SELECT Regiao, COUNT(Regiao) AS Qnt_regiao FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Regiao
ORDER BY COUNT(Regiao) DESC

SELECT Regiao, COUNT(Regiao) AS Qnt_regiao FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Regiao
ORDER BY COUNT(Regiao) DESC

--Sexo:
-- Existe um certo equil�brio no sexo dos pesquisados, por�m o p�blico feminino � um pouco superior ao masculino
SELECT Sexo, COUNT(Sexo) AS Qnt_sexo FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Sexo
ORDER BY COUNT(Sexo) DESC

SELECT Sexo, COUNT(Sexo) AS Qnt_sexo FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Sexo
ORDER BY COUNT(Sexo) DESC

--Raca:
-- Predominantemente Parda e Branca.
SELECT Raca, COUNT(Raca) AS Qnt_raca FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Raca
ORDER BY COUNT(Raca) DESC

SELECT Raca, COUNT(Raca) AS Qnt_raca FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Raca
ORDER BY COUNT(Raca) DESC

--Qnt_Flt_aula:
-- A por��o de alunos que possuem 0 faltas aumentou em rela��o a 2012.
-- Em 2015 tivemos alunos que faltaram mais de 10 dias, o que n�o havia em 2012.
SELECT Qnt_Flt_aula, COUNT(Qnt_Flt_aula) AS Qnt_falta FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Qnt_Flt_aula
ORDER BY COUNT(Qnt_Flt_aula) DESC

SELECT Qnt_Flt_aula, COUNT(Qnt_Flt_aula) AS Qnt_falta FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Qnt_Flt_aula
ORDER BY COUNT(Qnt_Flt_aula) DESC

--Frq_pais_t_lvr:
-- Parece que os pais cada vez mais est�o cientes do que os filhos fazem no tempo livre
SELECT Frq_pais_t_lvr, COUNT(Frq_pais_t_lvr) AS Qnt_tmp_lvr FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Frq_pais_t_lvr
ORDER BY COUNT(Frq_pais_t_lvr) DESC

SELECT Frq_pais_t_lvr, COUNT(Frq_pais_t_lvr) AS Qnt_tmp_lvr FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Frq_pais_t_lvr
ORDER BY COUNT(Frq_pais_t_lvr) DESC

--Frq_pais_dvr_csa:
-- Parece que olhar o dever de casa dos filhos n�o � algo regular na maioria dos pais.
SELECT Frq_pais_dvr_csa, COUNT(Frq_pais_dvr_csa) AS Qnt_pais_dever FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Frq_pais_dvr_csa
ORDER BY COUNT(Frq_pais_dvr_csa) DESC

SELECT Frq_pais_dvr_csa, COUNT(Frq_pais_dvr_csa) AS Qnt_pais_dever FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Frq_pais_dvr_csa
ORDER BY COUNT(Frq_pais_dvr_csa) DESC

--Frq_pais_pbl_pcp:
-- Os pais parecem apresentar aten��o constante com os problemas e preocupa��es dos filhos, por�m a frequencia � bem variada.
SELECT Frq_pais_pbl_pcp, COUNT(Frq_pais_pbl_pcp) AS Qnt_pbl_pcp FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Frq_pais_pbl_pcp
ORDER BY COUNT(Frq_pais_pbl_pcp) DESC

SELECT Frq_pais_pbl_pcp, COUNT(Frq_pais_pbl_pcp) AS Qnt_pbl_pcp FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Frq_pais_pbl_pcp
ORDER BY COUNT(Frq_pais_pbl_pcp) DESC

--Frq_clg_bem:
-- A predominancia � que h� um bom relacionamento entre os colegas, por�m h� varia��o em rela��o aos fatores aponta que h� preocupa��o
-- com o "�s vezes" que aumentou muito de 2012 para 2015.
SELECT Frq_clg_bem, COUNT(Frq_clg_bem) AS Qnt_clg_bem FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Frq_clg_bem
ORDER BY COUNT(Frq_clg_bem) DESC

SELECT Frq_clg_bem, COUNT(Frq_pais_pbl_pcp) AS Qnt_clg_bem FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Frq_clg_bem
ORDER BY COUNT(Frq_clg_bem) DESC

--Frq_clg_mal:
-- Os fatores negativos aumentaram em rela��o a 2012. H� mais Bully ocorrendo.
SELECT Frq_clg_mal, COUNT(Frq_clg_mal) AS Qnt_clg_mal FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Frq_clg_mal
ORDER BY COUNT(Frq_clg_mal) DESC

SELECT Frq_clg_mal, COUNT(Frq_clg_mal) AS Qnt_clg_mal FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Frq_clg_mal
ORDER BY COUNT(Frq_clg_mal) DESC

--Mtv_clg_mal:
-- Existem muitas respostas em outros "motivos/causa", alegando causas ainda desconhecidas e abrindo uma porta para mais investiga��o
-- A est�tica � a principal causa do bullying.
-- Cor da pele, religi�o, dentre outras n�o demonstraram ser relevantes.
SELECT Mtv_clg_mal, COUNT(Mtv_clg_mal) AS Qnt_mtv_mal FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Mtv_clg_mal
ORDER BY COUNT(Mtv_clg_mal) DESC

SELECT Mtv_clg_mal, COUNT(Mtv_clg_mal) AS Qnt_mtv_mal FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Mtv_clg_mal
ORDER BY COUNT(Mtv_clg_mal) DESC

--Prt_clg_mal:
-- A grande maioria informa n�o praticar o bullying, e al�m disso o numero de praticantes diminuiu em rela��o a 2012.
-- Contudo,a quantidade de pessoas que dizem praticar segue constante.
SELECT Prt_clg_mal, COUNT(Prt_clg_mal) AS Qnt_prt_mal FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Prt_clg_mal
ORDER BY COUNT(Prt_clg_mal) DESC

SELECT Prt_clg_mal, COUNT(Prt_clg_mal) AS Qnt_prt_mal FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Prt_clg_mal
ORDER BY COUNT(Prt_clg_mal) DESC

--Sfr_agrs_fis:
-- A grande maioria informa n�o ter sofrido agress�o f�sica.
SELECT Sfr_agrs_fis, COUNT(Sfr_agrs_fis) AS Qnt_agrs_fis FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Sfr_agrs_fis
ORDER BY COUNT(Sfr_agrs_fis) DESC

SELECT Sfr_agrs_fis, COUNT(Sfr_agrs_fis) AS Qnt_agrs_fis FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Sfr_agrs_fis
ORDER BY COUNT(Sfr_agrs_fis) DESC

--Frq_soz:
-- Uma parcela elevada informa n�o se sentir sozinho(a), por�m o valor de quem sente-se sozinho(a) aumentou.
-- Existe alterna��o entre os fatores.
SELECT Frq_soz, COUNT(Frq_soz) AS Qnt_soz FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Frq_soz
ORDER BY COUNT(Frq_soz) DESC

SELECT Frq_soz, COUNT(Frq_soz) AS Qnt_soz FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Frq_soz
ORDER BY COUNT(Frq_soz) DESC

--Frq_drm_prp:
-- Uma parcela elevada informa n�o dormir preocupado(a), por�m o valor de quem dorme preocupado com algo aumentou.
-- Houve alterna��o entre os fatores
SELECT Frq_drm_prp, COUNT(Frq_drm_prp) AS Qnt_drm_prp FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Frq_drm_prp
ORDER BY COUNT(Frq_drm_prp) DESC

SELECT Frq_drm_prp, COUNT(Frq_drm_prp) AS Qnt_drm_prp FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Frq_drm_prp
ORDER BY COUNT(Frq_drm_prp) DESC

--Qnt_amgs:
-- A grande maioria possui 3 amigos ou mais, por�m o valor de quem n�o possui 1 ou nenhum aumentou.
SELECT Qnt_amgs, COUNT(Qnt_amgs) AS Qnt_amgs_cat FROM alunos_geral 
WHERE Ano = '2012'
GROUP BY Qnt_amgs
ORDER BY COUNT(Qnt_amgs) DESC

SELECT Qnt_amgs, COUNT(Qnt_amgs) AS Qnt_amgs_cat FROM alunos_geral 
WHERE Ano = '2015'
GROUP BY Qnt_amgs
ORDER BY COUNT(Qnt_amgs) DESC

-- Resumo:
-- Ap�s passar por todas as variaveis � poss�vel notar que a impress�o no geral � boa sob a pespectiva do bullying no contexto BRASIL. 
-- Por�m alguns fatores negativos que acabaram aumentando causam preocupa��o, e � preciso compreender em qual 'grupo' esses fatores 
-- aumentaram. Uma vez identificado, � poss�vel analisar a conjuntura e tra�ar um plano de a��o.
-- Em 2015 o Centro-Oeste diminuiu o indice elevado de faltas, dando lugar a piora do Nordeste.
-- Em geral Sudeste e Nordeste encabe�am o indice de faltas. H� um certo equilibrio entre os generos em rela��o as faltas, conforme j� 
-- apontado.
-- Pais se atentam ao saber o que os filhos fazem no tempo livre mas n�o tem o h�bito de olhar o dever. Geralmente d�o aten��o a seus filhos.

--	EXPLORATORIA

--> Qual � o grupo que mais falta as aulas e quais raz�es podem influenciar na baixa frequ�ncia dos alunos?

-- Contagem de pessoas - 15.818
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias')

-- 2012
SELECT Sexo, Qnt_Flt_aula, COUNT(Regiao) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias')
GROUP BY Sexo, Qnt_Flt_aula
ORDER BY Sexo,  COUNT(Regiao) DESC

SELECT Regiao, Qnt_Flt_aula, COUNT(Regiao) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias')
GROUP BY Regiao, Qnt_Flt_aula
ORDER BY Regiao, COUNT(Regiao) DESC

--2015
SELECT Sexo, Qnt_Flt_aula, COUNT(Regiao) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias')
GROUP BY Sexo, Qnt_Flt_aula
ORDER BY Sexo,  COUNT(Regiao) DESC

SELECT Regiao, Qnt_Flt_aula, COUNT(Regiao) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias')
GROUP BY Regiao, Qnt_Flt_aula
ORDER BY Regiao, COUNT(Regiao) DESC

--Geral
SELECT Sexo, Qnt_Flt_aula, COUNT(Regiao) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias')
GROUP BY Sexo, Qnt_Flt_aula
ORDER BY Sexo,  COUNT(Regiao) DESC

SELECT Regiao, Qnt_Flt_aula, COUNT(Regiao) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias')
GROUP BY Regiao, Qnt_Flt_aula
ORDER BY Regiao, COUNT(Regiao) DESC

--	1.	H� um equilibrio na frequencia de falta em rela��o ao genero
--	2.	Nordeste, Sudeste e Norte apresentam os maiores indices de falta
--	3.	Centro-Oeste apresentou uma melhora significativa em rela��o ao indice de falta em rela��o a 2012.
--	4.	Nordeste apresentou uma piora quando comparado a 2012.
--	5.	Centro-Oeste e Sul no geral apresentam os menores indices, por�m � v�lido lembrar que s�o as regi�es com o menor numero de 
--		respondentes



--> Analisando os grupos que mais faltam as aulas, qual a frequencia de aten��o que os pais d�o aos filhos?

-- Contagem de pessoas - 10.356
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')

-- 2012
SELECT Sexo, Frq_pais_pbl_pcp, COUNT(Frq_pais_pbl_pcp) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias')
GROUP BY Sexo, Frq_pais_pbl_pcp
ORDER BY Sexo, COUNT(Frq_pais_pbl_pcp) DESC

SELECT Regiao, Frq_pais_pbl_pcp, COUNT(Frq_pais_pbl_pcp) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias')
GROUP BY Regiao, Frq_pais_pbl_pcp
ORDER BY Regiao, COUNT(Frq_pais_pbl_pcp) DESC

--2015
SELECT Sexo, Frq_pais_pbl_pcp, COUNT(Frq_pais_pbl_pcp) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias')
GROUP BY Sexo, Frq_pais_pbl_pcp
ORDER BY Sexo, COUNT(Frq_pais_pbl_pcp) DESC

SELECT Regiao, Frq_pais_pbl_pcp, COUNT(Frq_pais_pbl_pcp) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias')
GROUP BY Regiao, Frq_pais_pbl_pcp
ORDER BY Regiao, COUNT(Frq_pais_pbl_pcp) DESC

--Geral
SELECT Sexo, Frq_pais_pbl_pcp, COUNT(Frq_pais_pbl_pcp) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias')
GROUP BY Sexo, Frq_pais_pbl_pcp
ORDER BY Sexo, COUNT(Frq_pais_pbl_pcp) DESC

SELECT Regiao, Frq_pais_pbl_pcp, COUNT(Frq_pais_pbl_pcp) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias')
GROUP BY Regiao, Frq_pais_pbl_pcp
ORDER BY Regiao, COUNT(Frq_pais_pbl_pcp) DESC

--	1.	Percebe-se que o p�blico feminino apresenta o maior �ndice de "Nunca" e "Raramente" em rela��o a frquencia de preocupa��o dos pais.
--	2.	Existe um certo equil�bro entre "Nunca" e "�s vezes", ambos levantam suspeita.
--	3.	Nordeste e Sudeste e Norte s�o as regi�es com os maiores �ndices de despreocupa��o por parte dos pais.
--	4.	Os dados apontam que aproximadamente 70% dos alunos que mais faltam possuem uma certa car�ncia de aten��o por seus problemas por
--		parte de seus pais
-->	O p�blico feminino tende a ter mais preocupa��o que o masculino?
--> O bullying pode levar um certo p�blico atacado a faltar a aula sem concentimento dos pais?

--> Em rela��o ao p�blico que mais falta, e que os pais apresentam o maior indice de despreocupa��o, checar se sofreram bullyng.

-- Contagem de pessoas - 4.780
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')

-- Contagem do grupo investigado 2012- 2.136
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')

-- Contagem do grupo investigado 2015 - 2.644
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')

-- Contagem de pessoas 2015 - 4.780
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')

--2012
SELECT Sexo, Frq_clg_mal, COUNT(Frq_clg_mal) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
GROUP BY Sexo, Frq_clg_mal
ORDER BY Sexo, COUNT(Frq_clg_mal) DESC

SELECT Regiao, Frq_clg_mal, COUNT(Frq_clg_mal) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
GROUP BY Regiao, Frq_clg_mal
ORDER BY Regiao, COUNT(Frq_clg_mal) DESC

--2015
SELECT Sexo, Frq_clg_mal, COUNT(Frq_clg_mal) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
GROUP BY Sexo, Frq_clg_mal
ORDER BY Sexo, COUNT(Frq_clg_mal) DESC

SELECT Regiao, Frq_clg_mal, COUNT(Frq_clg_mal) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
GROUP BY Regiao, Frq_clg_mal
ORDER BY Regiao, COUNT(Frq_clg_mal) DESC

--Geral
SELECT Sexo, Frq_clg_mal, COUNT(Frq_clg_mal) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
GROUP BY Sexo, Frq_clg_mal
ORDER BY Sexo, COUNT(Frq_clg_mal) DESC

SELECT Regiao, Frq_clg_mal, COUNT(Frq_clg_mal) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
GROUP BY Regiao, Frq_clg_mal
ORDER BY Regiao, COUNT(Frq_clg_mal) DESC

--	1.	Em 2012 a regi�o Sudeste era a pior classificada, por�m cedeu o espa�o ao piora do Nordeste em 2015
--	2.	Em 2015 a regi�o Nordeste se tornou o maior �ndice e com aumento do genero masculino em rela��o aos ataques.
--	3.	Em 2015 a regi�o Norte apresentou expressiva piora em rela��o aos ataques de bully.
--	4.	A maioria dos que sofrem bullying apontam ser algo que ocorre "�s vezes" e "Raramente", por�m levantam suspeita.
--	5.	Os casos de ataque de bullying relacionados ao grupo investigado aumentaram aproximadamente 25% em rela��o a 2012.
--	6.	Os dados mostram que nao � comum a pr�tica do bully por parte dos colegas, por�m quando observamos o grupo espec�fico vemos
--		que aproximadamente metade dos alunos que faltam e n�o possuem certa aten��o por parte dos pais sofrem bullying.

-->	O p�blico feminino tende a ter mais preocupa��o que o masculino?
-->	O bullying pode levar um certo p�blico atacado a faltar a aula sem concentimento dos pais?

--> No grupo investigado, quais seriam os motivos que levam ao agressor praticar bullying contra alguem?

-- Mesma contagem anterior 4.780

--2012
SELECT Sexo, Mtv_clg_mal, COUNT(Mtv_clg_mal) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Sexo, Mtv_clg_mal
ORDER BY Sexo, COUNT(Mtv_clg_mal) DESC

SELECT Regiao, Mtv_clg_mal, COUNT(Mtv_clg_mal) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Regiao, Mtv_clg_mal
ORDER BY Regiao, COUNT(Mtv_clg_mal) DESC

--2015
SELECT Sexo, Mtv_clg_mal, COUNT(Mtv_clg_mal) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Sexo, Mtv_clg_mal
ORDER BY Sexo, COUNT(Mtv_clg_mal) DESC

SELECT Regiao, Mtv_clg_mal, COUNT(Mtv_clg_mal) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Regiao, Mtv_clg_mal
ORDER BY Regiao, COUNT(Mtv_clg_mal) DESC

--Geral
SELECT Sexo, Mtv_clg_mal, COUNT(Mtv_clg_mal) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Sexo, Mtv_clg_mal
ORDER BY Sexo, COUNT(Mtv_clg_mal) DESC

SELECT Regiao, Mtv_clg_mal, COUNT(Mtv_clg_mal) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Regiao, Mtv_clg_mal
ORDER BY Regiao, COUNT(Mtv_clg_mal) DESC

--	1.	Como investigado anteriormente, existe uma quantidade elevada de motivos ocultos que levam alguem a praticar o bully. O que 
--		pode abrir espa�o para uma nova investiga��o.
-->	O bullying pode levar um certo p�blico atacado a faltar a aula sem concentimento dos pais?
--	2.	Em geral a apar�ncia do rosto e corpo s�o os principais motivos, uma vez que exista um �ndice alto de faltas e car�ncia de aten��o
--		por parte dos pais, � prov�vel que essa situa��o perdure ou at� fique pior. Uma poss�vel hip�tese � a de que o aluno esteja faltando 
--		para fugir do desconforto dos ataques e a falta de aten��o dos pais colabora para que o caso n�o seja resolvido.
--	3.	Motivos de alta aten��o como cor da pele e religi�o e orienta��o sexual s�o os de menor �ndice.
--	4. Homens sofrem mais ataques devido a apar�ncia do rosto, enquanto que as mulheres sofrem mais ataques devido a apar�ncia do corpo.

-->	O p�blico feminino tende a ter mais preocupa��o que o masculino?

--> No grupo investigado que sofre bully, houve agress�o f�sica?

-- Contagem de pessoas - 1.854
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Sfr_agrs_fis IN ('1 vez', '2 a 3 vezes','4 a 5 vezes','6 a 7 vezes','8 a 9 vezes','10 a 11 vezes','12 ou mais')

-- Contagem do grupo investigado 2012 - 838
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Sfr_agrs_fis IN ('1 vez', '2 a 3 vezes','4 a 5 vezes','6 a 7 vezes','8 a 9 vezes','10 a 11 vezes','12 ou mais')

-- Contagem do grupo investigado 2015 - 1.016
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Sfr_agrs_fis IN ('1 vez', '2 a 3 vezes','4 a 5 vezes','6 a 7 vezes','8 a 9 vezes','10 a 11 vezes','12 ou mais')

--2012
SELECT Sexo, Sfr_agrs_fis, COUNT(Sfr_agrs_fis) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Sexo, Sfr_agrs_fis
ORDER BY Sexo, COUNT(Sfr_agrs_fis) DESC

SELECT Regiao, Sfr_agrs_fis, COUNT(Sfr_agrs_fis) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Regiao, Sfr_agrs_fis
ORDER BY Regiao, COUNT(Sfr_agrs_fis) DESC

--2015
SELECT Sexo, Sfr_agrs_fis, COUNT(Sfr_agrs_fis) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Sexo, Sfr_agrs_fis
ORDER BY Sexo, COUNT(Sfr_agrs_fis) DESC

SELECT Regiao, Sfr_agrs_fis, COUNT(Sfr_agrs_fis) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Regiao, Sfr_agrs_fis
ORDER BY Regiao, COUNT(Sfr_agrs_fis) DESC

--Geral
SELECT Sexo, Sfr_agrs_fis, COUNT(Sfr_agrs_fis) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Sexo, Sfr_agrs_fis
ORDER BY Sexo, COUNT(Sfr_agrs_fis) DESC

SELECT Regiao, Sfr_agrs_fis, COUNT(Sfr_agrs_fis) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Regiao, Sfr_agrs_fis
ORDER BY Regiao, COUNT(Sfr_agrs_fis) DESC

--	1.	Em 2012 o Sudeste apresentou um elevado �ndice para "12 ou mais casos" de agress�o contra homens.
--	2.	Em 2015 o Nordeste apresentou tamb�m um elevado �ndice para "12 ou mais casos" contra mulheres o que � muito preocupante.
-->	O bullying pode levar um certo p�blico atacado a faltar a aula sem concentimento dos pais?
--	3.	Em geral aproximadamente 40% das pessoas que sofrem bully foram agredidas fisicamente ao menos uma vez. Esta raz�o pode ser 
--		determinante para que os estudantes n�o queiram ir a escola e faltem sem o consentimento dos pais.
--	4.	Houve um aumento de mais de 20% nos casos de agress�o f�sica no grupo investigado.
--	5.	Para o grupo investigado, das pessoas que sofrem agress�o, 40% ser�o agredidas pelo menos 5 vezes no per�odo de um ano.

-->	O p�blico feminino tende a ter mais preocupa��o que o masculino?

-->	No grupo investigado que sofre bully, que sofreu agress�o f�sica, com que frequencia dormem com preocupa��o?

-- Contagem de pessoas - 1.089
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Sfr_agrs_fis IN ('1 vez', '2 a 3 vezes','4 a 5 vezes','6 a 7 vezes','8 a 9 vezes','10 a 11 vezes','12 ou mais')
				   AND Frq_drm_prp IN ('Sempre', 'Na maior parte do tempo', '�s vezes')
--2012
SELECT Sexo, Frq_drm_prp, COUNT(Frq_drm_prp) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Sfr_agrs_fis IN ('1 vez', '2 a 3 vezes','4 a 5 vezes','6 a 7 vezes','8 a 9 vezes','10 a 11 vezes','12 ou mais')
GROUP BY Sexo, Frq_drm_prp
ORDER BY Sexo, COUNT(Frq_drm_prp) DESC

SELECT Regiao, Frq_drm_prp, COUNT(Frq_drm_prp) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Sfr_agrs_fis IN ('1 vez', '2 a 3 vezes','4 a 5 vezes','6 a 7 vezes','8 a 9 vezes','10 a 11 vezes','12 ou mais')
GROUP BY Regiao, Frq_drm_prp
ORDER BY Regiao, COUNT(Frq_drm_prp) DESC

--2015
SELECT Sexo, Frq_drm_prp, COUNT(Frq_drm_prp) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Sfr_agrs_fis IN ('1 vez', '2 a 3 vezes','4 a 5 vezes','6 a 7 vezes','8 a 9 vezes','10 a 11 vezes','12 ou mais')
GROUP BY Sexo, Frq_drm_prp
ORDER BY Sexo, COUNT(Frq_drm_prp) DESC

SELECT Regiao, Frq_drm_prp, COUNT(Frq_drm_prp) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Sfr_agrs_fis IN ('1 vez', '2 a 3 vezes','4 a 5 vezes','6 a 7 vezes','8 a 9 vezes','10 a 11 vezes','12 ou mais')
GROUP BY Regiao, Frq_drm_prp
ORDER BY Regiao, COUNT(Frq_drm_prp) DESC

--Geral
SELECT Sexo, Frq_drm_prp, COUNT(Frq_drm_prp) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Sfr_agrs_fis IN ('1 vez', '2 a 3 vezes','4 a 5 vezes','6 a 7 vezes','8 a 9 vezes','10 a 11 vezes','12 ou mais')
GROUP BY Sexo, Frq_drm_prp
ORDER BY Sexo, COUNT(Frq_drm_prp) DESC

SELECT Regiao, Frq_drm_prp, COUNT(Frq_drm_prp) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Sfr_agrs_fis IN ('1 vez', '2 a 3 vezes','4 a 5 vezes','6 a 7 vezes','8 a 9 vezes','10 a 11 vezes','12 ou mais')
GROUP BY Regiao, Frq_drm_prp
ORDER BY Regiao, COUNT(Frq_drm_prp) DESC

--	1.	6 em cada 10 estudantes do grupo investigado ter�o dificuldades para dormir devido os ataques;
-->	O p�blico feminino tende a ter mais preocupa��o que o masculino?
--	2.	O p�blico feminino apresenta maior dificuldade para dormir que o masculino no sentido acima. Isto pode gerar em casos como este
--		maior necessidade de aten��o do estudante por seus pais, e tamb�m aumento no n�mero de faltas.
--	3.	Os casos de sono prejudicado aumentou mais de 25% em rela��o a 2012 para o grupo investigado.

--> Em rela��o ao grupo investigado que sofre bully, qual o �ndice de solid�o?

-- Contagem de pessoas - 3.027
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Frq_soz IN ('Sempre', 'Na maior parte do tempo', '�s vezes')

-- Contagem do grupo investigado 2012 - 1.327
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Frq_soz IN ('Sempre', 'Na maior parte do tempo', '�s vezes')

-- Contagem do grupo investigado 2015 - 1.700
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Frq_soz IN ('Sempre', 'Na maior parte do tempo', '�s vezes')

--2012
SELECT Sexo, Frq_soz, COUNT(Frq_soz) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Sexo, Frq_soz
ORDER BY Sexo, COUNT(Frq_soz) DESC

SELECT Regiao, Frq_soz, COUNT(Frq_soz) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Regiao, Frq_soz
ORDER BY Regiao, COUNT(Frq_soz) DESC

--2015
SELECT Sexo, Frq_soz, COUNT(Frq_soz) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Sexo, Frq_soz
ORDER BY Sexo, COUNT(Frq_soz) DESC

SELECT Regiao, Frq_soz, COUNT(Frq_soz) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Regiao, Frq_soz
ORDER BY Regiao, COUNT(Frq_soz) DESC

--Geral
SELECT Sexo, Frq_soz, COUNT(Frq_soz) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Sexo, Frq_soz
ORDER BY Sexo, COUNT(Frq_soz) DESC

SELECT Regiao, Frq_soz, COUNT(Frq_soz) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
GROUP BY Regiao, Frq_soz
ORDER BY Regiao, COUNT(Frq_soz) DESC

--	1.	Em 2012 o Centro-Oeste apresentou algo antagonico. A grande maioria do publico masculino n�o se sente sozinho "Nunca", enquanto que
--		a grande maioria do feminino sente-se sozinha "Sempre".
--	2.	Em geral o p�blico feminino sente-se mais solit�rio que o masculino. A grande parte na frequ�ncia "Sempre" e "Na maior parte
--		do tempo. 
--	3.	6 em cada 10 pessoas no grupo v�o se sentir s�. Um aumento de aproximadamente 25% em rela��o � 2012.

--> Para o p�blico investigado, e analizando quem se sente sozinho(a), qual a quantidade de amigos?

-- Contagem de pessoas - 823
SELECT COUNT(Sexo) as total FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Frq_soz IN ('Sempre', 'Na maior parte do tempo', '�s vezes')
				   AND Qnt_amgs IN ('1 amigo','2 amigos')
--2012
SELECT Sexo, Qnt_amgs, COUNT(Qnt_amgs) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Frq_soz IN ('Sempre', 'Na maior parte do tempo', '�s vezes')
GROUP BY Sexo, Qnt_amgs
ORDER BY Sexo, COUNT(Qnt_amgs) DESC

SELECT Regiao, Qnt_amgs, COUNT(Qnt_amgs) AS cnt FROM alunos_geral
WHERE Ano = '2012' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Frq_soz IN ('Sempre', 'Na maior parte do tempo', '�s vezes')
GROUP BY Regiao, Qnt_amgs
ORDER BY Regiao, COUNT(Qnt_amgs) DESC

--2015
SELECT Sexo, Qnt_amgs, COUNT(Qnt_amgs) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Frq_soz IN ('Sempre', 'Na maior parte do tempo', '�s vezes')
GROUP BY Sexo, Qnt_amgs
ORDER BY Sexo, COUNT(Qnt_amgs) DESC

SELECT Regiao, Qnt_amgs, COUNT(Qnt_amgs) AS cnt FROM alunos_geral
WHERE Ano = '2015' AND Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Frq_soz IN ('Sempre', 'Na maior parte do tempo', '�s vezes')
GROUP BY Regiao, Qnt_amgs
ORDER BY Regiao, COUNT(Qnt_amgs) DESC


--Geral
SELECT Sexo, Qnt_amgs, COUNT(Qnt_amgs) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Frq_soz IN ('Sempre', 'Na maior parte do tempo', '�s vezes')
GROUP BY Sexo, Qnt_amgs
ORDER BY Sexo, COUNT(Qnt_amgs) DESC

SELECT Regiao, Qnt_amgs, COUNT(Qnt_amgs) AS cnt FROM alunos_geral
WHERE Qnt_Flt_aula IN ('10 ou mais dias','6 a 9 dias', '3 a 5 dias') AND Frq_pais_pbl_pcp IN ('Nunca','�s vezes','Raramente')
				   AND Frq_clg_mal IN ('Sempre', 'Na maior parte do tempo', '�s vezes', 'Raramente')
				   AND Frq_soz IN ('Sempre', 'Na maior parte do tempo', '�s vezes')
GROUP BY Regiao, Qnt_amgs
ORDER BY Regiao, COUNT(Qnt_amgs) DESC

--	1.	Os dados apontam que 1/4 do grupo estudado tem menos de 3 amigos.
--	2.	Mesmo com o sentimento de solid�o, os jovens possuem em maioria 3 ou mais amigos. O sentimento de solid�o pode estar ligado a
--		car�ncia familiar dos pais.
--	3.	O p�blico que sente-se solit�rio n�o decorre da falta excessiva de amigos, direcionando a causa para algo mais familiar
--	4.	Mais de 60% do grupo que possui menos de 3 amigos s�o mulheres.

-->	O que leva os pais a darem mais ou menos aten��o a seus filhos?

-- CONCLUS�O

-- Foi investigado um grupo de estudantes que possui elevado �ndice de faltas, e a partir desta causa foi analizado uma s�rie de fatores
-- que poderiam influenciar no comportamento deste grupo. Os dados sugerem que quanto menos aten��o os filhos sentem receber de seus pais, 
-- maior o �ndice de faltas, uma vez que o grupo com a menor frequ�ncia escolar apresentou predominantemente a resposta "Nunca" para a 
-- seguinte pergunta: "NOS �LTIMOS 30 DIAS, com que frequ�ncia seus pais ou respons�veis entenderam seus problemas e preocupa��es?".
-- O p�blico feminino foi o mais afetado com essa car�ncia, enquanto que o masculino foi menos afetado. Isso abre portas para uma nova 
-- investiga��o sobre-"Porqu� o p�blico feminino sente mais essa aus�ncia de preocupa��o dos pais do que o masculino?" Acredito que
-- pelas condi��es impostas pela sociedade a respeito da inseguran�a da mulher (Luiza Flanco, 2019). link:https://www.bbc.com/portuguese/brasil-47365503
-- � um caminho para que pode fundamentar algumas respostas e fomentar novas pesquisas com os estudantes. Al�m disso tamb�m �
-- importante entender-"O que leva os pais a darem menos aten��o aos seus filhos?".
-- As regi�es mais populosas como Nordeste, Norte e Sudeste apresentaram os �ndices mais preocupantes, e foi poss�vel identificar uma melhora 
-- significativa na regi�o Centro-Oeste de 2012 para 2015 em rela��o aos atributos investigados na pesquisa, bem como no �ndice de faltas 
-- apresentado.
-- Por fim os casos de bullying demonstram ter sua participa��o no elevado �ndice de faltas no grupo investigado, em paralelo a isso a
-- aus�ncia dos pais em rela��o aos problemas dos filhos podem agravar esta situa��o ainda mais. Observou-se al�m da baixa frequ�ncia escolar
-- o incremento, em rela��o a 2012, da dificuldade para dormir e no sentimento de solid�o, principalmente por parte do p�blico feminino.
