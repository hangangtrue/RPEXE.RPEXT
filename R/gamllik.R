#' @title Log likelihood from the gamma distribution
#' 
#' @description A function computing the log likelihood from the gamma distribution under an order restriction reduction
#'
#' @param structtime change-point times to be used to compute the likelihood value
#' @param structttot total time on test (ttot) between each time point and the previous time point (or 0) corresponding to structtime
#' @param structdeaths number of deaths corresponding to structttot
#' @param time_die all event and censoring times from small to large
#' @param ttot total time on test corresponding to time_die
#' @param deaths the number of deaths corresponding to "ttot"
#' 
#' @importFrom stats dgamma
#' 
#' @usage gamllik(structtime,structttot,structdeaths,time_die,ttot,deaths)
#' 
#' @return
#' log of the likelihood
#' 
#' @export
#'
#' @examples
#' time_die <- c(0.05,0.08,0.38,0.41,0.64)
#' ttot <- c(9.2,5.8,52.1,5.8,40.0)
#' deaths <- c(1,1,1,1,1)
#' structtime <- c(0.05,0.64)
#' structttot <- c(9.2, 40.0)
#' structdeaths = c(1, 5)
#' gamllik(structtime,structttot,structdeaths,time_die,ttot,deaths)
gamllik=function(structtime,structttot,structdeaths,time_die,ttot,deaths)
{
  #compute the Gamma parameter
  structgamindi=array(0,c(length(structtime),1))
  for(j in 1:length(structtime))
      structgamindi[j]= structttot[j]/structdeaths[j]
  #the likelihood
  #get the indices of the cut times:
  structindi=array(0,c(length(structtime),1))
  for(j in 1:length(structtime))
    for (jj in 1:length(time_die))
       if (time_die[jj]==structtime[j])
           structindi[j] =jj

  #set the scale parameter for Gamma distribution of the ttot
  structgampar=array(0,c(length(time_die),1))
  for (ii in 1:length(time_die))
      for (j in 1:length(structtime))
          if (ii<=structindi[j])
            {
              if (j==1)
                  structgampar[ii]= structgamindi[j]
              else
                  if (ii>structindi[j-1])
                      structgampar[ii] = structgamindi[j]
             }
  loglik = 0
  for (ii in 1:length(structgampar))
      loglik = loglik + log(dgamma(ttot[ii]/deaths[ii],shape=deaths[ii],scale=structgampar[ii],log=FALSE))
  return(loglik)
}