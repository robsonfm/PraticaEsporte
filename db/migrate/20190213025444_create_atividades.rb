class CreateAtividades < ActiveRecord::Migration[5.2]
  def change
    create_table :atividades do |t|
      t.string :usuario
      t.string :tipoatividade
      t.string :titulo
      t.integer :duracao
      t.date :data

      t.timestamps
    end
  end
end
