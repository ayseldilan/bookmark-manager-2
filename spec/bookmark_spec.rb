# frozen_string_literal: true

require 'bookmark'

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include('http://www.makersacademy.com')
    expect(bookmarks).to include('http://www.destroyallsoftware.com')
    expect(bookmarks).to include('http://www.google.com')
  end
end

describe '.create' do
  it 'creates a new bookmark and adds to bookmarks table' do
    Bookmark.create(url: 'http://example.org')
    expect(Bookmark.all).to include('http://example.org')
  end
end