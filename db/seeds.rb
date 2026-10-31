stores = JSON.parse File.read('db/files/stores.json')
instruments = JSON.parse(File.read('db/files/instruments.json'))

Store.create!(stores) unless Store.any?
Item.create!(instruments) unless Item.any?
