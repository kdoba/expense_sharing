class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    if user_signed_in?
      @transactions = TransactionShare.joins(:transaction, :user).where(user_id: current_user.id).map{ |t| t.transaction}
      @sorted_transactions = @transactions.sort { |t1, t2|
        if (t1.paid == t2.paid)
          if (t1.confirm == t2.confirm)
            0
          elsif (t1.confirm)
            1
          else
            -1
          end
        elsif (t1.paid)
          1
        else
          -1
        end
      }
    else
      @transactions = Transaction.all
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save

        share_list = params[:transaction][:share_with].split(",")
        share_list.each do |item|
          if !@transaction.share_with = item
            format.html { render action: 'new' }
            format.json { render json: @transaction.errors, status: :unprocessable_entity }
            break
          end
        end

        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        @transaction.user_id = current_user.id
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction_id = @transaction.id
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.js { render :nothing => true }
    end
  end

  def confirm
    set_transaction
    @transaction.confirm = true
    respond_to do |format|
      if (@transaction.save)
        format.html { redirect_to transactions_url }
        format.js { render :nothing => true }
      end

    end
  end

  def pay
    set_transaction
    @transaction.paid = true
    respond_to do |format|
      if (@transaction.save)
        format.html { redirect_to transactions_url }
        format.js { render :nothing => true }
      end

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:date, :description, :amount, :user_id)
    end
end
