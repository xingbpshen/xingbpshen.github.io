---
permalink: /
title: ""
excerpt: ""
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

{% if site.google_scholar_stats_use_cdn %}
{% assign gsDataBaseUrl = "https://cdn.jsdelivr.net/gh/" | append: site.repository | append: "@" %}
{% else %}
{% assign gsDataBaseUrl = "https://raw.githubusercontent.com/" | append: site.repository | append: "/" %}
{% endif %}
{% assign url = gsDataBaseUrl | append: "google-scholar-stats/gs_data_shieldsio.json" %}

<span class='anchor' id='about-me'></span>

I am a first-year Ph.D. student in Computer Science at the University of Ottawa, EECS, supervised by Prof. [Changjian Shui](https://cjshui.github.io). Previously, I completed my M.Sc. in Electrical Engineering at McGill University and Mila - Quebec AI Institute under the supervision of Prof. [Tal Arbel](https://cim.mcgill.ca/~arbel/). I also received my B.Eng. in Computer Engineering from McGill University.

My research focuses on advancing theories and algorithms for trustworthy machine learning, especially on uncertainty quantification, calibration, and generalization, with application in multimodal artificial intelligence for healthcare.

# 📰 News
- *2025.11*: &nbsp; Our paper "BayesAgent: Bayesian Agentic Reasoning Under Uncertainty via Verbalized Probabilistic Graphical Modeling" has been accepted to <b>AAAI 2026</b>.
- *2025.10*: &nbsp; Our <b>Calibration Guidance Prompt Generator 1.5B</b> model is now live on Hugging Face 🤗 ! [[**Link**](https://huggingface.co/xingshen/prompt4trust-cgpgenerator-1.5B)]

# 📝 Publications 

<div class='paper-box'><div class='paper-box-image'><div><div class="badge">AAAI 2026</div><img src='images/bayesagent.png' alt="sym" width="100%"></div></div>
<div class='paper-box-text' markdown="1">

[BayesAgent: Bayesian Agentic Reasoning Under Uncertainty via Verbalized Probabilistic Graphical Modeling](https://arxiv.org/abs/2406.05516)

Hengguan Huang\*, **Xing Shen**\*, Guang-Yuan Hao, Songtao Wang, Lingfa Meng, Dianbo Liu, David Alejandro Duchene, Hao Wang, and Samir Bhatt

_(*equal contribution)_ [[**Code**](https://github.com/xingbpshen/agentic-reasoning-vpgm)] [[**Appendix**](https://github.com/xingbpshen/agentic-reasoning-vpgm/blob/main/assets/appendix.pdf)]

**_The 40th Annual AAAI Conference on Artificial Intelligence_, 2026**
</div>
</div>

<div class='paper-box'><div class='paper-box-image'><div><div class="badge">MICCAI 2025</div><img src='images/caline.png' alt="sym" width="100%"></div></div>
<div class='paper-box-text' markdown="1">

[Exposing and Mitigating Calibration Biases and Demographic Unfairness in MLLM Few-Shot In-Context Learning for Medical Image Classification](https://link.springer.com/chapter/10.1007/978-3-032-04981-0_22)

**Xing Shen**, Justin Szeto, Mingyang Li, Hengguan Huang, and Tal Arbel

[[**Code**](https://github.com/xingbpshen/medical-calibration-fairness-mllm)] [[**Preprint**](https://arxiv.org/abs/2506.23298)]

**_The 28th International Conference on Medical Image Computing and Computer Assisted Intervention_, 2025**
</div>
</div>

<div class='paper-box'><div class='paper-box-image'><div><div class="badge">IEEE Trans. Med. Imaging</div><img src='images/ladine.png' alt="sym" width="100%"></div></div>
<div class='paper-box-text' markdown="1">

[Improving Robustness and Reliability in Medical Image Classification with Latent-Guided Diffusion and Nested-Ensembles](https://ieeexplore.ieee.org/document/11059995)

**Xing Shen**, Hengguan Huang, Brennan Nichyporuk, and Tal Arbel

[[**Code**](https://github.com/xingbpshen/nested-diffusion)] [[**Preprint**](https://arxiv.org/abs/2310.15952)]

**_IEEE Transactions on Medical Imaging_, 2025**
</div>
</div>

- [Prompt4Trust: A Reinforcement Learning Prompt Augmentation Framework for Clinically-Aligned Confidence Calibration in Multimodal Large Language Models](https://openaccess.thecvf.com/content/ICCV2025W/CVAMD/html/Kriz_Prompt4Trust_A_Reinforcement_Learning_Prompt_Augmentation_Framework_for_Clinically-Aligned_Confidence_ICCVW_2025_paper.html)<br>Anita Kriz\*, Elizabeth Laura Janes\*, **Xing Shen**\*, and Tal Arbel<br>_(*equal contribution)_ [[**Code**](https://github.com/xingbpshen/prompt4trust)] [[**Model**](https://huggingface.co/xingshen/prompt4trust-cgpgenerator-1.5B)] [[**Preprint**](https://arxiv.org/abs/2507.09279)]<br>**_IEEE/CVF International Conference on Computer Vision (ICCV) Workshops_, 2025**

# 🎖 Honors and Awards
- University of Ottawa Ph.D. Research Fellowship (2026)
- Graduate Research and Enhancement Travel (GREAT) Award (2025)
- Healthy Brains, Healthy Lives (HBHL) Graduate Student Fellowship - funded via Canada First Research Excellence Fund (CFREF) (2024)
- McGill University Master's Research Fellowship (2024)
- McGill Faculty of Engineering Class 2023 Distinction
- McGill Summer Undergraduate Research in Engineering (SURE) Award (2023)

# 🎓 Education
- *2026.01 - now*: &nbsp; **Ph.D. in Computer Science**, University of Ottawa.
- *2024.01 - 2025.12*: &nbsp; **M.Sc. in Electrical Engineering**, McGill University and Mila - Quebec AI Institute. **GPA 4.0/4.0**.
- *2018.09 - 2023.05*: &nbsp; **B.Eng. in Computer Engineering**, McGill University. **Graduated with Distinction**. 

# 💻 Professional Service
- Conference reviewer for AISTATS 2025-2026 and NeurIPS 2025.
- Journal reviewer for TPAMI, TMLR, and Front. Radiol.