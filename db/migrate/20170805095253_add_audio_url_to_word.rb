class AddAudioUrlToWord < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :audio_url, :string
  end
end
