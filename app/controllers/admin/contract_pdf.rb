class Admin::ContractPdf < Prawn::Document
  def initialize(contract)
    super()
    @contract = contract
    @student = contract.student
    title
    text_content
    section_1
    section_2
  end

  def title
    y_position = cursor - 20
    bounding_box([80, y_position], :width => 270) do
      font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
        text_box "ДОГОВОР № #{@contract.number}", :at => [110, 0], :align => :center
        move_down 12
        text_box "на оказание услуг по обучению", :at => [100, 0], :align => :center
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
      font ("#{Rails.root}/app/assets/fonts/7454.ttf") do
        text "ТОО «Образовательный центр «Аттрактор Скул Алматы», именуемое в дальнейшем «Образовательный центр», в лице Директора Гудова Александра Олеговича, действующего на основании Устава с одной стороны, и", indent_paragraphs: 30
        move_down 12
        text "Гражданин РК, #{@student.first_name} #{@student.last_name} #{@student.middle_name}, ИИН #{@student.iin}, именуемый в дальнейшем «Студент», заключили настоящий договор на оказание услуг по обучению (далее – «Договор») о нижеследующем:", indent_paragraphs: 30
      end
    end
  end

  def section_1
    y_position = cursor - 10
    bounding_box([80, y_position], :width => 270) do
      font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
        text_box "1. ПРЕДМЕТ ДОГОВОРА", :at => [110, 0], :align => :center
        move_down 12
      end
    end
    bounding_box([30, y_position], :width => 500) do
      font ("#{Rails.root}/app/assets/fonts/7454.ttf") do
        move_down 12
        text "1.1. Образовательный центр обязуется оказать Услуги по обучению Студента по дисциплине <наименование курса> (далее – «Дисциплина»), а Студент обязуется принять и оплатить услуги Образовательного центра (далее – «Услуги») на условиях, определенных Сторонами в настоящем Договоре.", indent_paragraphs: 30
        text "1.2. Срок обучения: 12 месяцев, с <дата начала курса> по <дата окончания курса>.", indent_paragraphs: 30
        text "1.3. Место проведения обучения: г. Алматы, пр. Жибек Жолы д. 135, 8 этаж.", indent_paragraphs: 30
      end
    end
  end

  def section_2
    y_position = cursor - 10
    bounding_box([40, y_position], :width => 370) do
      font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
        text_box "2. ПРАВА И ОБЯЗАННОСТИ СТОРОН", :at => [110, 0], :align => :center
        move_down 12
      end
    end
    bounding_box([30, y_position], :width => 500) do
      font ("#{Rails.root}/app/assets/fonts/7454.ttf") do
        move_down 12
        text "2.1.  Образовательный центр обязан:", indent_paragraphs: 30
        text "2.1.1. провести обучение Студента согласно программе обучения, являющейся Приложением к Договору, в соответствии с внутренними правилами, требованиями, и расписанием, действующем в Образовательном центре;", indent_paragraphs: 30
        text "2.1.2.  для выполнения своих обязательств привлекать преподавателей, квалификация и практический опыт, которых соответствуют требованиям Образовательного центра;", indent_paragraphs: 30
        text "2.1.3.  в период действия Договора, обеспечить беспрепятственный доступ Студентов в помещения Образовательного центра и предоставить право пользования учебно-материальной базой;", indent_paragraphs: 30
        text "2.1.4.  в случае полного и успешного прохождения учебной программы, выдать Студенту свидетельство, подтверждающее успешное окончание Курса с оценкой, определяющей уровень освоения программы обучения.", indent_paragraphs: 30
        move_down 12
        text "2.2. Образовательный центр вправе:", indent_paragraphs: 30
        text "2.2.1.  оценивать успеваемость Студента в соответствии с внутренними правилами Образовательного центра и мнения преподавателей;", indent_paragraphs: 30
        text "2.2.2.  корректировать программу обучения, с целью улучшения ее усвоения Студентами. При этом, Стороны договорились, что такие изменения не будут являться существенными изменения условий настоящего Договора;", indent_paragraphs: 30
        text "2.2.3.  расторгнуть настоящий Договор на условиях и в порядке, определенном в Договоре;", indent_paragraphs: 30
      end
    end
  end

  def get_month(month)
    if month == 1
      return 'января'
    end
  end
end
