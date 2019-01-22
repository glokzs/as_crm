class Admin::ContractPdf < Prawn::Document
  def initialize(contract, template)
    super()
    @contract = contract
    @student = contract.student
    @template = template
    title
    text_content
  end

  def title
    y_position = cursor - 20
    bounding_box([80, y_position], :width => 270) do
      font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
        text_box "ДОГОВОР № #{@contract.number}", :at => [110, 0], :align => :center
        move_down 12
        text_box "#{@template.title}", :at => [100, 0], :align => :center
      end
    end
    bounding_box([30, y_position], :width => 500) do
      font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
        move_down 34
        text "г. Алматы                                                                                                                    #{@contract.date.day} #{get_month(@contract.date.month)} #{@contract.date.year} г.", :align => :justify
      end
    end
  end

  def text_content
    y_position = cursor - 10
    bounding_box([30, y_position], :width => 500) do
      @template.sections.each do |s|
        font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
          move_down 12
          text_box "#{s.number}. #{s.title}", :at => [10, 0], :align => :center
          move_down 12
        end
        s.clauses.each do |c|
          font ("#{Rails.root}/app/assets/fonts/7454.ttf") do
            if c.body.include?('<Course>')
              text "#{c.number} #{c.body.gsub! '<Course>', @student.group.course.name}", indent_paragraphs: 30, :align => :justify
            else
              text "#{c.number} #{c.body}", indent_paragraphs: 30, :align => :justify
            end
          end
        end
      end
    end
  end



  def get_month(month)
    if month == 1
      return 'января'
    elsif month == 2
      return 'февраля'
    end
  end
end
