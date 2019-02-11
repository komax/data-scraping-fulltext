
# Use package fulltext to search and obtain articles from various resources.

# Install the package if needed.
#install.packages(fulltext)

# Then load the package.
libary(fulltext)

# Search in these journals and store the dois in a dataframe.
searchResults <- ft_search(query = "ecology AND biology",
                           from = c("plos", "biorxiv"))

# Focus on the dois from plos.
(plosDios <- searchResults$plos$data$id)

# Download the abstracts from these articles.
abstractsPlosArticles <- ft_abstract(plosDios, from = "plos")

# Output the abstract of the first article.
firstArticle <- abstractsPlosArticles$plos[[1]]
print(firstArticle$doi)
print(firstArticle$abstract)

# Download the articles.
downloadedPapers <- ft_get(plosDios, from = "plos")

# Extract the entire text.
fullTextArticle <- ft_extract(downloadedPapers)
print(fullTextArticle)
