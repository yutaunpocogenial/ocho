class OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]

  def popular
    @opinions = Opinion.all
  end

  def speed
   
    #@opinions = Opinion.all.order(created_at: :desc)
    @opinions0 = Opinion.all.select('opinions.*', 'count(comments.id) AS comments')
                           .left_joins(:comments)
                           .group('opinions.id')
                           .order('comments desc')
                           .limit(5)


    @opinions = Opinion.all.order(created_at: :desc)

    
    
    @comments = Comment.where(opinion_id: @opinion)

  end

  def search
    @opinions = Opinion.search(params[:search])
  end

  def sport
    @opinions = Opinion.where(category: "スポーツ" ).order(created_at: :desc)

    @opinions1 = Opinion.where(category: "スポーツ" ).select('opinions.*', 'count(comments.id) AS comments')
    .left_joins(:comments)
    .group('opinions.id')
    .order('comments desc')
    .limit(5)

  end

  def tech
    @opinions = Opinion.where(category: "テクノロジー" ).order(created_at: :desc)

    @opinions2 = Opinion.where(category: "テクノロジー" ).select('opinions.*', 'count(comments.id) AS comments')
    .left_joins(:comments)
    .group('opinions.id')
    .order('comments desc')
    .limit(5)

  end

  def pol
    @opinions = Opinion.where(category: "政治" ).order(created_at: :desc)

    @opinions3 = Opinion.where(category: "政治" ).select('opinions.*', 'count(comments.id) AS comments')
      .left_joins(:comments)
      .group('opinions.id')
      .order('comments desc')
      .limit(5)
    
  end

  def enta
    @opinions = Opinion.where(category: "エンタメ" ).order(created_at: :desc)

    @opinions4 = Opinion.where(category: "エンタメ" ).select('opinions.*', 'count(comments.id) AS comments')
    .left_joins(:comments)
    .group('opinions.id')
    .order('comments desc')
    .limit(5)
  end

  def econo
    @opinions = Opinion.where(category: "経済" ).order(created_at: :desc)

    @opinions5 = Opinion.where(category: "経済" ).select('opinions.*', 'count(comments.id) AS comments')
      .left_joins(:comments)
      .group('opinions.id')
      .order('comments desc')
      .limit(5)
  end

  def cul
    @opinions = Opinion.where(category: "文化" ).order(created_at: :desc)

    @opinions6 = Opinion.where(category: "文化" ).select('opinions.*', 'count(comments.id) AS comments')
      .left_joins(:comments)
      .group('opinions.id')
      .order('comments desc')
      .limit(5)
  end

  def about
  end


  def contact
  end

  def mypage
    @opinions = Opinion.where(user_id: current_user.id )
  end

 


  # GET /opinions
  # GET /opinions.json
  def index

   @opinions = Opinion.all


  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show
    @comment = @opinion.comments.build
    
    @comments = Comment.where(opinion_id: @opinion)

    @judge = @opinion.judges.build

    @judges = Judge.where(opinion_id: @opinion)

    @judgesall = Judge.where(opinion_id: @opinion).count
    @judgesgood = Judge.where(opinion_id: @opinion).where(which: "good").count
    @judgesbad = Judge.where(opinion_id: @opinion).where(which: "bad").count
    
    

    @users = User.where()

    @like = Like.new
  end

  # GET /opinions/new
  

  # GET /opinions/1/edit
  def edit
  end

  

  def new
    @opinion = current_user.opinions.build
    @ip ||= super
  end

  def submit
    
    if user_signed_in? 
      @opinion = current_user.opinions.build
    else 
      @opinion = Opinion.new
   end 

  end

  # POST /opinions
  # POST /opinions.json
  def create

    @opinion = Opinion.new(opinion_params)
    

    

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to controller: 'opinions', action: 'speed' }
        format.json { render :show, status: :created, location: @opinion }
      else
        format.html { render :new }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: '投稿が削除されました。' }
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.html { render :edit }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to speed_path, notice: '投稿が削除されました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opinion_params
      params.require(:opinion).permit(:title, :url, :content, :user_id, :category)
    end

  end
