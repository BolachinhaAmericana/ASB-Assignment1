#!/bin/bash

checkDir(){ # Este metodo serve para verificar se a pasta na qual as sequencias vao ser guardadas existe.
if [ -d ~/Desktop/sequencesVMPY ]; then
	echo Directory Exists
else
	echo Directory Does not Exist
	echo Creating Directory "sequencesVMPY" in Desktop
	mkdir ~/Desktop/sequencesVMPY
	mkdir ~/Desktop/sequencesVMPY/mitochondrial
	mkdir ~/Desktop/sequencesVMPY/nuclear
	mkdir ~/Desktop/sequencesVMPY/total
	mkdir ~/Desktop/sequencesVMPY/concSeqs
	mkdir ~/Desktop/sequencesVMPY/nexSeqs
	mkdir ~/Desktop/sequencesVMPY/trees
fi
return
}
checkDir

getWebEnv(){ # Este metodo serve para conseguirmos o web Env para a pesquisa
	Wenv=$(wget https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi\?db\=nucleotide\&term\="$term"\&usehistory\=y\&retmax=100 -O - |grep -i "<WebEnv>"|sed 's/<[^<>]*>//g'|sed 's/.*_//') #| sed 's/[^0-9]//g'
	echo MCID_$Wenv # > /home/valente/Desktop/ASB
	return
}

getQueryKey(){ # Este metodo serve para conseguirmos a query key para a pesquisa
	QKey=$(wget https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi\?db\=nucleotide\&term\="$term"\&usehistory\=y\&retmax=100 -O - |grep -i "<QueryKey>"|sed 's/<[^<>]*>//g'|sed 's/_*.//'|sed 's/M.*//'|rev |sed -r 's/(.{1}).*/\1/'|rev)
	echo $QKey # > /home/valente/Desktop/ASB
	return
}


getFasta(){ # Este metodo serve para nos dar o ficheiro .fas que precisamos.
	eFetch=$(wget https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi/\?db\=nucleotide\&usehistory\=y\&query_key\=$queryKey\&WebEnv\=$webEnv\&rettype\=fasta -O ~/sequence.fas)
	echo $eFetch
	return
}


filtro(){ #filtrar coisas gerais sobre os scripts usados neste trabalho e seleciona o ficheiro input para começar a cadeia de filtros. neste caso, o ficheiro sequence.fas na Home.
	sed 's/>.*\.1 />/' ~/sequence.fas > ~/result1
	sed 's/voucher.*//' ~/result1 > ~/result2
	return
	}

filtherCYTB(){ #filtrar coisas específicas para o gene em causa
	sed 's/cytochrome.*//' ~/result2 > ~/result1
	sed 's/cytochrome.*//' ~/result1 > ~/result2
	mv ~/result2 ~/sequence.fas #selecionar ficheiro para o output total. Neste caso o ficheiro sequence.fas
	rm ~/result1 # eliminar junk-files.
	return
	}

filtherND4(){ #filtrar coisas específicas para o gene em causa
	sed 's/NAD.*//' ~/result2 > ~/result1
	sed 's/piRNA.*//' ~/result1 > ~/result2
	mv ~/result2 ~/sequence.fas #selecionar ficheiro para o output total. Neste caso o ficheiro sequence.fas
	rm ~/result1 # eliminar junk-files.
	return
	}

filtherNGFB(){ #filtrar coisas específicas para o gene em causa
	sed 's/nerve.*//' ~/result2 > ~/result1
	sed 's/vimentin.*//' ~/result1 > ~/result2
	mv ~/result2 ~/sequence.fas #selecionar ficheiro para o output total. Neste caso o ficheiro sequence.fas
	rm ~/result1 # eliminar junk-files.
	return
	}

filtherETS(){ #filtrar coisas específicas para o gene em causa
	sed 's/ETS.*//' ~/result2 > ~/result1
	sed 's/vimentin.*//' ~/result1 > ~/result2
	mv ~/result2 ~/sequence.fas #selecionar ficheiro para o output total. Neste caso o ficheiro sequence.fas
	rm ~/result1 # eliminar junk-files.
	return
	}

filtherGAPD(){ #filtrar coisas específicas para o gene em causa
	sed 's/glyceraldehyde.*//' ~/result2 > ~/result1
	sed 's/vimentin.*//' ~/result1 > ~/result2
	mv ~/result2 ~/sequence.fas #selecionar ficheiro para o output total. Neste caso o ficheiro sequence.fas
	rm ~/result1 # eliminar junk-files.
	return
	}

filtherODC(){ #filtrar coisas específicas para o gene em causa
	sed 's/ornithine.*//' ~/result2 > ~/result1
	sed 's/vimentin.*//' ~/result1 > ~/result2	
	mv ~/result2 ~/sequence.fas #selecionar ficheiro para o output total. Neste caso o ficheiro sequence.fas
	rm ~/result1 # eliminar junk-files.
	return
	}
	
filtherR35(){ #filtrar coisas específicas para o gene em causa
	sed 's/RNA.*//' ~/result2 > ~/result1
	sed 's/isonale.*//' ~/result1 > ~/result2
	mv ~/result2 ~/sequence.fas #selecionar ficheiro para o output total. Neste caso o ficheiro sequence.fas
	rm ~/result1 # eliminar junk-files.		
	return
	}


filtherVim(){ #filtrar coisas específicas para o gene em causa
	sed 's/vimentin.*//' ~/result2 > ~/result1
	sed 's/vimentin.*//' ~/result1 > ~/result2
	mv ~/result2 ~/sequence.fas #selecionar ficheiro para o output total. Neste caso o ficheiro sequence.fas
	rm ~/result1 # eliminar junk-files.
	return
	}


cytb(){ # Este metodo vai buscar a nossa sequencia especifica do gene cytb
	term="AF258867, DQ646417, AF258870, AF258877, AF258869, AF258868, AF258876, AF258875, GQ896190, GQ896191, GQ896192, GQ896193, GQ896194, GQ896195, GQ896196, GQ896197, GQ896198, GQ896199, GQ896200, L28779, GQ896201, EU909384, EU909383, EU909385, EU909386, GQ896202, AF258871, AF258872, AF258873, AF258874, GQ896204, AF207750, EU909388, EU909387, GQ896188, GQ896189"
	history=$(getHistory "$term")
	webEnv=$(getWebEnv "$term")
	queryKey=$(getQueryKey "$term")
	fasta=$(getFasta "$term") #creates the sequence.fasta file.
	filtro # executa os metodos definidos anteriormente
	filtherCYTB
	mafft ~/sequence.fas > ~/Desktop/sequencesVMPY/mitochondrial/cytb.fas # Alinha a sequencia
	rm ~/sequence.fas
	cp ~/Desktop/sequencesVMPY/mitochondrial/cytb.fas ~/Desktop/sequencesVMPY/total/cytb.fas # remove junkFiles e mete as determinadas sequencias nas pastas correspondentes
	return
}

ND4(){ # Este metodo vai buscar a nossa sequencia especifica do gene ND4
	term="AF258855, DQ646419, AF258858, AF258865, AF258857, AF258856, AF258864, AF258863, EU909370, EU909369, EU909371, EU909372, EU909373, DQ646420, EU909374, DQ646421, EU909375, EU909376, EU909377, DQ626642, GQ895900, DQ646423, DQ646424, EU909379, EU909378, EU909380, GQ895901, GQ895902, AF258859, AF258860, AF258861, AF258862, DQ661019, GQ895903, EU909381, EU909382, GQ895899"
	history=$(getHistory "$term")
	webEnv=$(getWebEnv "$term")
	queryKey=$(getQueryKey "$term")
	fasta=$(getFasta "$term") #creates the sequence.fasta file.
	filtro # executa os metodos definidos anteriormente
	filtherND4
	mafft ~/sequence.fas > ~/Desktop/sequencesVMPY/mitochondrial/ND4.fas # Alinha a sequencia
	rm ~/sequence.fas
	cp ~/Desktop/sequencesVMPY/mitochondrial/ND4.fas ~/Desktop/sequencesVMPY/total/ND4.fas # remove junkFiles e mete as determinadas sequencias nas pastas correspondentes
	return
}

NGFB(){
	term="GQ896037, GQ896038, GQ896039, GQ896040, GQ896041, GQ896042, GQ896043, GQ896044, GQ896045, GQ896046, GQ896047, GQ896048, GQ896049, GQ896050, GQ896051, GQ896052, GQ896053, GQ896054, GQ896055, GQ896056, GQ896057, GQ896058, GQ896059, GQ896060, GQ896061, GQ896062, GQ896063, GQ896064, GQ896065, GQ896066, GQ896067, GQ896068, GQ896069, GQ896070, GQ896071, GQ896072, GQ896036"
	history=$(getHistory "$term")
	webEnv=$(getWebEnv "$term")
	queryKey=$(getQueryKey "$term")
	fasta=$(getFasta "$term") #creates the sequence.fasta file.
	filtro # executa os metodos definidos anteriormente
	filtherNGFB
	mafft ~/sequence.fas > ~/Desktop/sequencesVMPY/nuclear/NGFB.fas # Alinha a sequencia
	rm ~/sequence.fas
	cp ~/Desktop/sequencesVMPY/nuclear/NGFB.fas ~/Desktop/sequencesVMPY/total/NGFB.fas # remove junkFiles e mete as determinadas sequencias nas pastas correspondentes
	return
}

ETS(){
	term="GQ895904, GQ895905, GQ895906, GQ895907, GQ895908, GQ895909, GQ895910, GQ895911, GQ895912, GQ895913, GQ895914, GQ895915, GQ895916, GQ895917, GQ895918, GQ895919, GQ895920, GQ895921, GQ895922, GQ895923, GQ895924, GQ895925, GQ895926, GQ895927, GQ895928, GQ895929, GQ895930, GQ895931, GQ895932, GQ895933"
	history=$(getHistory "$term")
	webEnv=$(getWebEnv "$term")
	queryKey=$(getQueryKey "$term")
	fasta=$(getFasta "$term") #creates the sequence.fasta file.
	filtro # executa os metodos definidos anteriormente
	filtherETS
	mafft ~/sequence.fas > ~/Desktop/sequencesVMPY/nuclear/ETS.fas # Alinha a sequencia
	rm ~/sequence.fas
	cp ~/Desktop/sequencesVMPY/nuclear/ETS.fas ~/Desktop/sequencesVMPY/total/ETS.fas # remove junkFiles e mete as determinadas sequencias nas pastas correspondentes
	return
}

GAPD(){
	term="GQ896111, GQ896112, GQ896113, GQ896114, GQ896115, GQ896116, GQ896117, GQ896118, GQ896119, GQ896120, GQ896121, GQ896122, GQ896123, GQ896124, GQ896125, GQ896126, GQ896127, GQ896128, GQ896129, GQ896130, GQ896131, GQ896132, GQ896133, GQ896134, GQ896135, GQ896136, GQ896137, GQ896138, GQ896139, GQ896140, GQ896141, GQ896142, GQ896143, GQ896144, GQ896145, GQ896146, GQ896147, GQ896110"
	history=$(getHistory "$term")
	webEnv=$(getWebEnv "$term")
	queryKey=$(getQueryKey "$term")
	fasta=$(getFasta "$term") #creates the sequence.fasta file.
	filtro # executa os metodos definidos anteriormente
	filtherGAPD
	mafft ~/sequence.fas > ~/Desktop/sequencesVMPY/nuclear/GAPD.fas # Alinha a sequencia
	rm ~/sequence.fas
	cp ~/Desktop/sequencesVMPY/nuclear/GAPD.fas ~/Desktop/sequencesVMPY/total/GAPD.fas # remove junkFiles e mete as determinadas sequencias nas pastas correspondentes
	return
}

ODC(){
	term="GQ895975, GQ895976, GQ895977, GQ895978, GQ895979, GQ895980, GQ895981, GQ895982, GQ895983, GQ895984, GQ895985, GQ895986, GQ895987, GQ895988, GQ895989, GQ895990, GQ895991, GQ895992, GQ895993, GQ895994, GQ895995, GQ895996, GQ895997, GQ895998, GQ895999, GQ896000, GQ896001, GQ896002, GQ896003, GQ895974"
	history=$(getHistory "$term")
	webEnv=$(getWebEnv "$term")
	queryKey=$(getQueryKey "$term")
	fasta=$(getFasta "$term") #creates the sequence.fasta file.
	filtro # executa os metodos definidos anteriormente
	filtherODC
	mafft ~/sequence.fas > ~/Desktop/sequencesVMPY/nuclear/ODC.fas # Alinha a sequencia
	rm ~/sequence.fas
	cp ~/Desktop/sequencesVMPY/nuclear/ODC.fas ~/Desktop/sequencesVMPY/total/ODC.fas # remove junkFiles e mete as determinadas sequencias nas pastas correspondentes
	return
}

R35(){
	term="AY339631, DQ649454, DQ649461, DQ649455, DQ649462, GQ896241, DQ661020, GQ896242, DQ649456, DQ649457, GQ896243, GQ896244, GQ896245, EU169875, DQ649459, GQ896246, GQ896247, GQ896248, GQ896249, DQ649463, DQ649464, DQ649460, GQ896250, GQ896251, DQ386659, AY742463"
	history=$(getHistory "$term")
	webEnv=$(getWebEnv "$term")
	queryKey=$(getQueryKey "$term")
	fasta=$(getFasta "$term") #creates the sequence.fasta file.
	filtro # executa os metodos definidos anteriormente
	filtherR35
	mafft ~/sequence.fas > ~/Desktop/sequencesVMPY/nuclear/R35.fas # Alinha a sequencia
	rm ~/sequence.fas
	cp ~/Desktop/sequencesVMPY/nuclear/R35.fas ~/Desktop/sequencesVMPY/total/R35.fas # remove junkFiles e mete as determinadas sequencias nas pastas correspondentes
	return
}

Vim(){
	term="GQ896150, GQ896151, GQ896152, GQ896153, GQ896154, GQ896155, GQ896156, GQ896157, GQ896158, GQ896159 ,GQ896160 ,GQ896161, GQ896162, GQ896163, GQ896164, GQ896165, GQ896166, GQ896167, GQ896168, GQ896169, GQ896170, GQ896171, GQ896172, GQ896173, GQ896174, GQ896175, GQ896176, GQ896177, GQ896178, GQ896179, GQ896180, GQ896181, GQ896182, GQ896183, GQ896184, GQ896185, GQ896186, GQ896187, GQ896148, GQ896149"
	history=$(getHistory "$term")
	webEnv=$(getWebEnv "$term")
	queryKey=$(getQueryKey "$term")
	fasta=$(getFasta "$term") #creates the sequence.fasta file.
	filtro # executa os metodos definidos anteriormente
	filtherVim
	mafft ~/sequence.fas > ~/Desktop/sequencesVMPY/nuclear/Vim.fas # Alinha a sequencia
	rm ~/sequence.fas
	cp ~/Desktop/sequencesVMPY/nuclear/Vim.fas ~/Desktop/sequencesVMPY/total/Vim.fas # remove junkFiles e mete as determinadas sequencias nas pastas correspondentes
	return
}

# Executa todos os metodos dos genes, criando os ficheiros ja trabalhados.
cytb
ND4
NGFB
ETS
GAPD
ODC
R35
Vim
