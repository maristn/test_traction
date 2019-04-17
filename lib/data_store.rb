module DataStore

	def self.keep(name, object)
    spec_store = Gauge::DataStoreFactory.spec_datastore
    spec_store.put(name, object)
      return spec_store
	end

	def self.use(name)
    spec_store = Gauge::DataStoreFactory.spec_datastore
      return spec_store.get(name)
    end
end