---
title: "Provable AI, Predictable AI, and Guardrails"
date: 2026-08-08
tldr: "A proof is a conditional promise about inputs chosen in advance, while
  predictability is a forecast about the inputs a system actually meets. Neither
  property contains the other. A two-term bound makes visible exactly what a
  certificate leaves on the table, and guardrails turn out to attack only one of
  those two terms."
---

Three terms show up together often enough in the current safety literature that they
have started to blur: *provable*, *predictable*, and *guardrailed*. Yoshua Bengio's
recent research program has done more than anything else to put them in the same
room, through the [Guaranteed Safe AI](https://arxiv.org/abs/2405.06624) framework,
the [Bayesian oracle](https://arxiv.org/abs/2408.05284) construction, the
non-agentic [Scientist AI](https://arxiv.org/abs/2502.15657) proposal, and now
[LawZero](https://lawzero.org), the nonprofit he launched in June 2025 to build
guardrail systems rather than more capable agents.

Putting them in the same room is not the same as showing they are the same thing.
I want to argue for a separation I find useful, and which I do not think is merely
semantic: **provability and predictability are properties, guardrails are a
mechanism**, and neither of the two properties contains the other.

## Three Definitions

Before the notation, the plain version. A proof is a *conditional promise* about a
set of situations we drew a box around in advance. Predictability is a *forecast*
about the situations the system will actually meet. A guardrail is a *mechanism*
that limits what the system is allowed to do. The first two are things a system
can be, the third is something you build and attach.

Throughout, let $$f$$ be a system mapping inputs $$x \in \mathcal{X}$$ to outputs
$$y \in \mathcal{Y}$$.

**Provable.** Think of the load rating on a bridge. It certifies that vehicles up to
some weight can cross safely, on the assumption that the steel is what the
datasheet says it is. It is a strong claim, but a narrow one. It says nothing about
a heavier truck, and nothing about whether the river will wash out the foundation.
A proof about an AI system has the same structure: a property we wrote down, holding
over a range of inputs we fixed in advance, under assumptions we had to make to get
the proof through.

Formally, there is a specification $$\phi(x, y)$$, an admissible input set
$$\mathcal{X}_0 \subseteq \mathcal{X}$$, and a set of modeling assumptions
$$\mathcal{A}$$, such that we hold a certificate

$$
\mathcal{A} \;\vdash\; \forall x \in \mathcal{X}_0 : \phi\big(x, f(x)\big).
$$

Read this as: assuming $$\mathcal{A}$$, we can prove that for every input drawn from
$$\mathcal{X}_0$$, the pair of that input and the system's output on it satisfies
$$\phi$$.

The specification $$\phi$$ deserves a longer look, because it carries most of the
weight and gets the least attention. It is a predicate, a statement that is either
true or false of an input-output pair, fixed in advance, and written in a language
precise enough that a proof can range over it. It is the formal stand-in for the
sentence "the system behaved acceptably here". A few concrete ones:

- *Certified Robustness.* $$\phi(x, y)$$ says that every input within an
  $$\ell_2$$ ball of radius $$r$$ around $$x$$ receives the same label $$y$$. In
  plain terms, small changes to the image do not change the diagnosis.
- *Conformal Prediction.* $$\phi(x, y)$$ says that the output set $$y$$ contains
  the true label. In plain terms, the shortlist really does contain the answer
  most of the time. This one is the probabilistic reading of the template: the
  guarantee is that $$\phi$$ holds with probability at least $$1 - \alpha$$ over an
  exchangeable draw, not that it holds for every input separately.
- *Controller Verification.* $$\phi(x, y)$$ says that the commanded action $$y$$
  keeps the vehicle inside its lane for the next $$T$$ steps.

Two features of $$\phi$$ matter for everything that follows. It is chosen by a
person, not derived from anything, so it can be the wrong predicate. And it is
almost always a *proxy* for the thing we actually care about, because the thing we
actually care about ("no harm") is not formalizable in the language the verifier
speaks. Certified robustness, SMT-based neural network verification, and conformal
coverage are all instances of the same template, differing only in how large
$$\mathcal{X}_0$$ is, how strong $$\mathcal{A}$$ is, and how far $$\phi$$ sits from
what we meant.

**Predictable.** Now think of a weather forecast. It promises nothing about
tomorrow in particular. What it offers is that when it says thirty percent chance
of rain, it rains about thirty percent of the time. That is a weaker kind of claim
than a proof, and a far more useful one for planning, because it covers the days
you will actually live through rather than a subset chosen in advance. Predictable
AI asks for the same thing: not that the system never errs, but that you can say in
advance how often it will, and where.

Formally, there is a quantity of interest $$s(f; Q)$$ (accuracy, harm rate,
calibration error, cost) under a deployment distribution $$Q$$, and an estimator
$$\hat{s}$$ computable before deployment, such that

$$
\big|\hat{s} - s(f; Q)\big| \le \varepsilon
\quad \text{with probability at least } 1 - \eta.
$$

The emphasis, as in the [Predictable AI](https://arxiv.org/abs/2310.06167) agenda,
is on anticipating how a system will behave before you run it, rather than
measuring how it behaved after the fact.

**Guardrail.** A circuit breaker does not make the wiring in your house correct. It
limits what happens when the wiring is wrong, and it does so without knowing
anything about the wiring at all. That indifference is the whole appeal of a
guardrail, and also its whole limitation. It can be added to a system nobody
understands, which is why it is the safety mechanism most available to us right
now, and it can only ever cut power rather than fix the fault.

Formally, a guardrail is not a property of $$f$$ at all, but an operator on it. It
restricts the set of outputs the system is permitted to emit on input $$x$$, from
$$\mathcal{Y}$$ down to some $$\mathcal{Y}_G(x) \subseteq \mathcal{Y} \cup \{\bot\}$$,
where $$\bot$$ denotes abstention or deferral, and yields a modified system
$$\tilde{f} = G \circ f$$. It is largely *external*: it does not require $$f$$ to be
retrained, understood, or even inspected.

The category difference matters. Asking "is this system provable or guardrailed?"
is like asking whether a bridge is *load-rated* or *has railings*. One is a claim
about the artifact. The other is a thing you bolt onto it.

## A Proof Does Not Buy You Predictability

This is the part I care most about, and it is almost trivial once written down.

Let $$h(x, y) \in \{0,1\}$$ indicate an undesired outcome, and abbreviate
$$h(x) := h\big(x, f(x)\big)$$ for the harm actually incurred when the system runs
on $$x$$. Split the deployment harm rate according to whether the input landed
inside the certified region:

$$
\Pr_{x \sim Q}\big[h = 1\big]
= \Pr_Q\big[h = 1,\; x \in \mathcal{X}_0\big]
+ \Pr_Q\big[h = 1,\; x \notin \mathcal{X}_0\big].
$$

Now bound each piece. For the first, the certificate tells us that every $$x$$ in
$$\mathcal{X}_0$$ satisfies $$\phi$$. So the set of inputs counted by that term is a
subset of a larger set:

$$
\big\{\, x : h = 1 \;\text{and}\; x \in \mathcal{X}_0 \,\big\}
\;\subseteq\;
\big\{\, x : h = 1 \;\text{and}\; \phi(x, f(x)) \text{ holds} \,\big\}.
$$

In words: any input that is inside the certified region and still causes harm is, in
particular, an input where the specification was satisfied and harm happened anyway.
The inclusion holds because membership in $$\mathcal{X}_0$$ already implies $$\phi$$,
so replacing the first condition by the second can only enlarge the set. Probability
is monotone under set inclusion, so the first term is at most the probability of the
larger set. The second term is bounded the same way, by dropping the harm condition
entirely and keeping only $$x \notin \mathcal{X}_0$$. Together:

$$
\Pr_Q\big[h = 1\big] \;\le\;
\underbrace{\Pr_Q\big[\phi(x, f(x)) \text{ holds},\; h = 1\big]}_{\delta_{\text{task}}}
\;+\;
\underbrace{Q\big(\mathcal{X}_0^{\mathsf{c}}\big)}_{\delta_{\text{input}}}.
$$

The certificate zeroes out neither term. What it actually gives us is

$$
\Pr_Q\big[\neg\phi(x, f(x)),\; x \in \mathcal{X}_0\big] = 0,
$$

the elimination of specification violations *inside* the certified region. Neither
residual has that form. The first counts inputs where $$\phi$$ held and harm came
anyway, the second counts inputs the certificate never spoke about. The two are
exactly the two mismatches:

- **Input-mismatch** ($$\delta_{\text{input}}$$). Deployment places mass outside the
  admissible set. A robustness certificate over an $$\ell_2$$ ball is silent about
  the JPEG artifacts, the new scanner, the different hospital. The proof is not
  wrong. It is inapplicable, and inapplicability is not something the proof can
  detect on its own behalf.
- **Task-mismatch** ($$\delta_{\text{task}}$$). $$\phi$$ holds and harm occurs anyway,
  because $$\phi$$ was never equivalent to "no harm". This is specification gaming
  and Goodharting, in a single line of probability.

And all of this presumes $$\mathcal{A}$$ itself holds. If the assumptions fail,
through quantization the proof did not model, a wrapper that post-processes logits,
or an adversary with a threat model outside the one certified, then the certificate
is not merely loose. It is vacuous. Call that assumption-mismatch. It has the same
shape as the other two.

The point is that $$\delta_{\text{task}}$$ and $$\delta_{\text{input}}$$ are *empirical,
epistemic quantities about the world*, and a proof is a syntactic object about an
artifact. You cannot derive the former from the latter. A verified system deployed
on the wrong distribution, or verified against the wrong predicate, is as
unpredictable as an unverified one. Arguably it is worse, because the certificate
licenses a confidence that the deployment does not earn.

## Predictability Does Not Require a Proof, Either

The converse containment fails just as cleanly, and this is worth saying because
"provable" is often treated as the strong form of "predictable".

Scaling laws are the obvious counterexample. We can forecast the loss of a model
that does not yet exist, to a useful tolerance, with nothing resembling a proof
about the trained network. Well-calibrated confidence is another: a model whose
predicted probabilities match empirical frequencies supports accurate anticipation
of its own error rate, with no theorem about any individual prediction. Selective
prediction turns this into an operational knob, since a risk-coverage curve is a
predictability instrument built entirely out of statistics.

So the two properties overlap without nesting. Provability is *worst-case over a
restricted domain*. Predictability is *average-case over the actual domain*. Neither
implies the other, and the assumption-shaped hole is in a different place for each:
proofs are fragile to the boundary of $$\mathcal{X}_0$$, while statistical
predictions are fragile to distribution shift in $$Q$$.

## Where Guardrails Fit

Read the decomposition again and the role of a guardrail becomes obvious. It is a
mechanism for attacking $$\delta_{\text{input}}$$, for *enforcing* the antecedent of
the theorem rather than assuming it. In its simplest form, a gate
$$g : \mathcal{X} \to \{0,1\}$$ with

$$
\tilde{f}(x) =
\begin{cases}
f(x), & g(x) = 1, \\
\bot, & g(x) = 0,
\end{cases}
$$

gives

$$
\Pr_Q\big[h = 1\big] \;\le\; \delta_{\text{task}}
\;+\; \underbrace{\Pr_Q\big[g = 1,\; x \notin \mathcal{X}_0\big]}_{\text{gate unsoundness}}
\;+\; \underbrace{\Pr_Q\big[h = 1 \mid g = 0\big]\,\Pr_Q\big[g = 0\big]}_{\text{cost of abstaining}}.
$$

Two things fall out. First, the gate term is always at most
$$Q(\mathcal{X}_0^{\mathsf{c}})$$, so on the domain gap a guardrail can only help.
Second, it is not free, because abstention has its own harm, weighted by how often
you abstain. A triage system that refuses is not thereby safe, and coverage
$$\Pr_Q[g = 1]$$ is the price. The interesting object is not "guardrail: yes or no"
but the trade-off curve between the second and third terms.

Bengio's Bayesian oracle is precisely a guardrail of this form with a particular,
and to my mind particularly honest, choice of gate: block the action when an
estimated probability of harm exceeds a threshold, where the estimate is taken
*cautiously* over theories still consistent with the data rather than under a
single fitted model. The caution is doing real work, since it is an attempt to make
the gate sound under exactly the epistemic uncertainty that $$\delta_{\text{input}}$$
represents. Contrast this with the guardrails deployed in practice today, which are
mostly classifiers trained on harm labels. Those have no such property, and their
own generalization failure sits inside the gate-unsoundness term.

## Who Guards the Guardrail

The obvious regress is that $$G$$ is itself a system, so why is it any more
trustworthy than $$f$$?

I think the only non-circular answer is structural, and it is the one Bengio's
program keeps returning to: **the guardrail must belong to a strictly weaker
capability class than the thing it guards**. The Simplex architecture made this
argument for control software twenty-five years ago, with a simple, verified,
low-performance controller sitting underneath a complex, high-performance,
unverified one, so that the assurance case rests entirely on the simple half.
Shielded reinforcement learning is the same trick with a synthesized safety
automaton.

Read this way, the insistence that Scientist AI be *non-agentic* is not a side
constraint but the whole argument. A guardrail that is itself a goal-directed agent
inherits the failure modes it was installed to contain, and the assurance case
becomes circular. A system that models and explains without pursuing does not.
Whether that separation survives contact with capability, meaning whether you can
build something that understands enough to gate an agent without itself being one,
is the open empirical question, and I do not think anyone knows the answer yet.

## What I Take From This

The framing I keep coming back to is that provability is a claim about an artifact,
while predictability is a claim about an artifact *in a context*. The gap between
them is not a technical detail to be closed later. It is where essentially all
deployment failures live. Both mismatch terms are quantities you would want to
estimate before deployment, and neither is delivered by the certificate.

That is roughly the question my own work keeps circling: what can be known about a
system's consequences before those consequences are observed. Calibration was one
answer at inference time. A calibrated confidence score is exactly an estimate of
the model's own probability of being wrong on the input in front of it, available
before the label is ever revealed, which is the single-instance version of the
estimator $$\hat{s}$$ above. It buys no guarantee about any individual case, but it
makes the error rate of a whole stream of decisions something you can anticipate
and act on rather than audit afterwards. The mismatch terms above suggest the same
question is open one level up. Not "will this prediction be right", but "is this
deployment
inside the region where anything I know about the system still applies". Guardrails
are the current best mechanism for making that question actionable rather than
rhetorical, but they relocate the assumption rather than removing it, and being
honest about where it has been relocated to seems like the minimum standard.

---

**References.** Dalrymple et al., [Towards Guaranteed Safe AI: A Framework for Ensuring Robust and Reliable AI Systems](https://arxiv.org/abs/2405.06624)
(2024). Bengio et al., [Can a Bayesian Oracle Prevent Harm from an Agent?](https://arxiv.org/abs/2408.05284)
(2024). Bengio et al., [Superintelligent Agents Pose Catastrophic Risks: Can Scientist AI
Offer a Safer Path?](https://arxiv.org/abs/2502.15657) (2025). Bengio et al., [Safety from Honesty in a Disinterested AI Predictor](https://arxiv.org/abs/2606.29657) (2026). Zhou et al.,
[Predictable Artificial Intelligence](https://www.sciencedirect.com/science/article/pii/S0004370226000172) (2025).
Cohen et al., [Certified Adversarial Robustness via Randomized Smoothing](https://arxiv.org/abs/1902.02918)
(2019). Katz et al., [Reluplex: An Efficient SMT Solver for Verifying Deep Neural Networks](https://arxiv.org/abs/1702.01135) (2017).
Angelopoulos & Bates, [A Gentle Introduction to Conformal Prediction and Distribution-Free Uncertainty Quantification](https://arxiv.org/abs/2107.07511)
(2022). Geifman & El-Yaniv, [Selective Classification for Deep Neural Networks](https://arxiv.org/abs/1705.08500)
(2017). D'Amour et al., [Underspecification Presents Challenges for Credibility in Modern
Machine Learning](https://arxiv.org/abs/2011.03395) (2020). Alshiekh et al.,
[Safe Reinforcement Learning via Shielding](https://dl.acm.org/doi/10.5555/3504035.3504361) (2018).
Sha, [Using Simplicity to Control Complexity](https://dl.acm.org/doi/10.1109/MS.2001.936213) (2001).
