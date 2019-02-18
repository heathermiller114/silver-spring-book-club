#create members (email, password)
Member.destroy_all
member_list = [
    ["email1@gmail.com", "password1"],
    ["email2@gmail.com", "password2"],
    ["email3@gmail.com", "password3"],
    ["email4@gmail.com", "password4"]
]

member_list.each do |email, password|
    Member.create(email: email, password: password)
end

#create books (title, author, page count, plot, genre, member id)
Book.destroy_all
book_list = [
    ["Next Year in Havana", "Chanel Cleeton", 361, "After the death of her beloved grandmother, a Cuban-American woman travels to Havana, where she discovers the roots of her identity--and unearths a family secret hidden since the revolution...
        Havana, 1958. The daughter of a sugar baron, nineteen-year-old Elisa Perez is part of Cuba's high society, where she is largely sheltered from the country's growing political unrest--until she embarks on a clandestine affair with a passionate revolutionary...
        Miami, 2017. Freelance writer Marisol Ferrera grew up hearing romantic stories of Cuba from her late grandmother Elisa, who was forced to flee with her family during the revolution. Elisa's last wish was for Marisol to scatter her ashes in the country of her birth. 
        Arriving in Havana, Marisol comes face-to-face with the contrast of Cuba's tropical, timeless beauty and its perilous political climate. When more family history comes to light and Marisol finds herself attracted to a man with secrets of his own, she'll need the lessons of her grandmother's past to help her understand the true meaning of courage.", "Fiction", 1],
    ["Americanah", "Chimamanda Ngozi Adichie", 588, "Ifemelu and Obinze are young and in love when they depart military-ruled Nigeria for the West. Beautiful, self-assured Ifemelu heads for America, where despite her academic success, she is forced to grapple with what it means to be black for the first time. Quiet, thoughtful Obinze had hoped to join her, but with post-9/11 America closed to him, he instead plunges into a dangerous, undocumented life in London. Fifteen years later, they reunite in a newly democratic Nigeria, and reignite their passion—for each other and for their homeland.", "Fiction", 1],
    ["Becoming", "Michelle Obama", 463, "An intimate, powerful, and inspiring memoir by the former First Lady of the United States", "Autobiography", 2],
    ["The Sun Does Shine: How I Found Life and Freedom on Death Row", "Anthony Ray Hinton", 272, "A powerful, revealing story of hope, love, justice, and the power of reading by a man who spent thirty years on death row for a crime he didn't commit.", "Nonfiction", 2],
    ["An American Marriage", "Tayari Jones", 321, "Newlyweds Celestial and Roy are the embodiment of both the American Dream and the New South. He is a young executive, and she is an artist on the brink of an exciting career. But as they settle into the routine of their life together, they are ripped apart by circumstances neither could have imagined.", "Domestic Fiction", 3],
    ["Behold the Dreamers", "Imbolo Mbue", 402, "The novel details the experiences of two New York City families during the 2008 financial crisis: an immigrant family from Cameroon, the Jonga family, and their wealthy employers, the Edwards family.", "Domestic Fiction", 4]
]

book_list.each do |title, author, page_count, plot, genre, member_id|
    Book.create(title: title, author: author, page_count: page_count, plot: plot, genre: genre, member_id: member_id)
end


#create reviews (content, created at, updated at, member id, book id)
Review.destroy_all
review_list = [
    ["Behold the Dreamers is at once haunting, profound, and imminently readable.", 4, 6],
    ["This book was seriously so moving. Tayari created real people, people I feel like I know or went to church or school with and it's always a treat when an author writes a story so complex that you're not actually sure whose side you're supposed to be on.", 3, 5],
    ["If there are books and there are novels, this is a story. It’s a powerful story full of loss, love, pain, honesty, hope, and, ultimately, survival.",2, 4],
    ["What comes across most in this book is Michelle Obama’s lack of self-pity combined with clarity of vision.",2, 3],
    ["I just have to say this first: I LOVED this book! And I also have to say that it was a little out of my comfort zone.", 1, 2],
    ["This book was an amazing read! Chanel Cleeton did her research and captures the romance and myth, of old and new Cuba with so much passion, it bleeds all over the pages!", 1, 1]
]

review_list.each do |content, member_id, book_id|
    Review.create(content: content, member_id: member_id, book_id: book_id)
end