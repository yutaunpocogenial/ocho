class JudgesController < ApplicationController
    def new
        @judge = Judge.new(:value => "1")
    end

    def create
    # ストロングパラメータから精査されたデータだけをインスタンスに格納
    @judge = Judge.new(judge_params)

    # インスタンスの保存に成功した場合の処理
    if @judge.save
      flash[:success] = "ユーザを登録しました"
      redirect_to controller: 'opinions', action: 'show', id: @judge.opinion_id

    # インスタンスの保存に失敗した場合の処理
    else
      flash[:danger] = "ユーザの登録に失敗しました"
      render :new
    end
  end

  private

  def judge_params
    params.require(:judge).permit(:opinion_id, :which, :vote)
  end
end
