*NORMAL DISTRIBUTION*
hist DifferenceAB, frequency normal

hist DifferenceAB if TreatmentAB ==0
hist DifferenceAB if TreatmentAB ==1

hist DifferenceCD, frequency normal

hist DifferenceCD if TreatmentCD ==0
hist DifferenceCD if TreatmentCD ==1

*HOMOGENEITY OF VARIANCES - LEVENE'S TEST*
robvar DifferenceAB, by(TreatmentAB)
robvar DifferenceCD, by(TreatmentCD)

*DESCRIPTIVE STATS*
sum DifferenceAB if TreatmentAB ==0
sum DifferenceAB if TreatmentAB ==1
sum DifferenceCD if TreatmentCD ==0
sum DifferenceCD if TreatmentCD ==1


tabstat DifferenceAB if TreatmentAB ==0, stats(n mean median min max)
tabstat DifferenceAB if TreatmentAB ==1, stats(n mean median min max)

tabstat DifferenceCD if TreatmentCD ==0, stats(n mean median min max)
tabstat DifferenceCD if TreatmentCD ==1, stats(n mean median min max)

*MANN-WHITNEY U TEST*
ranksum(DifferenceAB), by (TreatmentAB)
ranksum(DifferenceCD), by (TreatmentCD)

*EFFECT SIZE*
esize twosample DifferenceAB, by (TreatmentAB)
esize twosample DifferenceCD, by (TreatmentCD)
