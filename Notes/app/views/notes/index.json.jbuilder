json.array!(@notes) do |note|
  json.extract! note, :id, :text, :user_id, :image, :title
  json.url note_url(note, format: :json)
end
