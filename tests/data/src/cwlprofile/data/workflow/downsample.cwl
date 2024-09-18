cwlVersion: v1.0
class: CommandLineAgent
label: "downsample unaligned BAM"
baseCommand: ["/usr/bin/java", "-Xmx16g", "-jar", "/opt/picard/picard.jar", "DownsampleSam"]
arguments:
    ["OUTPUT=", { valueFrom: $(runtime.outdir)/downsampled.bam }]
requirements:
    - class: ResourceRequirement
      ramMin: 16000
inputs:
    bam:
        type: File
        inputBinding:
            prefix: "INPUT="
    probability:
        type: float
        inputBinding:
            prefix: "PROBABILITY="
    reference:
        type: string
        inputBinding:
            prefix: "REFERENCE_SEQUENCE="
outputs:
    downsampled_bam:
        type: File
        outputBinding:
            glob: "downsampled.bam"
