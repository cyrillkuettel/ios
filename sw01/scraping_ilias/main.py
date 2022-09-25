from bs4 import BeautifulSoup, ResultSet


class Scraper:
    def __init__(self):
        pass

    def get_relevant_divs(self):
        with open("index.html") as fp:
            soup = BeautifulSoup(fp, "html.parser")
            return soup.findAll("div", {"class": ["caption", "card-title"]})

    def get_text_from_a(self, divs: ResultSet):
        souped = "".join((str(t) for t in divs))
        soup = BeautifulSoup(souped, "html.parser")
        result_list = []
        for j in soup.find_all("a", recursive=True):
            result_list.append(j)

        only_first_name = [item.text.partition(" ")[0] for item in result_list]
        return only_first_name

    def get_names(self):
        divs = self.get_relevant_divs()
        return self.get_text_from_a(divs)


if __name__ == '__main__':
    scraper = Scraper()
    names = scraper.get_names()
    names_w = str(names).replace("'", "\"")
    print(names_w)