# Survey sampling code for final project on Islands Data
# Aidan Draper
# December 4, 2018

library(googlesheets)

set.seed(1337)

#authorize data sheet
gs_auth()
survey.df <- data.frame(gs_read(gs_key("1H-nJggWpOutHZG8YScab5UgrWqlnNDvaMWTDdtCytDA")))

sample_size = 61 

samples = c(rep(1,14),rep(2,20),rep(3,27))

village_max = c(1016,1346,818,691,763,662,
                738,1152,673,470,806,534,900,1257,315,
                718,591,736,810,443,420,802,178,1610,512,1452,836) 

island_names = c('top','middle','bottom')

for(island_num in samples){
  if (island_num == 1){
    village_num = sample(1:6,1)
    house = sample(1:village_max[village_num],1)
    
    # if this village house combo has already been selected, try again
    village_surveyed = match(village_num, survey.df[,2])
    while(house%in%survey.df[village_surveyed,3]==TRUE){
      village_num = sample(1:6,1)
      house = sample(1:village_max[village_num],1)
      village_surveyed = match(village_num, survey.df[,2])
    }
    cat("Thre sample village is", village_num, "and the house is", house,"\n")
  } else if (island_num == 2){
    village_num = sample(1:9,1)
    house = sample(1:village_max[village_num+6],1)
    
    # if this village house combo has already been selected, try again
    village_surveyed = match(village_num, survey.df[,2])
    while(house%in%survey.df[village_surveyed,3]==TRUE){
      village_num = sample(1:6,1)
      house = sample(1:village_max[village_num],1)
      village_surveyed = match(village_num, survey.df[,2])
    }
    cat("The sample village is", village_num, "and the house is", house,"\n")
  }
    
  else if (island_num == 3) {
    village_num = sample(1:12,1)
    house = sample(1:village_max[village_num+6+9],1)
    
    # if this village house combo has already been selected, try again
    village_surveyed = match(village_num, survey.df[,2])
    while(house%in%survey.df[village_surveyed,3]==TRUE){
      village_num = sample(1:6,1)
      house = sample(1:village_max[village_num],1)
      village_surveyed = match(village_num, survey.df[,2])
    }
    cat("The sample village is", village_num, "and the house is", house,"\n")
  }
  #add to google sheets
  gs_add_row(ss=gs_title("213_survey_data"),ws = "Sheet1", input = c(island_names[island_num], village_num, house))
}

# once you have your list in googlesheets, add the same columns we had and run the code below to see which person from the house to sample

num_people = 2 # change this to the number of ppl in the house
sample(1:num_people,1)
