class UserSessionsController < ApplicationController




  def show
    # @user_session = current_or_guest_user.user_sessions.find(params[:id])
    @user_session = UserSession.find(params[:id])
    @playlist = @user_session.session.playlist
    if params[:current_question].present?
      @current_question = Question.find(params[:current_question])
      @next_question = Question.where(session_id: @user_session.session_id).where("id > ?", @current_question).first
      if @next_question.nil?
        # go to results
        redirect_to play_session_results_path(@user_session.id)
      else
        # go to next question
        @current_question = @next_question
      end
    else
      # first creates an array of the same length of the playlist like this [0,1...length of playlist]
      # then shuffles it
      # then takes just the n entries, where n = number selected
      # then for each on this array, creates a new song using the value in the array as the number on the playlist
      # if Question.where(session_id: @user_session.session_id).count == 0
      #   array = (0..Song.where(playlist_id: @playlist.id).count-1).to_a.shuffle.first(@user_session.session.number_of_questions)
      #   array.each do |song|
      #     Question.create(session_id: @user_session.session_id, song: Song.where(playlist_id: @playlist.id)[song])
      #   end
      # end
      @current_question = Question.where(session_id: @user_session.session_id).first
    end
  end


  def share_card
    # Trouver la UserSession
    @user_session = UserSession.find(params[:id])
    @questions = @user_session.session.questions
    @playlist = @user_session.session.playlist


      # Calculer le score
    @total_questions = @questions.count
    @correct_titles = @questions.where(successful_title: true).count
    @correct_artists = @questions.where(successful_artist: true).count
    @score = @correct_titles + @correct_artists
    @max_score = @total_questions * 2
    @percentage = @max_score > 0 ? (@score.to_f / @max_score * 100).round : 0

    # Calculer les mêmes stats que pour results
    if @questions.any?
      @fastest_response = @questions.order(:time_taken).first

      # Le titre trouvé le plus vite (uniquement les titres corrects)
      @fastest_title = @questions
        .where(successful_title: true)  # seulement les titres corrects
        .order(:time_taken)             # tri des temps de réponse du + court au + long
        .first                          # renvoie le temps le plus rapide
    else
      @fastest_response = nil
      @fastest_title = nil
    end

    # render layout: false
  end




  def results
    # 1. Trouver la UserSession
    @user_session = UserSession.find(params[:id])
    @questions = @user_session.session.questions
    @playlist = @user_session.session.playlist

    @total_questions = @questions.count
    @correct_titles = @questions.where(successful_title: true).count
    @correct_artists = @questions.where(successful_artist: true).count

    @score = @correct_titles + @correct_artists # score du joueur(1 point par titre, 1 point par artiste)
    @max_score = @total_questions * 2  # score max qui peut etre obtenu

    @percentage = @max_score > 0 ? (@score.to_f / @max_score * 100).round : 0 # calcul du pourcentage en évitant l division par zéro

    # 1. Le temps de réponse le plus rapide (toutes questions confondues)
    if @questions.any?
      @fastest_response = @questions.order(:time_taken).first

    # 2. Le titre trouvé le plus vite (uniquement les titres corrects)
    @fastest_title = @questions
      .where(successful_title: true)  # seulement les titres corrects
      .order(:time_taken)             # tri des temps de réponse du + court au + long
      .first                          # renvoie le temps le plus rapide
    else
      @fastest_response = nil
      @fastest_title = nil
    end

    # results for match mode
    # who guessed the most correctly?
    # first find the group
    # find all user sessions for this group
    # for each user session, search in the Questions for how many times their user ID appears
    
    @group = @user_session.group
    @user_session_list = UserSession.where(group_id: @group.id)
    @questions

  end

  def share
    @user_session = current_or_guest_user.user_sessions.find(params[:id])
    @questions = @user_session.session.questions
    @playlist = @user_session.session.playlist

    @total_questions = @questions.count
    @correct_titles = @questions.where(successful_title: true).count
    @correct_artists = @questions.where(successful_artist: true).count
    @score = @correct_titles + @correct_artists
    @max_score = @total_questions * 2
    @percentage = @max_score > 0 ? (@score.to_f / @max_score * 100).round : 0

    if @questions.any?
      @fastest_title = @questions
        .where(successful_title: true)
        .order(:time_taken)
        .first
    else
      @fastest_title = nil
    end
  end

end
