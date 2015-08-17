# Control flow graph and relative WCET project
This project deals with two principal objectives:

1. To realize the __control flow graph__ of any executable code relying on its mixed code produced from _trace32 mixed mode_
2. To produce the __WCET__ application of the generated control flow graph only if its hardware performances are known


## Notes:
This project is fully realized with Ada programming language. On first impression, this choice may result inappropriate
but it is the result of a well studied analysis plan. In fact, this project is useful for the author to review the
Ada programming language and to produce a concurrent version in a later moment.
