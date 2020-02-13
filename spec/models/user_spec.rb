require 'rails_helper'
describe User do
  describe '#create' do
    
    it "nicknameが空では登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    
    it "nicknameが7文字以上では登録できないこと" do
      user = build(:user, nickname: "aaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("は6文字以内で入力してください")
    end
    
    it "famiry_nameが空では登録できないこと" do
      user = build(:user, famiry_name: "")
      user.valid?
      expect(user.errors[:famiry_name]).to include("を入力してください")
    end
    
    it "famiry_name_kanaが空では登録できないこと" do
      user = build(:user, famiry_name_kana: "")
      user.valid?
      expect(user.errors[:famiry_name_kana]).to include("を入力してください")
    end
    
    it "first_nameが空では登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    
    it "first_name_kanaが空では登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
    
    it "birthdayが空では登録できないこと" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end
    
    it "postal_codeが空では登録できないこと" do
      user = build(:user, postal_code: "")
      user.valid?
      expect(user.errors[:postal_code]).to include("を入力してください")
    end
    
    it "adress_prefectureが空では登録できないこと" do
      user = build(:user, adress_prefecture: "")
      user.valid?
      expect(user.errors[:adress_prefecture]).to include("を入力してください")
    end
    
    it "adress_townが空では登録できないこと" do
      user = build(:user, adress_town: "")
      user.valid?
      expect(user.errors[:adress_town]).to include("を入力してください")
    end
    
    it "adress_numberが空では登録できないこと" do
      user = build(:user, adress_number: "")
      user.valid?
      expect(user.errors[:adress_number]).to include("を入力してください")
    end
    
    it "emailが空では登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    
    it "email重複では登録できないこと" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    
    it "passwordが空では登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    
    it "passwordが6文字以下では登録できないこと" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    
    it "passwordが入力されていてもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "全て揃えば登録可" do
      user = build(:user)
      expect(user).to be_valid
    end
    
    it "nicknameが6文字以下では登録できること" do
      user = build(:user, nickname: "aaaaaa")
      expect(user).to be_valid
    end
    
    it "passwordが7文字以上で登録できること" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end
    
    it "famiry_nameが全角平仮名、カタカナ、漢字では登録できること" do
      user = build(:user, famiry_name: "あ亜ア")
      expect(user).to be_valid
    end
    
    it "famiry_nameが全角平仮名、カタカナ、漢字では登録できること" do
      user = build(:user, first_name: "あ亜ア")
      expect(user).to be_valid
    end
    
    it "famiry_name_kanaが全角カタカナでは登録できること" do
      user = build(:user, famiry_name_kana: "アアア")
      expect(user).to be_valid
    end
    
    it "first_name_kanaが全角カタカナでは登録できること" do
      user = build(:user, first_name: "アアア")
      expect(user).to be_valid
    end
    
    it "adress_nameがなくても登録できること" do
      user = build(:user, adress_name: "")
      expect(user).to be_valid
    end
  end
end

