simulate<-function(prob_yes,N){
  simulations = c()
  for (i in 1:N){
    coin_flip<-sample(c(1,0),size = 1)
    if (coin_flip==1){
      answer<-sample(c(1,0),size = 1,prob = c(prob_yes,1-prob_yes))
    }else{
      answer<-1
    }
    simulations<-c(simulations,answer)
  }
  return(sum(simulations))
}

simulate_N<-function(prob_no,N){
  simulations = c()
  for (i in 1:N){
    
    simulations = c(simulations,simulate(prob_no,N))
  }
  return((simulations)/(0.5*N)-1)
}

