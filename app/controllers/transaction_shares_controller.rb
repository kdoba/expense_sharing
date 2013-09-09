class TransactionSharesController < ApplicationController
  before_action :set_transaction_share, only: [:show, :edit, :update, :destroy]

  # GET /transaction_shares
  # GET /transaction_shares.json
  def index
    @transaction_shares = TransactionShare.all
  end

  # GET /transaction_shares/1
  # GET /transaction_shares/1.json
  def show
  end

  # GET /transaction_shares/new
  def new
    @transaction_share = TransactionShare.new
  end

  # GET /transaction_shares/1/edit
  def edit
  end

  # POST /transaction_shares
  # POST /transaction_shares.json
  def create
    @transaction_share = TransactionShare.new(transaction_share_params)

    respond_to do |format|
      if @transaction_share.save
        format.html { redirect_to @transaction_share, notice: 'Transaction share was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction_share }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaction_shares/1
  # PATCH/PUT /transaction_shares/1.json
  def update
    respond_to do |format|
      if @transaction_share.update(transaction_share_params)
        format.html { redirect_to @transaction_share, notice: 'Transaction share was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction_shares/1
  # DELETE /transaction_shares/1.json
  def destroy
    @transaction_share.destroy
    respond_to do |format|
      format.html { redirect_to transaction_shares_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction_share
      @transaction_share = TransactionShare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_share_params
      params.require(:transaction_share).permit(:transaction_id, :user_id)
    end
end
