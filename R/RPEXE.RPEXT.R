#' @title Reduced Piecewise Exponential Estimate/Test Software 
#' @name RPEXE.RPEXT
#' @docType package
#' @description This reduced piecewise exponential survival software implements the likelihood ratio test 
#' and backward elimination procedure in Han, Schell, and Kim (2012, 2014), and Han et al. (2016). Inputs 
#' to the program can be either times when events/censoring 
#' occur or the vectors of total time on test and the number of events. Outputs of the programs are times 
#' and the corresponding p-values in the backward elimination. 
#' Details about the model and implementation are given in Han et al. 2014. 
#' This program can run in R version 3.2.2 and above.
#'
#' 
#' @references 
#' [1] Han, G., Schell, M. J., and Kim, J. (2012) “Comparing Two Exponential Distributions Using the Exact Likelihood Ratio Test," Statistics in Biopharmaceutical Research, 4(4), 348-356.
#' 
#' [2] Han, G., Schell, M. J., and Kim, J. (2014) “Improved Survival Modeling in Cancer Research Using a Reduced Piecewise Exponential Approach," Statistics in Medicine, 33(1), 59-73.
#' 
#' [3] Han, G., Schell, M., Zhang, H., Zelterman, D., Pusztai, L., Adelson, K., and Hatzis, C. (2016) “Testing Violations of the Exponential Assumption in Cancer Clinical Trials with Survival Endpoints," Biometrics, DOI: 10.1111/biom.12590; PMID: 27669414.
#' 
#' [4] Adelson, K. B., Ramaswamy, B., Sparano, J. A., Christos, P. J., Wright, J. J., Raptis, G., Han, G., Villalona-Calero, M., Ma, C., Hershman, D., Baar, J., Klein, P., Cigler, T., Budd, T., Novik, Y., Tan, A.R., Tannenbaum, S., Goel, A., Levine, E., Shapiro, C. L., Andreopoulou, E., Naughton, M., Kalinsky, K., Waxman, S., Germain, D. (2016) “Randomized Phase II Trial of Fulvestrant Alone or in Combination with Bortezomib in Hormone Receptor-Positive Metastatic Breast Cancer Resistant to Aromatase Inhibitors: A New York Cancer Consortium Trial," Nature Partner Journals Breast Cancer, Volume 2, Article ID 16037, DOI: 10.1038/npjbcancer.2016.37.
#' 
#' [5] Simon GR, Extermann M, Chiappori A, Williams C, Begum M, Haura RKE, Ismail-Khan R, Schell M, Antonia SJ, Bepler G. Phase 2 trial of docetaxel and gefitinib in the first-line treatment of patients with advanced stage non-small cell lung cancer (NSCLC) who are 70 years of age or older. Cancer 2008; 112:2021–2029.
#' 
#' [6] Hatzis, C., Pusztai, L., Valero, V., Booser, D. J., Esserman, L., Lluch, A., et al. (2011). A genomic predictor of response and survival following taxane-anthracycline chemotherapy for invasive breast cancer. The Journal of the American Medical Association 305, 1873–1881.
NULL

#' RPEXE_fitting
#' 
#' A breast cancer clinical trial dataset in Adelson et al. (2016). 
#' 
#' \itemize{
#'   \item first column - times : time to event
#'   \item second column - censor : censoring status; 0=censored, 1=event.
#'   \item third column - group : labels the single agent arm and combination arm
#' }
#' @docType data
#' @keywords datasets
#' @name data2
#' @usage data(data2)
#' @references 
#' [1] Adelson, K. B., Ramaswamy, B., Sparano, J. A., Christos, P. J., Wright, J. J., Raptis, G., Han, G., Villalona-Calero, M., Ma, C., Hershman, D., Baar, J., Klein, P., Cigler, T., Budd, T., Novik, Y., Tan, A.R., Tannenbaum, S., Goel, A., Levine, E., Shapiro, C. L., Andreopoulou, E., Naughton, M., Kalinsky, K., Waxman, S., Germain, D. (2016) “Randomized Phase II Trial of Fulvestrant Alone or in Combination with Bortezomib in Hormone Receptor-Positive Metastatic Breast Cancer Resistant to Aromatase Inhibitors: A New York Cancer Consortium Trial," Nature Partner Journals Breast Cancer, Volume 2, Article ID 16037, DOI: 10.1038/npjbcancer.2016.37.
NULL

#' JAMA Breast cancer 
#' 
#' A dataset containing predictions for chemo-censitivity and pathological response 
#' from Hatzis (2011)
#' 
#' \itemize{
#'   \item validate: Validation status
#'   \item drfs: Censoring status; 0=censored, 1=event.
#'   \item drfs.time: Time to event or censoring
#'   \item er.status: ER status, P=positive, N=negative
#'   \item chemo.pred: Prediction for chemo sensitivity from the ACES predictor, sensitive or insensitive
#'   \item pre.N: Prediction of nodal status
#'   \item pCR.RD: pathological complete response (pCR) or residual disease (RD) 
#'   \item pre.grade: prediction of tumor grade
#'   \item pre.T: T stage prediction
#'   \item dlda30: DLDA30 prediction for the pathological response.
#'   
#' }
#' @docType data
#' @keywords datasets
#' @name df
#' @usage data(df)
#' @references 
#' [1] Hatzis, C., Pusztai, L., Valero, V., Booser, D. J., Esserman, L., Lluch, A., et al. (2011). A genomic predictor of response and survival following taxane-anthracycline chemotherapy for invasive breast cancer. The Journal of the American Medical Association 305, 1873–1881.
NULL

#' None Small Cell Lung cancer data
#' 
#' A dataset non-small-cell lung cancer trial data from Simon et al. (2011)
#' 
#' \itemize{
#'   \item first column - censor : censoring status; 0=censored, 1=event.
#'   \item second column - times : time to event
#' }
#' @docType data
#' @keywords datasets
#' @name simple
#' @usage data(simple)
#' @references 
#' [1] Simon GR, Extermann M, Chiappori A, Williams C, Begum M, Haura RKE, Ismail-Khan R, Schell M, Antonia SJ, Bepler G. Phase 2 trial of docetaxel and gefitinib in the first-line treatment of patients with advanced stage non-small cell lung cancer (NSCLC) who are 70 years of age or older. Cancer 2008; 112:2021–2029.
NULL

#' Example data for loopcuts_cuttimes
#' 
#' 
#' @docType data
#' @keywords datasets
#' @name loopcuts_cut
#' @usage data(loopcuts_cut)
NULL

#' Example data for loopcut_times_censoring
#' 
#' 
#' @docType data
#' @keywords datasets
#' @name loopcuts_t_c
#' @usage data(loopcuts_t_c)
NULL

#' Example data for pava
#' 
#' 
#' @docType data
#' @keywords datasets
#' @name pava_dfrd
#' @usage data(pava_dfrd)
NULL

#' Example data for pexeest_times_censoring
#' 
#' 
#' @docType data
#' @keywords datasets
#' @name pexeest_times_censoring
#' @usage data(pexeest_times_censoring)
NULL

#' Example data for pexeest_tx
#' 
#' 
#' @docType data
#' @keywords datasets
#' @name t100
#' @usage data(t100)
NULL

#' Example data for loopcut_onestep
#' 
#' 
#' @docType data
#' @keywords datasets
#' @name loopcut_onestep_data
#' @usage data(loopcut_onestep_data)
NULL

#' Example data for loopcut_umbrella
#' 
#' 
#' @docType data
#' @keywords datasets
#' @name loopcuts_umbrella_cuttimes_mono
#' @usage data(loopcuts_umbrella_cuttimes_mono)
NULL
