json.array!(@result) do |event|
	json.extract! event,:id, :title, :start, :end
end