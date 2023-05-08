# Discovering datasets with Korp

[This article](https://www.kotus.fi/nyt/kolumnit_artikkelit_ja_esitelmat/kielipakina_%282006_2009%29/substantiivitaudin_oireita) about "noun disease" is from 2007. Could we find the signs of this in progress in our data?

The article gives these examples:

_tekee päätöksen uransa jatkamisesta_  
_toteutetaan hintojen korotus_  
_Sopivan vertailuryhmän puuttuminen estää hankkeen edullisuuden luotettavan selvittämisen._  
_ympäristönsuojelutavoitteiden toteuttaminen edellyttää kunnilta investointeja jätteenkäsittelylaitokseen_  
_harjoittelijoiden työsuhteiden koordinaatio tapahtuu hallintotiimissä_  

It gives a list of verb forms often associated with this phenomenon:

_aiheuttaa_, _edellyttää_, _vaikuttaa_, _ilmenee_, _on_, _tapahtuu_, _tekee_, _suorittaa_, _toteuttaa_

Let's do a search for some of these verbs to see if we can stumble on some cases. Some of them are very common (_on_, _tekee_), but some might be more specific to this phenomenon, like _toteuttaa_. 

## Basic Korp usage

{% include videoEmbed.html filename="corpus_selection.webm" %}

First, we need to select some corpora to search in. If you're not logged in (and we will assume for this exercise that you aren't), only publicly available corpora will be selectable, and others will be marked with a lock icon. We are interested in the modern era of Finnish usage, and probably in a more formal style, so let's try for example "Akateemisia tekstejä", academic texts, which grouping contains one corpus: E-thesis, a collection of Finnish doctoral and master's theses between 1999 and 2016. Sounds good.

[screenshot: top results]



### Extended search

It won't be enough to search for one form of _toteuttaa_, because there are likely hundreds of relevant realisations of that lemma. We will input _toteuttaa_ as the base form in the extended search.

{% include videoEmbed.html filename="toteuttaa_extended_search_en.webm" %}

Now we can click through the relevant words in the concordance and make observations about what linguistic features might be relevant.

### Statistics views

Each search result can also be summarized in statistical views. In particular, if we want to find out about changes over time, we'd like to see a graph of number of hits per time period. We can do this by going to the `Statistics` tab and clicking on `Show Trend diagram`

[screenshot: statistics tab with trend diagram button]

[screenshot: trend diagram button]

Explain problem with multiple corpora in same timeline
Explain relative frequency meaning

## 


Some possible strategies:

1) We could find if these explicit forms are becoming more frequent in the data
2) We could find if the morphosyntactic constructions in the examples are becoming more frequent in the data
3) We could find if any form of a given shortlist of verbs is becoming more common
4) Without any explicit data, we could try to find if the verb inventory in the corpus is becoming more dominated by the most frequent verbs



tehdä, toteuttaa

cqp=[lemma %3D "tehdä"]: 

If we search for the lemma _tehdä_ (to do), we find many forms: tehdä, tehdään, tehty, tekee, tekemään, tehnyt, tehtiin, teki, tekevät, tehtävä, etc. As we browse through the examples, we see that many of these forms can participate in the phenomenon in question, but those forms are not used exclusively in this way. For example, in the parliamentary speech corpus, we find this sentence:

_Tätä arviointia varmaan joudutaan nyt entistä tarkemmin myös tekemään._

This looks like a valid example of "noun disease", because an equivalent sentence _Tätä joudutaan varmaan nyt entistä tarkemmin myös arvioimaan_ would get rid of the _tekemään_ form of _tehdä_. But it also shows that the phenomenon is quite subtle: _tekemään_ in the original sentence, or _arvioimaan_ in the alternative sentence are main verbs in the sentence, but rather adverbial complements of some kind (let's not get too deep into the linguistics!). The main verb is _joudutaan_, which is in the passive voice, 

Incidentally, the syntax of this sentence is completely misannotated in the corpus, as we see in the dependency tree view. But what is reasonably correct is the morphology of _tekemään_: `NUM_Sg|CASE_Ill|VOICE_Act|INF_Inf3`: it is a so-called third infinitive form, and the morphology of _joudutaan_, 

## Selection of corpora

### Getting appropriate time overlaps

### Testing the subcorpora
