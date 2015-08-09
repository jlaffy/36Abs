==================36 Antibodies===================
initial script version commits on 27/7/15

#Background: Exploring proABC server (and DIGIT) with 12 forbidden (predicted to be autoreactive) heavy chain sequences and 3 public (promiscuous/used widely by H chains) light chains.

#Prior and up to to 27/7:

====DIGIT=====
 ????
==============
====ProABC====
Retrievable from proABC: heavy and light chain contact probabilities (all non-bonded interactions, hydrophobic and H bonds respectively) in .csv format; pdb model, with B-factor values replaced with contact probabilities; summary page stating all CDR and FR sequences, but length not given only content is (the content includes alignment however ie. RISK------SGGGYYT-- etc.

1. immh103_M_UN_29876 and preh159_M_V3_60711, when paired with imml103 lambda light chain and inputted to proABC, cause the server to detect the following error: "Unexpected gaps in FRH3. Please be aware that some results will be innacurate because of this". In the case of immh159MV-6, the antibody cannot be modelled by proABC, nor therefore can the antigen contacts be predicted. In the case of immh103MU-2, the method of sequence input affects proABC's ability to effectuate modelling and predictions: copy and pasting the sequence into heavy chain seq box does not allow anything to happen. uploading immh103MU-2 seq in .ali file format allows a model and contact predictions to be made. However, the CDRH3 region is entirely cut off from the contact predictions.
NOTE: Catherine: "I've compared both FR3 regions with the IMGT V3-15 germline FR3 region and both are identical to the germline - i.e. according to IMGT there is nothing missing." UPDATE: When sequences permitted by proABC were compared with those not allowed, on AbYsis server (Dr.Martin's group UCL), residues in the unpermitted sequences seemed to frequently occur less than 1% in nature, ie.were very unusual, especially as compared to permitted sequences, which tended not to go below a frequency of less than 10%.'
 
2. The CDR3 regions of the heavy chain sequences, which along with the other CDRs and FRs are predicted by proABC, do not match the predictions given by Catherine -and thus (presumably) by IMGT. However the difference is only small, usually only the three commencing letters (CTT) which IMGT/Catherine supposes as the start of the CDRH3 and proABC supposes as the end of FRH3. 

3. When pdb files opened, VDW residues highlighted if they had a contact probability with antigen of more than 20. This has been done for immh103MV2. Interestingly, CDRH3 loop has a large residue !!!! (WHICH??) which has a low contact probability in its middle region. (colour red). The remaining residues are mainly white, signifying contact probability that is relatively high but not the highest (blue).
==============
=====TODO=====
A. Email proABC to notify of sequence problem (see 1)  and sending job to email problem 
B. Look at more pdb models. Annotate residues. understand RWB colour scheme. Why is there a low probability residue in the middle of CDRH3? Are there a.a. usage patterns? (Also see R for the latter). 
==============
======R=======
1. Graphs to easily show which residues increase/decrease in antigen-contact probability upon an increase/decrease in antigen volume (smaller or larger than ~1.5Å^2 is field provided by proABC).
2. Graphs also show variable region key, so as to note whether residue 99 is in FR3 or CDR3 for example.
3. Tables, outputted in .csv format, with 3 columns: (1) a.a.position; (2) a.a.seq; (3) difference in contact probability (when big vs (or -) small vol of antigen).
==============
=====TODO=====
A. Are there patterns in the residue type which increases/loses contact?
B. Are there patterns in the residue position (where it is found in Var domain or in sequence?)
C. Make graph and table (see 1-3) for all heavy chains. There should be 2 graphs per antibody - one L chain and one H chain.
=============
=============
1.Bash script > runs R script > edits R script sequence ids > runs R script again > repeat for all 12 heavy chains. 
2.R script > make a graph, include CDR/FR legend
