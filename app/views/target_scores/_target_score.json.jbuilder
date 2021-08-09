json.extract! target_score, :id, :math, :english, :science, :student_id, :created_at, :updated_at
json.url target_score_url(target_score, format: :json)

# 上と下は記述は違うが同じ表示方法 json.extract!・・・第一引数に指定したインスタンス変数のデータをJSON形式の文字列で返却

# json.id @target_score.id
# json.math @target_score.math
# json.english @target_score.english
# json.science @target_score.science
# json.created_at @target_score.created_at


# json.array! target_scores, :id, :math, :english, :science, :student_id, :created_at
# json.array!・・・モデルの全てのインスタンスを、配列に格納されたJSON形式の文字列データで返却


# json.target_scores do
#   json.array! @target_scores, :id, :math, :english, :science, :student_id, :created_at
# end