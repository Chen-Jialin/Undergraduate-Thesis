# 估算 CdSe 量子点
from math import *
c = 3e8# 光速
h = 6.63e-34# 普朗克常数
epsilon_0 = 8.85e-12# 真空中介电常数
epsilon_r = 8.0251# CdSe 相对介电常数
e = 1.6e-19# 元电荷
m_e = 9.11e-31# 电子质量
m_e_eff = 0.12 * m_e# 电子有效质量
m_h_eff = 0.9 * m_e# 空穴有效质量
wavelength = 646# 波长 nm
E_gap = 1.74 * 1.6e-19# 体块材料带隙
Delta_E = h * c / (wavelength * 1e-9)# 量子点带隙
a = h**2 / 8 * (1 / m_e_eff + 1 / m_h_eff)
b = -1.8 * e**2 / 4 / pi / epsilon_0 / epsilon_r
c = E_gap - Delta_E
r = 1 / ((-b + sqrt(b**2 - 4 * a * c)) / (2 * a))
print(2 * r)
