#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineAgent
label: 'BAM to CRAM conversion'
baseCommand: ["/opt/samagents/bin/samagents", "view", "-C"]
stdout: "final.cram"
inputs:
    reference:
        type: string
        inputBinding:
            prefix: "-T"
            position: 1
    bam:
        type: File
        inputBinding:
            position: 2
outputs:
    cram:
        type: stdout
