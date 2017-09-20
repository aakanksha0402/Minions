class SearchController < ApplicationController
  FILTERS = %w(books authors)

  def index
    @query = params[:q]
    @counts = {}
    limit = params[:limit] ? params[:limit].to_i : nil

    @results = FILTERS.inject([]) do |sum, g|
      objs = self.send(g, @query, limit).map { |o| hash_for(o, g) }
      @counts[g] = objs.count
      limit -= objs.length if limit
      sum.push(*objs)
    end

    # @results = Book.all
    respond_to do |format|
      format.html
      format.json { render json: @results.to_json }
    end
  end

  private

  def books(q, limit, filters = {})
    Book.where("title ILIKE ?", "%#{q}%").limit(limit).order(:title)
  end

  def authors(q, limit, filters = {})
    authors = Author.where("name ILIKE :q", q: "#{q}%").order(:name).limit(limit)
  end

  def hash_for(obj, group)
    { url: url_for(obj), id: obj.id, type: group.to_s.singularize,
      name: obj.to_s, modified: obj.updated_at,
      description: obj.try(:short_description) || obj.try(:email) || obj.try(:text)}
  end
end
