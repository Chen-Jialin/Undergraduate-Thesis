时域上，泵浦脉冲1：
$$
\bm{E}_1(\bm{r},t)=\bm{\mathcal{E}}_1(\bm{r},t+\tau)e^{i[\omega_1(t+\tau)-\bm{k}\cdot\bm{r}]}e^{i\phi_1}
$$
泵浦脉冲2：
$$
\bm{E}_2(\bm{r},t)=\bm{\mathcal{E}}_1(\bm{r},t)e^{i[\omega_1t-\bm{k}_1\cdot\bm{r}]}e^{i\phi_2}
$$
探测脉冲：
$$
\bm{E}_3(\bm{r},t)=\bm{\mathcal{E}}_2(\bm{r},t-T)e^{i[\omega_2(t-T)-\bm{k}_2\cdot\bm{r}]}
$$
注意三个脉冲在时域上的宽度非常窄，故$\bm{\mathcal{E}}(x)$ 仅在 $x=0$ 附近的很小范围内非零.

频域上，泵浦脉冲1：
$$
\bm{E}_1(\bm{r},\omega)=\bm{\tilde{\mathcal{E}}}_1(\bm{r},\omega-\omega_1)e^{i(\omega\tau-\bm{k}\cdot\bm{r})}e^{i\phi_1}
$$
泵浦脉冲2：
$$
\bm{E}_2(\bm{r},\omega)=\bm{\tilde{\mathcal{E}}}_1(\bm{r},\omega-\omega_1)e^{-i\bm{k}_1\cdot\bm{r}}e^{i\phi_2}
$$
探测脉冲：
$$
\bm{E}_3(\bm{r},\omega)=\bm{\tilde{\mathcal{E}}}_2(\bm{r},\omega-\omega_2)e^{i(-\omega T-\bm{k}_2\cdot\bm{r})}
$$

三阶密度矩阵响应：
$$
\hat{\rho}^{(3)}(\bm{r},t)=\left(-\frac{i}{\hbar}\right)^3\int_{-\infty}^t\mathrm{d}\tau_3\int_{-\infty}^{\tau_3}\mathrm{d}\tau_2\int_{-\infty}^{\tau_2}\mathrm{d}\tau_1\left[\hat{H}_I(\tau_3),\left[\hat{H}_I(\tau_2),\left[\hat{H}_I(\tau_1),\rho^{(0)}(0)\right]\right]\right]
$$
其中初始时刻的密度矩阵
$$
\hat{\rho}^{(0)}(\bm{r},t)=\frac{1}{1+\exp[-\beta E_1]+\exp[-\beta E_2]+\exp[-\beta E_3]}\lvert 0\rangle\langle 0\rvert+\\
\frac{\exp[-\beta E_1]}{1+\exp[-\beta E_1]+\exp[-\beta E_2]+\exp[-\beta E_3]}\lvert 1\rangle\langle 1\rvert+\\
\frac{\exp[-\beta E_2]}{1+\exp[-\beta E_1]+\exp[-\beta E_2]+\exp[-\beta E_3]}\lvert 2\rangle\langle 2\rvert+\\
\frac{\exp[-\beta E_3]}{1+\exp[-\beta E_1]+\exp[-\beta E_2]+\exp[-\beta E_3]}\lvert 3\rangle\langle 3\rvert\approx\lvert 0\rangle\langle 0\rvert
$$
$$
\beta=\frac{1}{k_BT}
$$
相互作用哈密顿量
$$
\hat{H}_I(\tau_1)=\bm{p}\cdot\bm{E}_1(\bm{r},\tau_1)=\sum_{m,n}\bm{p}_{mn}\cdot\bm{E}_1(\bm{r},\tau_1)\lvert m\rangle\langle n\rvert
$$
$$
\hat{H}_I(\tau_2)=\bm{p}\cdot\bm{E}_2(\bm{r},\tau_2)=\sum_{j,k}\bm{p}_{jk}\cdot\bm{E}(\bm{r},\tau_2)\lvert j\rangle\langle k\rvert
$$
$$
\hat{H}_I(\tau_3)=\bm{p}\cdot\bm{E}_3(\bm{r},\tau_3)=\sum_{s,t}\bm{p}_{st}\cdot\bm{E}(\bm{r},\tau_3)\lvert s\rangle\langle t\rvert
$$
在 $\bm{k}_2$ 方向上的非线性响应
$$
\hat{\rho}^{(3)}(t)=\left(-\frac{i}{\hbar}\right)^3\int_{-\infty}^t\mathrm{d}\tau_3\int_{-\infty}^{\tau_3}\mathrm{d}\tau_2\int_{-\infty}^{\tau_2}\mathrm{d}\tau_1\hat{U}(t-\tau_3)\hat{H}_I^*(\tau_2)\hat{U}_0(\tau_2-\tau_1)\hat{H}_I(\tau_1)\hat{\rho}^{(0)}(0)\hat{U}_0(-(\tau_2-\tau_1))\hat{U}(-(t-\tau_3))\\
$$

