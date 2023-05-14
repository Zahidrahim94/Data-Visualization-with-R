library(ggplot2)
library(ggthemes)

# Initialize a ggplot object with the iris dataset
p <- ggplot(data = iris)

# Scatter plot of Sepal Length vs. Sepal Width colored by Species
p1 <- p + geom_point(aes(x = Sepal.Width, y = Sepal.Length, color = Species)) +
  labs(x = "Sepal Width", y = "Sepal Length", title = "Scatter Plot of Iris Sepal Width vs. Length") +
  theme_economist() +
  annotate("text", x = 3, y = 7, label = "Graph Theory Elements", color = "red", size = 5)

# Line plot of Petal Length for each Species
p2 <- p + geom_line(aes(x = seq_along(Petal.Length), y = Petal.Length, group = Species, color = Species)) +
  labs(x = "Index", y = "Petal Length", title = "Line Plot of Iris Petal Length by Species") +
  theme_economist() +
  scale_color_brewer(palette = "Pastel1")

# Bar plot of Species counts
p3 <- p + geom_bar(aes(x = Species, fill = Species)) +
  labs(x = "Species", y = "Count", title = "Bar Plot of Iris Species Counts") +
  theme_economist() +
  scale_fill_brewer(palette = "Pastel1")

# Histogram of Sepal Width
p4 <- p + geom_histogram(aes(x = Sepal.Width, fill = Species), bins = 10) +
  labs(x = "Sepal Width", y = "Frequency", title = "Histogram of Iris Sepal Width") +
  theme_economist() +
  scale_fill_brewer(palette = "Pastel1")

# Box plot of Petal Width by Species
p5 <- p + geom_boxplot(aes(x = Species, y = Petal.Width, fill = Species)) +
  labs(x = "Species", y = "Petal Width", title = "Box Plot of Iris Petal Width by Species") +
  theme_economist() +
  scale_fill_brewer(palette = "Pastel1")

# Create a grid of scatter plots for each combination of variables
p6 <- p + geom_point(aes(x = Sepal.Width, y = Sepal.Length)) +
  facet_wrap(~Species) +
  labs(x = "Sepal Width", y = "Sepal Length", title = "Grid of Scatter Plots for Iris Species") +
  theme_economist()

# Scatter plot with smooth trend lines for each species
p7 <- p + geom_smooth(aes(x = Sepal.Width, y = Sepal.Length, color = Species), method = "lm") +
  labs(x = "Sepal Width", y = "Sepal Length", title = "Scatter Plot with Smooth Trend Lines for Iris Species") +
  theme_economist()

# Create a folder with the current date and time
timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
folder_path <- file.path(getwd(), "images", paste0("images_", timestamp))
dir.create(folder_path, recursive = TRUE, showWarnings = FALSE)

# Save the plots in high-quality JPEG format in the specified folder with the current date and time
ggsave(filename = file.path(folder_path, "scatter_plot.jpg"), plot = p1, dpi = 300, quality = 100)
ggsave(filename = file.path(folder_path, "line_plot.jpg"), plot = p2, dpi = 300, quality = 100)
ggsave(filename = file.path(folder_path, "bar_plot.jpg"), plot = p3, dpi = 300, quality = 100)
ggsave(filename = file.path(folder_path, "histogram.jpg"), plot = p4, dpi = 300, quality = 100)
ggsave(filename = file.path(folder_path, "box_plot.jpg"), plot = p5, dpi = 300, quality = 100)
ggsave(filename = file.path(folder_path, "grid_scatter_plots.jpg"), plot = p6, dpi = 300, quality = 100)
ggsave(filename = file.path(folder_path, "smooth_scatter_plot.jpg"), plot = p7, dpi = 300, quality = 100)


# Print the folder path where the images are saved
print(paste("Plots saved in:", folder_path))

