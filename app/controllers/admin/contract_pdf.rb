class Admin::ContractPdf < Prawn::Document
  def initialize(contract, template)
    super()
    @contract = contract
    @student = contract.student
    @template = template
    @period = "с #{@student.group.start.to_s} по #{@student.group.end.to_s}"
    # title
    # preambula
    text_content
  end

  def text_content
    y_position = cursor - 0
    bounding_box([30, y_position], :width => 500) do
      font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
        text_box "ДОГОВОР № #{@contract.number}", :at => [0, 0], :align => :center
        move_down 12
        text_box "#{@template.title}", :at => [0, 0], :align => :center
      end
      font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
        move_down 24
        text "г. Алматы                                                                                                                    #{@contract.date.day} #{get_month(@contract.date.month)} #{@contract.date.year} г.", :align => :justify
      end
      font ("#{Rails.root}/app/assets/fonts/7454.ttf") do
        move_down 12
        text "ТОО «Образовательный центр «Аттрактор Скул Алматы», именуемое в дальнейшем «Образовательный центр», в лице Директора Гудова Александра Олеговича, действующего на основании Устава с одной стороны, и", indent_paragraphs: 30, :align => :justify
        if @student.male?
          text "#{@student.last_name} #{@student.first_name} #{@student.middle_name}, ИИН #{@student.iin}, именуемый в дальнейшем «Студент», заключили настоящий договор на оказание услуг по обучению (далее – «Договор») о нижеследующем:", indent_paragraphs: 30, :align => :justify
        else
          text "#{@student.last_name} #{@student.first_name} #{@student.middle_name}, ИИН #{@student.iin}, именуемая в дальнейшем «Студент», заключили настоящий договор на оказание услуг по обучению (далее – «Договор») о нижеследующем:", indent_paragraphs: 30, :align => :justify
        end
      end

      @template.sections.order("number").each do |s|
        font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
          move_down 10
          text "#{s.number}. #{s.title}", :align => :center
          move_down 5
        end
        s.clauses.order("number").each do |c|
          font ("#{Rails.root}/app/assets/fonts/7454.ttf") do
            if c.body.include?('<Course>')
              text "#{c.number}. #{c.body.gsub! '<Course>', @student.group.course.name}", indent_paragraphs: 30, :align => :justify
            elsif c.body.include?('<period>')
              text "#{c.number}. #{c.body.gsub! '<period>', @period}", indent_paragraphs: 30, :align => :justify
            # elsif c.body.include?('<group_finish>')
              # text "#{c.number}. #{c.body.gsub! '<group_finish>', @student.group.end.to_s}", indent_paragraphs: 30, :align => :justify
            else
              text "#{c.number}. #{c.body}", indent_paragraphs: 30, :align => :justify
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
