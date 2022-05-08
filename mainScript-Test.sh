#!/bin/bash



checkFiles(){ # Este metodo serve para verificar se todos os ficheiros existem.
if [ -f ~/Desktop/sequencesVMPY/concSeqs/mitoConc.fas ] && [ -f ~/Desktop/sequencesVMPY/concSeqs/nucConc.fas ] && [ -f ~/Desktop/sequencesVMPY/concSeqs/totalConc.fas ]; then
	echo Directory Exists
else
	echo Error: File Does not Exist!
	echo Please check README.txt for more information.
	exit 0
fi
return
}

checkFiles

convert(){ # Este metodo vai criar os ficheiros .nex na pasta nexSeqs. Estes ficheiros sao a versao nexus convertida das sequencias concatenadas.
	seqmagick convert --output-format nexus --alphabet dna ~/Desktop/sequencesVMPY/concSeqs/mitoConc.fas ~/Desktop/sequencesVMPY/nexSeqs/mitoConc.nex
	seqmagick convert --output-format nexus --alphabet dna ~/Desktop/sequencesVMPY/concSeqs/nucConc.fas ~/Desktop/sequencesVMPY/nexSeqs/nucConc.nex
	seqmagick convert --output-format nexus --alphabet dna ~/Desktop/sequencesVMPY/concSeqs/totalConc.fas ~/Desktop/sequencesVMPY/nexSeqs/totalConc.nex
}
convert




mrBayesMito(){ # Este metodo vai dar o resultado da analise usando o mr bayes dos genes mitocondriais
echo begin mrbayes";" >> ~/Desktop/sequencesVMPY/nexSeqs/mitoConc.nex
echo   set autoclose=yes";" >> ~/Desktop/sequencesVMPY/nexSeqs/mitoConc.nex
echo   mcmcp ngen=100 printfreq=1000 samplefreq=100 diagnfreq=1000 nchains=4 savebrlens=yes filename=mitoTree";" >> ~/Desktop/sequencesVMPY/nexSeqs/mitoConc.nex
echo   mcmc";" >> ~/Desktop/sequencesVMPY/nexSeqs/mitoConc.nex
echo   sumt filename=mitoTree";" >> ~/Desktop/sequencesVMPY/nexSeqs/mitoConc.nex
echo end";" >> ~/Desktop/sequencesVMPY/nexSeqs/mitoConc.nex

mb /home/valente/Desktop/sequencesVMPY/nexSeqs/mitoConc.nex
mv mitoTree.con.tre ~/Desktop/sequencesVMPY/trees/mitoTree.con.tre
rm mitoTree.vstat
rm mitoTree.tstat
rm mitoTree.trprobs
rm mitoTree.run2.t
rm mitoTree.run2.p
rm mitoTree.run1.t
rm mitoTree.run1.p
rm mitoTree.parts
rm mitoTree.mcmc
return
}
mrBayesMito

mrBayesNuc(){ # Este metodo vai dar o resultado da analise usando o mr bayes dos genes nucleares
echo begin mrbayes";" >> ~/Desktop/sequencesVMPY/nexSeqs/nucConc.nex
echo   set autoclose=yes";" >> ~/Desktop/sequencesVMPY/nexSeqs/nucConc.nex
echo   mcmcp ngen=100 printfreq=1000 samplefreq=100 diagnfreq=1000 nchains=4 savebrlens=yes filename=nucTree";" >> ~/Desktop/sequencesVMPY/nexSeqs/nucConc.nex
echo   mcmc";" >> ~/Desktop/sequencesVMPY/nexSeqs/nucConc.nex
echo   sumt filename=nucTree";" >> ~/Desktop/sequencesVMPY/nexSeqs/nucConc.nex
echo end";" >> ~/Desktop/sequencesVMPY/nexSeqs/nucConc.nex

mb /home/valente/Desktop/sequencesVMPY/nexSeqs/nucConc.nex
mv nucTree.con.tre ~/Desktop/sequencesVMPY/trees/nucTree.con.tre
rm nucTree.vstat
rm nucTree.tstat
rm nucTree.trprobs
rm nucTree.run2.t
rm nucTree.run2.p
rm nucTree.run1.t
rm nucTree.run1.p
rm nucTree.parts
rm nucTree.mcmc
return
}
mrBayesNuc

mrBayesTotal(){ # Este metodo vai dar o resultado da analise usando o mr bayes dos genes totais
echo begin mrbayes";" >> ~/Desktop/sequencesVMPY/nexSeqs/totalConc.nex
echo   set autoclose=yes";" >> ~/Desktop/sequencesVMPY/nexSeqs/totalConc.nex
echo   mcmcp ngen=100 printfreq=1000 samplefreq=100 diagnfreq=1000 nchains=4 savebrlens=yes filename=totalTree";" >> ~/Desktop/sequencesVMPY/nexSeqs/totalConc.nex
echo   mcmc";" >> ~/Desktop/sequencesVMPY/nexSeqs/totalConc.nex
echo   sumt filename=totalTree";" >> ~/Desktop/sequencesVMPY/nexSeqs/totalConc.nex
echo end";" >> ~/Desktop/sequencesVMPY/nexSeqs/totalConc.nex

mb /home/valente/Desktop/sequencesVMPY/nexSeqs/totalConc.nex
mv totalTree.con.tre ~/Desktop/sequencesVMPY/trees/totalTree.con.tre
rm totalTree.vstat
rm totalTree.tstat
rm totalTree.trprobs
rm totalTree.run2.t
rm totalTree.run2.p
rm totalTree.run1.t
rm totalTree.run1.p
rm totalTree.parts
rm totalTree.mcmc
return
}
mrBayesTotal

#figtree para os genes mitocondriais
figtree ~/Desktop/sequencesVMPY/trees/mitoTree.con.tre
#figtree para os genes nucleares
figtree ~/Desktop/sequencesVMPY/trees/nucTree.con.tre
#figtree para os genes totais
figtree ~/Desktop/sequencesVMPY/trees/totalTree.con.tre
