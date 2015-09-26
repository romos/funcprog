int* majority(int[] array, int N) {
  int confidence = 0; // количество людей, не нашедших пары и оставшихся стоять
  int* candidate = NULL; // последний человек, не нашедший пару -- 
                         // возможно, его элемент встречается чаще всего

  // проходим по массиву и усаживаем пары с разными элементами
  for (int i = 0; i<N; i++) {

    // если до сих пор все сидят, то следующему пока придётся постоять
    if (confidence == 0) {
      candidate = array+i;
      confidence++;
    }

    // иначе следующий либо садится с одним из стоящих,
    // либо будет стоять вместе с ними, если у него такой же элемент
    else if (*candidate == array[i])) 
      confidence++;
    else 
      confidence--;
  }

  return confidence > 0 ? candidate : NULL;
}