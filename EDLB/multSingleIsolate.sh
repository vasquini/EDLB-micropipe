#mkdir mylogs_multiso
mkdir mylogs_singsamp
ml nextflow
which nextflow
cd EDLB
for i in $(cat ~/CovList.csv )
do 
   fn=$(echo $i | cut -d ',' -f 1)
   cov=$(echo $i | cut -d ',' -f 2)
   head -1 ~/multsingle_samplesheet.csv > ${fn}_mini.csv
   grep $fn ~/multsingle_samplesheet.csv >> ${fn}_mini.csv
   qsub -N run_${fn} -o ./mylogs_singsamp/run_${fn}.out -e ./mylogs_singsamp/run_${fn}.err ~/run_nf.sh $fn ${fn}_mini.csv $cov
done
