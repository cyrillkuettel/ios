from main import Scraper


def test_reading_a_tags():

    scraper = Scraper()
    tags = scraper.get_relevant_divs()

    print(type(tags))
    print(len(tags))

    assert len(tags) > 20
    assert "a" in tags


def test_get_names_as_list():
    myname = "Cyrill"
    scraper = Scraper()
    divs = scraper.get_relevant_divs()

    only_first_name = scraper.get_text_from_a(divs)
    assert myname in only_first_name
    print(only_first_name)
