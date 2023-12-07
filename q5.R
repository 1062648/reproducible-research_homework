Cui_etal2014 <- read.csv("Cui_etal2014")

summary(Cui_etal2014)
# The dataset has 13 columns and 33 rows.


Cui_etal2014$log_volume <- log(Cui_etal2014$`Virion volume (nm×nm×nm)`) # Log transforming virion volume
Cui_etal2014$log_genome_length <- log(Cui_etal2014$`Genome length (kb)`)

model <- lm(log_volume ~ log_genome_length  , Cui_etal2014)
summary(model)

# Obtained from model: 
# intercept = 7.0748, p = 2.28e-10
# log_volume = 1.5152, p = 6.44e-10
# These coefficients are statistically significant. 


# Reproducing and saving the figure

virion_plot <- ggplot(Cui_etal2014,aes(x=log_genome_length, y=log_volume)) + # same general setup
  geom_point() + # Adding points
  geom_smooth(method='lm') + # Adding linear regression line
  theme_bw() + # Taking away gray background
  labs(x = "log[Genome length (kb)]", y= "log[Virion volume (nm3)]") + # Adding matching appropriate labels
  theme(axis.title = element_text(face="bold"))  # Putting axis titles in bold - just a finishing touch

virion_plot

png(filename="virion_plot.png", width=600, height=500)
