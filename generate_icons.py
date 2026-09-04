import math
from PIL import Image, ImageDraw

def create_lotus_icon(size):
    img = Image.new("RGBA", (size, size), (62, 53, 50, 255)) # #3e3532 background
    draw = ImageDraw.Draw(img)
    cx, cy = size / 2, size / 2
    r_outer = size * 0.42

    # Outer subtle ring
    draw.ellipse([cx - r_outer, cy - r_outer, cx + r_outer, cy + r_outer], outline=(230, 215, 159, 100), width=int(size*0.015))

    # Lotus petals
    petals = 12
    r_petal = size * 0.22
    for i in range(petals):
        angle = (2 * math.pi / petals) * i
        px = cx + (size * 0.16) * math.cos(angle)
        py = cy + (size * 0.16) * math.sin(angle)
        draw.ellipse([px - r_petal, py - r_petal, px + r_petal, py + r_petal], outline=(230, 215, 159, 140), width=int(size*0.012))

    # Inner core glow
    r_inner = size * 0.12
    draw.ellipse([cx - r_inner, cy - r_inner, cx + r_inner, cy + r_inner], fill=(202, 122, 101, 230)) # #ca7a65

    # Center dot
    r_center = size * 0.05
    draw.ellipse([cx - r_center, cy - r_center, cx + r_center, cy + r_center], fill=(242, 232, 220, 255))

    return img

if __name__ == "__main__":
    icon192 = create_lotus_icon(192)
    icon192.save("icon-192.png")
    icon512 = create_lotus_icon(512)
    icon512.save("icon-512.png")
    print("PWA icons generated successfully!")
