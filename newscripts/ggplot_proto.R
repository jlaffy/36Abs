library(reshape2)
library(ggplot2)

df2 = selected[,c("NAIL120big","IMML103big","NAIL107big")]
df3 = t(df2)
df4 = melt(df3)

df4plot = ggplot(data = df4, aes(x = as.factor(Var2), y = value, fill = Var1)) +
  geom_bar(stat = "identity", width = 1.5, position = "dodge", size=.3) + 
  scale_fill_hue(name="Light chain ID") + 
  xlab(c("Amino acid position")) + ylab(c("Contact probability")) +
  ggtitle(c("Impact of light chain on heavy chain-antigen contacts"))
df4plot
