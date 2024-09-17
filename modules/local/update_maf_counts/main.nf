process UPDATEMAFCOUNTS {
    time '48h'
    cpus 12
    memory '12 GB'
    label 'process_high'

  input:
    path(maf_file, stageAs: '?/inputs/*')
    path(counts_file)
    val(filename)
  output:
    path("${filename}.maf"), emit: maf
  script:
    """
        variant_utils update-maf-counts --input ${maf_file} --counts ${counts_file} --output ${filename}.maf
    """

}
