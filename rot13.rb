def rot13 m
  res = ""
  m.each_char do |c|
    if ('a'..'z').include? c
      c = c.ord
      c += 13
      if c > 'z'.ord
        c -= 26
      end
      res << c.chr
    elsif ('A'..'Z').include? c
      c = c.ord
      c += 13
      if c > 'Z'.ord
        c -= 26
      end
      res << c.chr
    else
      res << c
    end

  end

  res
end
x =  rot13("hello")
p rot13(x)
m = "cvpbPGS{arkg_gvzr_V'yy_gel_2_ebhaqf_bs_ebg13_Ncualgvd}"

p rot13(m)
m2 = ""
