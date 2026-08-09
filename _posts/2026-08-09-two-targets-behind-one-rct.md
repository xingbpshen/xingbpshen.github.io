---
title: "Two Targets Behind One RCT Estimate"
date: 2026-08-09
tldr: "The difference in means from a randomized trial is a single number, but it
  can be aimed at two different quantities: the average effect among the people who
  enrolled, or the average effect in the population we actually care about. The
  point estimate does not change. What changes is which error you are entitled to
  bound, and randomization only earns you one of the two."
---

You run a randomized
controlled trial (RCT), compute the difference in means, and get $$\hat\tau = 2.4$$. What
is that number an estimate *of*?

There are two defensible answers, they are not the same quantity, and the estimator
cannot tell you which one you meant. Everything downstream (the variance you
report, the confidence interval you print, the concentration inequality you invoke,
the claim you make to a regulator) depends on the answer, and the answer is not
recoverable from the data.

## The Setup Both Perspectives Share

Take $$n$$ subjects. Each has a pair of potential outcomes
$$\big(Y_i(1), Y_i(0)\big)$$: what would happen under treatment, and what would
happen under control. Treatment is assigned by $$A_i \in \{0,1\}$$, and we observe

$$
Y_i = A_i Y_i(1) + (1 - A_i) Y_i(0).
$$

The fundamental problem of causal inference is right there in the equation. Each
subject contributes exactly one of their two potential outcomes, and the other is
gone for good. No amount of data collection recovers it.

The standard estimator is the difference in group means,

$$
\hat\tau = \frac{1}{n_1}\sum_{i \,:\, A_i = 1} Y_i \;-\;
           \frac{1}{n_0}\sum_{i \,:\, A_i = 0} Y_i,
$$

where $$n_1$$ and $$n_0$$ count the treated and control arms. This is the number
that appears in the paper, and it is *identical* under both perspectives below.
Nothing about the computation changes. What changes is the target it is chasing.

## Perspective One: The Trial Is the Population

Treat the $$n$$ enrolled subjects as the entire universe. Their potential outcomes
$$\{Y_i(1), Y_i(0)\}_{i=1}^n$$ are fixed, unknown constants, not draws from
anything. The estimand is the average treatment effect (ATE) *among exactly these people*:

$$
\tau_F = \frac{1}{n}\sum_{i=1}^{n}\big[Y_i(1) - Y_i(0)\big].
$$

An average, not an expectation, and the notation is doing real work. There is no
distribution over subjects here to take an expectation with respect to. The
population is the roster.

**What Is Random?** Only the assignment vector $$A = [A_1, \dots, A_n]$$. That is
the entire probability space, and it is a space *we built*, by running the
randomization ourselves. This is the unusual and genuinely powerful feature of a
randomized experiment: the source of uncertainty is a coin we flipped, with a
distribution we know exactly, rather than a natural process we are modeling.

So $$\hat\tau$$ is random and $$\tau_F$$ is fixed, and the error of interest is

$$
\hat\tau - \tau_F,
$$

which is pure randomization error, the residue of which particular assignment came
up.

Under complete randomization, Neyman's classical result gives

$$
\operatorname{Var}\big(\hat\tau\big) =
\frac{S_1^2}{n_1} + \frac{S_0^2}{n_0} - \frac{S_\tau^2}{n},
$$

where $$S_1^2$$, $$S_0^2$$, and $$S_\tau^2$$ are the finite-population variances of
$$Y_i(1)$$, $$Y_i(0)$$, and $$Y_i(1) - Y_i(0)$$ respectively. The third term is worth
pausing on. It is subtracted, so ignoring it is conservative, and it is
*unidentifiable*. $$S_\tau^2$$ is the variance of a difference we never observe for
any single subject, because observing it would require both potential outcomes from
the same person. It vanishes only under constant treatment effects. The standard
variance estimator drops it, which is why the usual interval is valid but wider than
it needs to be. A quantity that is provably there, provably helpful, and provably
out of reach.

Because the randomness is assignment and nothing else, this perspective supports
inference that is exact rather than approximate. Fisher's randomization test
enumerates (or samples) the assignments that could have occurred and compares the
observed statistic against that distribution. No asymptotics, no distributional
assumption on outcomes, no appeal to a superpopulation that may not exist. The
$$p$$-value means precisely what it says.

## Perspective Two: The Trial Is a Sample

Now suppose the $$n$$ participants were drawn from some larger population, the
patients who might eventually receive the drug. Potential outcomes become random
variables, $$\big(Y(1), Y(0)\big) \sim P$$, and the estimand is

$$
\tau_P = \mathbb{E}_P\big[Y(1) - Y(0)\big].
$$

An expectation now, because there is a distribution to take it over.

**What Is Random?** Two things. Who ended up in the trial, and how they were
assigned once there. Two sources of randomness, and correspondingly two places for
the estimate to go wrong. Inserting the trial-level effect $$\tau_F$$ as an
intermediate quantity makes the split explicit:

$$
\hat\tau - \tau_P
= \underbrace{\big(\hat\tau - \tau_F\big)}_{\text{randomization error}}
+ \underbrace{\big(\tau_F - \tau_P\big)}_{\text{sampling / generalization error}}.
$$

This is the whole point of the post in one line. The first term is what
randomization was designed to control. The second is untouched by it.

## The Asymmetry Between the Two Terms

It is tempting to read the decomposition as two variance terms that both shrink at
$$1/\sqrt{n}$$, in which case the distinction is bookkeeping. That reading is wrong,
and the reason it is wrong is the reason the decomposition matters.

The first term is a *randomization* error. We know its distribution because we
generated it. It shrinks with $$n$$, and it shrinks whether or not our beliefs about
the world are correct.

The second term shrinks at $$1/\sqrt{n}$$ **only if the participants really are an
i.i.d. draw from $$P$$**. That is, only if the recruitment process is itself a valid
sampling mechanism. In a real trial it is not. Enrollment runs through eligibility
criteria, referral patterns, geography, willingness to consent, and the handful of
academic centers that host trials. Under selective enrollment, $$\tau_F$$ converges
to the average effect in the *enrolled* population, which is a different number from
$$\tau_P$$. The gap is bias, not noise, and bias does not shrink with $$n$$. A trial
ten times larger estimates the wrong quantity ten times more precisely.

So the two terms are not two variances. One is variance under a mechanism we
control. The other is, in general, an unshrinking bias under a mechanism we
merely hope resembles sampling.

## The Same Number, Two Different Claims

Both perspectives yield $$\hat\tau = 2.4$$. The difference is entirely in what
follows the arrow:

$$
\hat\tau \longrightarrow
\begin{cases}
\tau_F & \text{finite population,} \\[4pt]
\tau_P & \text{superpopulation.}
\end{cases}
$$

The point estimate does not change. The interpretation does. And note that $$\tau_F$$
is *itself unobservable* even in principle, even with infinite budget, since
computing it requires both $$Y_i(1)$$ and $$Y_i(0)$$ for every participant. The
finite-population target is not the "easy, concrete" one. It is merely the one for
which we have a mechanism that provably works.

For a clinical trial, the two questions have standard names:

- **Internal Validity**: Is $$\hat\tau \approx \tau_F$$? Did randomization let us
  recover the causal effect among the people we actually studied?
- **External Validity**: Is $$\tau_F \approx \tau_P$$? Does that effect carry over to
  the patients who will eventually be prescribed the drug?

Randomization is close to a complete answer to the first and almost no answer to the
second. Yet the second is nearer to what the trial is *for*. Nobody approves a drug
in order to have helped the 400 people who enrolled. The regulatory question is about
future patients, which is a $$\tau_P$$ question, and the trial's strongest guarantee
is a $$\tau_F$$ guarantee. That gap is closed, when it is closed at all, by transport
and weighting arguments that require covariate data on the target population and
assumptions about effect modification. Those assumptions are not delivered by
randomization. They are extra, and they are the part of the argument that fails
quietly.

## Where Concentration Inequalities Fit

Suppose outcomes are bounded, $$Y_i(a) \in [0,1]$$. Then we can ask for a
finite-sample statement of the form

$$
\Pr\big[|\hat\tau - \tau| > \epsilon\big] \le \delta,
$$

and a Hoeffding-type argument gives, with probability at least $$1 - \delta$$,

$$
|\hat\tau - \tau| = O\!\left(\sqrt{\frac{\log(1/\delta)}{n}}\right)
$$

under the appropriate conditions. Clean, non-asymptotic, no normality assumed.

The thing to be careful about is that **the identity of $$\tau$$ in that expression
is a choice, and the bound is only as good as the argument that licenses it**. If
$$\tau = \tau_F$$, the randomness is the assignment, and the relevant machinery is
concentration for sampling *without* replacement (Hoeffding-Serfling and its
relatives), because the arms are a random partition of a fixed roster, not
independent draws. If $$\tau = \tau_P$$, you additionally need the subjects to be an
i.i.d. draw from $$P$$, and that assumption is now load-bearing for the entire
bound. Same $$\sqrt{\log(1/\delta)/n}$$ on the page, different theorem behind it,
different failure mode.

A bound on $$|\hat\tau - \tau_F|$$ says nothing whatsoever about
$$|\hat\tau - \tau_P|$$. Reporting the first while discussing the second is not a
small slip. It is the [same
mismatch](/blog/predictable-provable-guardrail/) I keep running into elsewhere: a
guarantee proved over one domain, quoted in a setting the proof never covered.

## Concentration Is Not the Only Instrument

It is also worth separating concentration bounds from the other things that get
called "uncertainty" in a trial report, because they answer different questions:

| Method | What it characterizes | Finite-sample? |
| :----- | :-------------------- | :------------- |
| Exact randomization inference | The distribution induced by assignment itself | Yes |
| Hoeffding / Bernstein | Tail probability of the estimation error | Yes |
| Chebyshev | Error bound from the variance alone | Yes |
| CLT + standard error | Approximate normal law for $$\hat\tau$$ | Asymptotic |
| Bootstrap | Approximate sampling distribution | Approximate |

The distinctions collapse easily in practice, so it is worth stating flatly:

$$
\text{concentration bound} \;\neq\; \text{standard error} \;\neq\;
\text{exact randomization distribution}.
$$

A standard error summarizes a distribution's spread. A concentration bound is a
guaranteed tail statement, typically much looser than the truth. A randomization
distribution is the exact law of the statistic under the assignment mechanism. All
three are legitimate. They are answers to different questions, and quoting one while
meaning another is how a conservative bound gets mistaken for a sharp one.

## The Ladder

The cleanest picture is a two-rung ladder:

$$
\underbrace{\tau_P = \mathbb{E}_P\big[Y(1) - Y(0)\big]}_{\text{target population}}
$$

$$
\big\updownarrow \quad \text{generalization / sampling}
$$

$$
\underbrace{\tau_F = \tfrac{1}{n}\textstyle\sum_i \big[Y_i(1) - Y_i(0)\big]}_{\text{trial population}}
$$

$$
\big\updownarrow \quad \text{randomization / estimation}
$$

$$
\underbrace{\hat\tau = \bar{Y}_1 - \bar{Y}_0}_{\text{what we compute}}
$$

Read from the bottom, the trial gives you one rung for free and charges full price
for the second.

## Note

Three layers, and they are genuinely distinct. *Identification* is solved by
randomization: the effect is defined and recoverable in principle. *Inference* tells
you how far $$\hat\tau$$ can stray from the trial's own effect, and here the
guarantee is unusually strong because we own the randomness. *Generalization* asks
whether the trial's effect is the one we care about, and randomization contributes
nothing to it.

For a drug intended for future patients, all three matter, and only two of them come
with a mechanism. The habit worth keeping is small: whenever an error bound appears,
say out loud which $$\tau$$ sits inside the absolute value. It takes a sentence, and
it makes visible the term the trial design never addressed.

That question, how much of the error is the part we engineered and how much is the
part we assumed away, is the same one I find myself asking about learned systems,
where the roles are played by a validation set and a deployment distribution rather
than a trial roster and a patient population. The arithmetic is more familiar in the
causal setting, which is part of why it is clarifying to write it down there first.

---

**References.** Rubin, [Causal Inference Using Potential Outcomes: Design, Modeling, Decisions](https://www.tandfonline.com/doi/abs/10.1198/016214504000001880?casa_token=dCyg47GNY_8AAAAA:Zj922_FXeZLI4Y2QVSdC-fS3lGKm-GWRqb9MEJWfBPXrwqrmI9ekywZcYdBTE9wHnrWx7PXkl8ZOIA) (2005). Splawa-Neyman et al., [On the Application of Probability Theory to Agricultural Experiments. Essay on Principles. Section 9](jstor.org/stable/2245382?casa_token=U6OGHmWFsUsAAAAA:NquIxKLMiyl9QXxR1j7ROwfo_6j1Elr6xPHAobbH3jQ0JiixuMJueW6mi3KX13DHvP4gsylRW-SyO7vV7fZ_u0jOXZs82pU5djV-wkwZP84dFupqyk78) (1990). Vapnik, [The Nature of Statistical Learning Theory](https://books.google.ca/books?hl=en&lr=&id=EoDSBwAAQBAJ&oi=fnd&pg=PR7&dq=statistical+learning+theory&ots=9jxwaAhj7R&sig=BNC_9kI39MWmR_cWdg_XhyTjdnY#v=onepage&q&f=false) (2013). Hoeffding, [Probability Inequalities for Sums of Bounded Random Variables](https://www.tandfonline.com/doi/abs/10.1080/01621459.1963.10500830?casa_token=_wr0vGWjJsMAAAAA:YcDBpO-VNmTRrO7si2kVKrH-_PNpXOhJdGDyV1nvns5oC6nU1n542K603dPP0pRoT5uLg-LLArxuzg) (1963).
