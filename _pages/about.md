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

I am a first-year Ph.D. student in Computer Science at the University of Ottawa, EECS, supervised by Prof. [Changjian Shui](https://cjshui.github.io). Previously, I completed my M.Sc. in Electrical Engineering at McGill University and Mila — Quebec AI Institute under the supervision of Prof. [Tal Arbel](https://cim.mcgill.ca/~arbel/). I also received my B.Eng. in Computer Engineering from McGill University.

My research studies **predictable AI**, with an emphasis on developing theoretically grounded quantities that allow us to anticipate the reliability and consequences of AI systems before their outcomes are observed. My earlier work focused on predicting inference reliability through confidence calibration, my current work extends this perspective to the training process, asking whether the effect of data interventions on population generalization can itself be predicted before the intervention is performed.

# 📝 Selected Publications
<div class="pub-list" markdown="1">

<div class="pub-item" markdown="1">
**BayesAgent: Bayesian Agentic Reasoning Under Uncertainty via Verbalized Probabilistic Graphical Modeling**

Hengguan Huang\*, **Xing Shen**\*, Guang-Yuan Hao, Songtao Wang, Lingfa Meng, Dianbo Liu, David Alejandro Duchene, Hao Wang, and Samir Bhatt

_AAAI 2026_ &nbsp; ![](https://img.shields.io/badge/CORE-A*-6a1b9a?labelColor=6a1b9a) ![](https://img.shields.io/badge/CCF-A-3f51b5?labelColor=3f51b5) &nbsp; _*Equal contribution_ &nbsp; [[Paper]((https://ojs.aaai.org/index.php/AAAI/article/view/39347))] [[Appendix](https://github.com/xingbpshen/agentic-reasoning-vpgm/blob/main/assets/appendix.pdf)] [[Code](https://github.com/xingbpshen/agentic-reasoning-vpgm)]
</div>

<div class="pub-item" markdown="1">
**Exposing and Mitigating Calibration Biases and Demographic Unfairness in MLLM Few-Shot In-Context Learning for Medical Image Classification**

**Xing Shen**, Justin Szeto, Mingyang Li, Hengguan Huang, and Tal Arbel

_MICCAI 2025_ &nbsp; ![](https://img.shields.io/badge/CORE-A-6a1b9a?labelColor=6a1b9a) ![](https://img.shields.io/badge/CCF-B-3f51b5?labelColor=3f51b5) &nbsp; [[Paper]((https://link.springer.com/chapter/10.1007/978-3-032-04981-0_22))] [[arXiv](https://arxiv.org/abs/2506.23298)] [[Code](https://github.com/xingbpshen/medical-calibration-fairness-mllm)]
</div>

<div class="pub-item" markdown="1">
**Improving Robustness and Reliability in Medical Image Classification with Latent-Guided Diffusion and Nested-Ensembles**

**Xing Shen**, Hengguan Huang, Brennan Nichyporuk, and Tal Arbel

_IEEE Transactions on Medical Imaging_, 2025 &nbsp; ![](https://img.shields.io/badge/中科院-双1区Top-e91e63?labelColor=e91e63) ![](https://img.shields.io/badge/JCR-Q1-228b22?labelColor=228b22) ![](https://img.shields.io/badge/CCF-B-3f51b5?labelColor=3f51b5) &nbsp; [[Paper]((https://ieeexplore.ieee.org/document/11059995))] [[arXiv](https://arxiv.org/abs/2310.15952)] [[Code](https://github.com/xingbpshen/nested-diffusion)]
</div>

<div class="pub-item" markdown="1">
**Prompt4Trust: A Reinforcement Learning Prompt Augmentation Framework for Clinically-Aligned Confidence Calibration in Multimodal Large Language Models**

Anita Kriz\*, Elizabeth Laura Janes\*, **Xing Shen**\*, and Tal Arbel

_ICCV 2025 Workshops_ &nbsp; _*Equal contribution_ &nbsp; [[Paper]((https://openaccess.thecvf.com/content/ICCV2025W/CVAMD/html/Kriz_Prompt4Trust_A_Reinforcement_Learning_Prompt_Augmentation_Framework_for_Clinically-Aligned_Confidence_ICCVW_2025_paper.html))] [[arXiv](https://arxiv.org/abs/2507.09279)] [[Code](https://github.com/xingbpshen/prompt4trust)] [[Hugging Face](https://huggingface.co/xingshen/prompt4trust-cgpgenerator-1.5B)]
</div>

</div>

<!-- The below example illustrate a publication item with a figure, do not delete -->
<!-- <div class='paper-box'><div class='paper-box-image'><div><div class="badge">IEEE Trans. Med. Imaging</div><img src='images/ladine.png' alt="sym" width="100%"></div></div>
<div class='paper-box-text' markdown="1">

[Improving Robustness and Reliability in Medical Image Classification with Latent-Guided Diffusion and Nested-Ensembles](https://ieeexplore.ieee.org/document/11059995)

**Xing Shen**, Hengguan Huang, Brennan Nichyporuk, and Tal Arbel

[[**Code**](https://github.com/xingbpshen/nested-diffusion)] [[**Preprint**](https://arxiv.org/abs/2310.15952)]

**_IEEE Transactions on Medical Imaging_, 2025**

![](https://img.shields.io/badge/中科院-双1区Top-e91e63?labelColor=e91e63) ![](https://img.shields.io/badge/JCR-Q1-228b22?labelColor=228b22) ![](https://img.shields.io/badge/CCF-B-3f51b5?labelColor=3f51b5)
</div>
</div> -->

# 💡 Writing and Ideas
<ul class="post-list plain-list plain-list--writing">
{%- assign listed_posts = site.posts | where_exp: "post", "post.public != false" %}
{%- for post in listed_posts %}
  <li class="post-list__item">
    <em>{{ post.date | date: "%Y.%m" }}</em>: &nbsp; <a href="{{ post.url }}">{{ post.title }}</a>
    {%- if post.tldr %}
    <span class="post-list__tldr">{{ post.tldr | markdownify | remove: "<p>" | remove: "</p>" | strip }}</span>
    {%- endif %}
  </li>
{%- endfor %}
</ul>

# 📰 News
- *2025.11*: &nbsp; Our paper "BayesAgent: Bayesian Agentic Reasoning Under Uncertainty via Verbalized Probabilistic Graphical Modeling" has been accepted to <b>AAAI 2026</b>.
- *2025.10*: &nbsp; Our <b>Calibration Guidance Prompt Generator 1.5B</b> model is now live on Hugging Face 🤗 ! [[Hugging Face](https://huggingface.co/xingshen/prompt4trust-cgpgenerator-1.5B)]
{: .plain-list .plain-list--news}

# 🎖 Honors and Awards
- University of Ottawa Ph.D. Research Fellowship (2026–2029)
- Graduate Research and Enhancement Travel (GREAT) Award (2025)
- Healthy Brains, Healthy Lives (HBHL) Graduate Student Fellowship - funded via Canada First Research Excellence Fund (CFREF) (2024–2025)
- McGill University Master's Research Fellowship (2024–2025)
- McGill Faculty of Engineering Class 2023 Distinction
- McGill Summer Undergraduate Research in Engineering (SURE) Award (2023)
{: .plain-list .plain-list--honors}

# 🎓 Education
- *2026.01 – Present*: &nbsp; **Ph.D. in Computer Science**, University of Ottawa, **CGPA 10.0/10.0**
- *2024.01 – 2026.05*: &nbsp; **M.Sc. in Electrical Engineering**, McGill University and Mila — Quebec AI Institute, **CGPA 4.0/4.0**
- *2018.09 – 2023.05*: &nbsp; **B.Eng. in Computer Engineering**, McGill University, **Graduated with Distinction**
{: .plain-list .plain-list--education}

# 💻 Professional Service
- **Conference Reviewer**: NeurIPS (2025–2026), AISTATS (2025–2026), AAAI (2027)
- **Journal Reviewer**: IEEE Transactions on Pattern Analysis and Machine Intelligence (TPAMI), Transactions on Machine Learning Research (TMLR), Medical Image Analysis (MedIA), IEEE Journal of Biomedical and Health Informatics (JBHI), Frontiers in Artificial Intelligence, Frontiers in Radiology, Journal of Imaging Informatics in Medicine
- **Teaching Assistant**: CSI 4106 Introduction to Artificial Intelligence, CSI 3131 Operating Systems, University of Ottawa
{: .plain-list .plain-list--service}

<style>
.visitor-map-rule {
  width: 60px;
  margin: 4em auto 0;
  border: 0;
  border-top: 1px solid #e8e8e8;
}
.visitor-map { margin: 2.5em auto 5em; text-align: center; }

/* The widget paints an ocean-blue rectangle on the container behind BOTH the
   counter and the map. Drop it: the map's own PNG already has the ocean colour
   baked in, so only that needs to show. Colour is set inline by the script,
   hence !important. */
.visitor-map .mapmyvisitors-map-container { background-color: transparent !important; }

/* Clip the map to a Robinson-projection outline: straight pole lines top and
   bottom (0.5322x the equator), curved east and west edges. */
.visitor-map .mapmyvisitors-map {
  -webkit-clip-path: url(#robinson-outline);
          clip-path: url(#robinson-outline);
}

/* The +/- zoom control is baked into the background PNG's bottom-left corner
   (x 4-20, y 110-142 of the 300x147 image), so it can't be hidden as a DOM
   node. Paint over it with the ocean colour instead - everything under this
   patch is open South Pacific, so it lands invisibly. Uses ::before so it
   stays below the marker overlay. Colour must match the co= URL param. */
.visitor-map .mapmyvisitors-map::before {
  content: "";
  position: absolute;
  left: 0;
  top: 72%;
  width: 8%;
  height: 28%;
  background: #79beef;
}

/* Counter text is white-on-blue Arial by default; with the blue gone it would
   be invisible, so restyle it as a muted caption in the theme's own font.
   Colour, size and line-height are set inline by the script, hence !important. */
.visitor-map .mapmyvisitors-visitors {
  font-family: "Trebuchet MS", Helvetica, sans-serif !important;
  font-size: 12px !important;
  line-height: 1.4 !important;
  color: #aaa !important;
  letter-spacing: 0.02em;
  margin-bottom: 0.6em;
}
</style>

<hr class="visitor-map-rule">

<svg width="0" height="0" style="position:absolute" aria-hidden="true"><defs>
<clipPath id="robinson-outline" clipPathUnits="objectBoundingBox">
<path d="M 0.7661,0.0 L 0.2339,0.0 L 0.2139,0.01195 L 0.18935,0.0303 L 0.1634,0.0532 L 0.1407,0.07825 L 0.12015,0.10485 L 0.1007,0.1327 L 0.0825,0.16155 L 0.06605,0.1912 L 0.0519,0.22145 L 0.0392,0.2521 L 0.02865,0.283 L 0.02,0.314 L 0.0135,0.345 L 0.0089,0.376 L 0.005,0.407 L 0.0023,0.438 L 0.0007,0.469 L 0.0,0.5 L 0.0007,0.531 L 0.0023,0.562 L 0.005,0.593 L 0.0089,0.624 L 0.0135,0.655 L 0.02,0.686 L 0.02865,0.717 L 0.0392,0.7479 L 0.0519,0.77855 L 0.06605,0.8088 L 0.0825,0.83845 L 0.1007,0.8673 L 0.12015,0.89515 L 0.1407,0.92175 L 0.1634,0.9468 L 0.18935,0.9697 L 0.2139,0.98805 L 0.2339,1.0 L 0.7661,1.0 L 0.7861,0.98805 L 0.81065,0.9697 L 0.8366,0.9468 L 0.8593,0.92175 L 0.87985,0.89515 L 0.8993,0.8673 L 0.9175,0.83845 L 0.93395,0.8088 L 0.9481,0.77855 L 0.9608,0.7479 L 0.97135,0.717 L 0.98,0.686 L 0.9865,0.655 L 0.9911,0.624 L 0.995,0.593 L 0.9977,0.562 L 0.9993,0.531 L 1.0,0.5 L 0.9993,0.469 L 0.9977,0.438 L 0.995,0.407 L 0.9911,0.376 L 0.9865,0.345 L 0.98,0.314 L 0.97135,0.283 L 0.9608,0.2521 L 0.9481,0.22145 L 0.93395,0.1912 L 0.9175,0.16155 L 0.8993,0.1327 L 0.87985,0.10485 L 0.8593,0.07825 L 0.8366,0.0532 L 0.81065,0.0303 L 0.7861,0.01195 Z"/>
</clipPath>
</defs></svg>

<div class="visitor-map">
<script type='text/javascript' id='mapmyvisitors' src='https://mapmyvisitors.com/map.js?cl=fff9f9&w=300&t=tt&d=sH2_clvSlQO7fMbl5pZuiHGWXPntcF1--uQMFBq_LJg&cmo=ff7f7f&cmn=76e576&co=79beef&ct=ffffff'></script>
</div>