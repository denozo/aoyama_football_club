# frozen_string_literal: true

class DeviseCreateGuardians < ActiveRecord::Migration[5.2]
  def change
    create_table :guardians do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :last_name, null: false # 姓
      t.string :first_name, null: false # 名
      t.string :last_name_kana, null: false # 姓カナ
      t.string :first_name_kana, null: false # 名カナ
      t.string :relationship, null: false # 続柄
      t.string :member_name, null: false # 生徒氏名
      t.integer :year_of_enrollment, null: false # 生徒の入学年度
      t.string :postal_code, null: false # 郵便番号
      t.string :address, null: false # 住所
      t.string :tel, null: false # 電話番号

      t.timestamps null: false
      
      
    end

    add_index :guardians, :email,                unique: true
    add_index :guardians, :reset_password_token, unique: true
    # add_index :guardians, :confirmation_token,   unique: true
    # add_index :guardians, :unlock_token,         unique: true
  end
end
