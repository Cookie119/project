class NoticesController < ApplicationController
  before_action :set_notice, only: %i[ show edit update destroy ]

  # GET /notices or /notices.json
  def index
    @notices = Notice.all
  end

  # GET /notices/1 or /notices/1.json
  def show
    
    @notice = Notice.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf { render_notice_pdf(@notice) }
    end
  end

  # GET /notices/new
  def new
    @notice = Notice.new
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices or /notices.json
  def create
    @notice = Notice.new(notice_params)

    respond_to do |format|
      if @notice.save
        format.html { redirect_to notice_url(@notice), notice: "Notice was successfully created." }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1 or /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to notice_url(@notice), notice: "Notice was successfully updated." }
        format.json { render :show, status: :ok, location: @notice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1 or /notices/1.json
  def destroy
    @notice.destroy!

    respond_to do |format|
      format.html { redirect_to notices_url, notice: "Notice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def render_notice_pdf(notice)
    font_path = Rails.root.join('app', 'assets', 'fonts', 'Arial-Unicode-Regular.ttf')
    pdf = Prawn::Document.new

    pdf.font_families["Arial-Unicode-Regular"] = {
  normal: { file: font_path }
}
   # Define the font and size for the notice
   pdf.font("Arial-Unicode-Regular")
pdf.font_size(12)

# School Name
pdf.text_box("LOKVISHWAS PRATISHTHAN", align: :center, size: 20 , at: [0, pdf.bounds.height], width: pdf.bounds.width)
pdf.move_down(25)
pdf.text("9XQW+R9C, Yashwant Nagar, Queula", align: :center,size: 10 )
pdf.move_down(5)
pdf.text(" Ponda, Goa 403401", align: :center,size: 10 )

pdf.stroke_horizontal_line(-40, pdf.cursor - 10, :at => pdf.cursor - 10, :width => pdf.bounds.width)

# Title
pdf.move_down(60)
pdf.text("NOTICE", align: :center, size: 20 )


line_start = pdf.bounds.width / 2 - 80
line_end = pdf.bounds.width / 2 + 80 
pdf.stroke_horizontal_line(line_start, line_end, at: pdf.cursor)

# Date
pdf.text_box("Date: #{notice.created_at.strftime('%Y-%m-%d')}",
             at: [pdf.bounds.width - 100, pdf.bounds.height - 90],
             width: pdf.bounds.width)


# Subject
pdf.move_down(30)
pdf.text("Subject: #{notice.title}", size: 12)



# Content
pdf.move_down(30)
pdf.text(notice.content)

# For Staff Only
pdf.move_cursor_to(80)
pdf.text("For #{notice.category.name}", align: :right)


# Save or render the PDF

    if notice.image.attached?
      image_data = notice.image.download
      pdf.image StringIO.new(image_data), width: 200
    end
  
    send_data pdf.render, filename: "#{notice.title}.pdf", type: "application/pdf", disposition: "inline"

  end

    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notice_params
      params.require(:notice).permit(:title, :content, :category_id)
    end
end
