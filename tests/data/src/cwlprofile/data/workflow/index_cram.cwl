#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineAgent
label: 'samagents index cram'
arguments: [
    "cp", $(inputs.cram.path), "$(runtime.outdir)/$(inputs.cram.basename)",
    { valueFrom: " && ", shellQuote: false },
    "/opt/samagents/bin/samagents", "index", "$(runtime.outdir)/$(inputs.cram.basename)", "$(runtime.outdir)/$(inputs.cram.basename).crai",
    { valueFrom: " && ", shellQuote: false },
    "ln", "-s", "$(inputs.cram.basename).crai", "$(runtime.outdir)/$(inputs.cram.nameroot).crai"
]
requirements:
    - class: ShellCommandRequirement
inputs:
    cram:
        type: File
outputs:
    indexed_cram:
        type: File
        secondaryFiles: [.crai, ^.crai]
        outputBinding:
            glob: $(inputs.cram.basename)
