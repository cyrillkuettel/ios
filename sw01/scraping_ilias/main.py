from zipfile import ZipFile
from bs4 import BeautifulSoup, ResultSet


class Scraper:
    def __init__(self):
        pass

    def get_relevant_divs(self):
        path_to_zip_file = "index.zip"
        with ZipFile(path_to_zip_file, "r") as zip_ref:
            zip_ref.extractall(".")

        with open("index.html") as html_file:
            soup = BeautifulSoup(html_file, "html.parser")
            return soup.findAll("div", {"class": ["caption", "card-title"]})

    def get_text_from_a(self, divs: ResultSet, index=0):
        souped = "".join((str(t) for t in divs))
        soup = BeautifulSoup(souped, "html.parser")
        result_list = []
        for j in soup.find_all("a", recursive=True):
            result_list.append(j)

        only_first_name = [item.text.partition(" ")[index] for item in result_list]
        return only_first_name

    def surnames(self):
        divs = self.get_relevant_divs()
        return self.get_text_from_a(divs)

    def names(self):
        divs = self.get_relevant_divs()
        return self.get_text_from_a(divs, index=2)


if __name__ == "__main__":
    scraper = Scraper()
    surnames = scraper.surnames()
    names = scraper.names()
    names_w = str(names).replace("'", '"')
    print(names_w)
