class Admin::ContractPdf < Prawn::Document
  def initialize(contract)
    super()
    @contract = contract
    @student = contract.student
    title
    text_content
  end

  def title
    y_position = cursor - 20
    bounding_box([80, y_position], :width => 270) do
      font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
        text_box "ДОГОВОР НА ОБУЧЕНИЕ № #{@contract.number}", :at => [120, 0], :align => :center
        move_down 10
      end
    end
  end

  def text_content
    y_position = cursor - 30

    bounding_box([30, y_position], :width => 500) do
      font ("#{Rails.root}/app/assets/fonts/7454.ttf") do
        text "#{@student.first_name} #{@student.last_name}", indent_paragraphs: 30
      end
    end
  end
end
