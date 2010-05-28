class PollsController < ApplicationController
  # GET /polls
  # GET /polls.xml
  def index
    @polls = Poll.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @polls }
    end
  end

  # GET /polls/1
  # GET /polls/1.xml
  def show
    @poll = Poll.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @poll }
    end
  end

  # GET /polls/1/edit
  def edit
    @poll = Poll.find(params[:id])
  end

  # PUT /polls/1
  # PUT /polls/1.xml
  def update
    @poll = Poll.find(params[:id])

    respond_to do |format|
      if @poll.update_attributes(params[:poll])
        format.html { redirect_to(@poll, :notice => 'Poll was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @poll.errors, :status => :unprocessable_entity }
      end
    end
  end

  def upcoming
    @poll = Poll.pending.first
    render :show
  end
  
  def ongoing
    @poll = Poll.ongoing.first
    render :show
  end
end
