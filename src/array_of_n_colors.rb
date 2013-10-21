
# HSV values in [0..1[
# returns [r, g, b] values from 0 to 255
def hsv_to_rgb(h, s, v)
  h_i = (h*6).to_i
  f = h*6 - h_i
  p = v * (1 - s)
  q = v * (1 - f*s)
  t = v * (1 - (1 - f) * s)
  r, g, b = v, t, p if h_i==0
  r, g, b = q, v, p if h_i==1
  r, g, b = p, v, t if h_i==2
  r, g, b = p, q, v if h_i==3
  r, g, b = t, p, v if h_i==4
  r, g, b = v, p, q if h_i==5
  [(r*255).to_i, (g*255).to_i, (b*255).to_i]
end

def main(colors_to_generate)
    step = 1 / colors_to_generate.to_f
    result = []
    current = 0
    colors_to_generate.times do |i|
        color = hsv_to_rgb(current, 1, 1)
        result << color
        current += step
    end
    return result
end

main(ARGV[0].to_i || 10).each { |color|
    puts '#' + color.map {|c| "%02X" % c}.join('')
}