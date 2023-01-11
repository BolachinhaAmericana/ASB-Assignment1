# ASB-Assignment01
## _Knee deep into phylogenetics_
- In this assignment we had to: 
	- Search the bibliography for a research paper that performs phylogenetic analyses and understand the biological problem
	- Obtain the sequences used in that research paper
	- Reproduce some of the methods performed in the paper that we considered to be more important
	- Interpret the obtained phylogenetic trees and compare our results with the original paper
	-  We also made sure that out analyses was reproductible so it will hopefully work on your computer as well!
#### What I did in this project
-   This isn't the submitted assignment but rather everything I alone did. It should give you the full results however it's missing our interpretation and comparison with the ones on the paper.
### How to run
1. Run the "prepScript.sh" script.
2. This is the only step that must be performed by the user by hand.
	- Run MegaX software
	-  In your GUI select, in the "DATA" tab, the second option: "Concatenate Sequence Alignments"
	- After clicking, a window will open where you must navigate to the folder created initially: "sequencesVMPY". First select the folder "mitochondrial". You should then open the data and export it in FASTA format to the "concSeqs" folder inside "sequences.VMPY" and name it "mitoConc.fas".
	- You will have to repeat this process for the "nuclear" and "total" folders.
		- At the end the "concSeqs" folder should have three files, these being "mitoConc.fas", "nucConc.fas" and "totalConc.fas" 
		- If you do not follow this step properly, the next step will give the following error:
Error: File Does not Exist!
Please check README.md for more information.
 3. Now that we have the strings concatenated, in their proper directory and with a proper name, we can run the second script, "mainScript.sh"
 #### Please note
 If everything was followed correctly, just wait for the trees to finish. It is necessary to bear in mind that the first tree should correspond to the mitochondrial genes, the second to the nuclear genes and the third to the total genes, and that the next tree will only open when the  one before it is closed.
