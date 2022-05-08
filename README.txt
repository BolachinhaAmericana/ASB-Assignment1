PT - PT 

Este Trabalho foi proposto pelo docente Francisco Pina Martins e feito no ambito da UC: Análise de Sequencias Biológicas no segundo ano, segundo semestre da Licenciatura em Bioinformática na Escola Superior de Tecnologia do Barreiro, do Instituto Politécnico de Setúbal, em Maio de 2022.

Este repositório não é o trabalho completo mas sim a parte do mesmo que me foi designada.
Tudo o publicado aqui é autoria de: Duarte Valente


PT-PT

Este ficheiro é o README para que seja possivel obter as árvores filogenéticas e seguir para a sua análise sem quaisquer problemas.

1 - Executar o script "prepScript.sh".
	Este ficheiro vai criar uma pasta "sequencesVMPY" no seu ambiente de trabalho.
	Dentro desta pasta vão estar outras seis pastas, é possivel verificar que apenas três das seis teem ficheiros. 
2 - As pastas não vazias deverão ser as seguintes: "mitochondrial", "nuclear" e "total".
	Este é o unico passo que deverá ser executado pelo utilisador. 
	2.1 - Execute o software MegaX
	2.2 - No seu GUI selecione, na aba "DATA", a segunda opção: "Concatenate Sequence Alignments"
	2.3 - Após clicar, irá abrir uma janela onde deverá navegar até à pasta criada inicialmente: "sequencesVMPY" e selecionar primeiramente a pasta "mitochondrial". Deverá então abrir os dados e exportar em formato FASTA para a pasta "concSeqs" dentro da "sequences.BMPY" e dar-lhe o nome de "mitoConc.fas".
	2.4 - Terá de repetir este processo para as pastas "nuclear" e "total".
	No final a pasta "concSeqs" deverá ter três ficheiros, sendo estes o "mitoConc.fas", o "nucConc.fas" e o "totalConc.fas"
	
No Caso de não cumprir este passo devidamente o passo seguinte irá dar o seguinte erro: 
Error: File Does not Exist!
Please check README.txt for more information.

3 - Agora que temos as sequências concatenadas, no seu devido diretório e com um nome adequado, podemos executar o segundo script, "mainScript.sh" 

Se tudo foi seguido corretamente bastará apenas aguardar que as árvores terminem. É necessário ter em conta que a primeira árvore deverá ser correspondente aos genes mitocondriais, a segundo aos genes nucleares e a terceira aos genes totais e que a seguinte só irá abrir quando a primeira for fechada.


ENG

This file is the README so that it is possible to obtain the phylogenetic trees and proceed to their analysis without any problems.

1 - Run the "prepScript.sh" script.
	This file will create a "sequencesVMPY" folder on your desktop.
	Within this folder will be six other folders, it is possible to verify that only three of the six have files.

2 - The non-empty folders must be the following: "mitochondrial", "nuclear" and "total".
	This is the only step that must be performed by the user.
	2.1 - Run the MegaX software
	2.2 - In your GUI select, in the "DATA" tab, the second option: "Concatenate Sequence Alignments"
	2.3 - After clicking, a window will open where you must navigate to the folder created initially: "sequencesVMPY". First select the folder "mitochondrial". You should then open the data and export it in FASTA format to the "concSeqs" folder inside "sequences.BMPY" and name it "mitoConc.fas".
	2.4 - You will have to repeat this process for the "nuclear" and "total" folders.
	At the end the "concSeqs" folder should have three files, these being "mitoConc.fas", "nucConc.fas" and "totalConc.fas"
	
If you do not follow this step properly, the next step will give the following error:
Error: File Does not Exist!
Please check README.txt for more information.


3 - Now that we have the strings concatenated, in their proper directory and with a proper name, we can run the second script, "mainScript.sh"


If everything was followed correctly, just wait for the trees to finish. It is necessary to bear in mind that the first tree should correspond to the mitochondrial genes, the second to the nuclear genes and the third to the total genes, and that the next tree will only open when the  one before it is closed.
