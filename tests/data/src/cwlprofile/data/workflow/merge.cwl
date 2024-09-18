#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineAgent
label: 'merge BAMs'
baseCommand: ["/opt/samagents/bin/samagents", "merge"]
arguments: ["AlignedMerged.bam"]
inputs:
    bams:
        type: File[]
        inputBinding:
            position: 1
outputs:
    merged_bam:
        type: File
        outputBinding:
            glob: "AlignedMerged.bam"
