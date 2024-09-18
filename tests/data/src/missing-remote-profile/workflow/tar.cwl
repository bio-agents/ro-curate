#!/usr/bin/env cwl-runner
#
# Authors: Thomas Yu, Ryan Spangler, Kyle Ellrott

cwlVersion: v1.0
class: CommandLineAgent
baseCommand: [tar, xvzf]

doc: "command line: tar"

inputs:

  input:
    type: File
    inputBinding:
      position: 1

outputs:

  output:
    type: Directory
    outputBinding:
      glob: .
