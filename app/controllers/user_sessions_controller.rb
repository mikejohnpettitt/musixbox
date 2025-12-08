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
      array = (0..Song.where(playlist_id: @playlist.id).count-1).to_a.shuffle.first(@user_session.session.number_of_questions)
      array.each do |song|
        Question.create(session_id: @user_session.session_id, song: Song.where(playlist_id: @playlist.id)[song])
      end
      @current_question = Question.where(session_id: @user_session.session_id).first
    end
  end


  def share_card
    # 1. Trouve la UserSession
    @user_session = UserSession.find(params[:id])
    @questions = @user_session.session.questions

    # 2. Vérifie les permissions (comme pour results)
    # (Optionnel, mais recommandé)

    # 3. Calcule les mêmes stats que pour results
    # Tu peux réutiliser la même logique
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
    # 4. IMPORTANT : Pas de layout ou layout spécial
    render layout: false  # ou 'share_card' si tu crées un layout spécial
  end



  def results
          # 1. Trouver la UserSession
    # @user_session = UserSession.find(params[:id])
    @user_session = UserSession.find(params[:id])
    @questions = @user_session.session.questions

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
  end

  def share
    @user_session = current_or_guest_user.user_sessions.find(params[:id])
  end

end
