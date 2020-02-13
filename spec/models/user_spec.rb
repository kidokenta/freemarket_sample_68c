require 'rails_helper'
describe User do
  describe '#create' do
    it "name,email,password,password_confirmationで登録可" do
      user = build(:user)
      expect(user).to be_valid
    end
    
    it "nameが空では登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "nameが7文字以上では登録できないこと" do
      user = build(:user, name: "aaaaaaaa")
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 6 characters)")
    end
    
    it "nameが6文字以下では登録できること" do
      user = build(:user, name: "aaaaaa")
      expect(user).to be_valid
    end
    
    it "emailが空では登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "email重複では登録できないこと" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordが空では登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが６文字以上で登録できること" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが５文字以下では登録できないこと" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end


    it "passwordが入力されていてもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end



  end
end

