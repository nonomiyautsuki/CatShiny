#cat_TF[row.names(cat_TF) %in% catIDF$word] * catIDF$idf[catIDF$word %in% row.names(cat_TF)]
tfidf<-function(text,idf_list)
{
  term_count<-termFreq(text,control = list())
  tf<-term_count/sum(term_count)
  tf_word<-sapply(row.names(tf),tolower)
  idf_word<-sapply(idf_list$word,tolower)
  matched_tf<-tf[tf_word %in% idf_word]
  matched_idf<-idf_list$idf[idf_word %in% tf_word]
  rownames(matched_idf)<-idf_word[idf_word %in% tf_word]
  matched_idf<-matched_idf[,tf_word]
  result<-matched_tf * matched_idf
  return(result)
}
# fell by TF sort