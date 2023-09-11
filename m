Return-Path: <SRS0=s32l=E3=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519ACEE7FF4
	for <soc@archiver.kernel.org>; Mon, 11 Sep 2023 12:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FD12C433C9; Mon, 11 Sep 2023 12:07:31 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 156D7C433C7
	for <soc@kernel.org>; Mon, 11 Sep 2023 12:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 156D7C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5924093a9b2so42543477b3.2
        for <soc@kernel.org>; Mon, 11 Sep 2023 05:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694434049; x=1695038849; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX4v8HhseDUrg4nK4GOlhuMrgfux3e3KYPTg4pZxyPI=;
        b=P8QnLwyrwV/JplBBekn9KGrsjDJ/S83PHh7j/SDYor6bXhG5AN2LqI/prZN5TDSaMt
         XTlwRICCFeGirMz+X2qIjSGnMB1jMI4ERTDyeS1216/Vd4r+Wv58x9DUlxELObXq4Y9C
         A4DCi9aqJC4lDWy8qnHaZrYfNz2bPsYyxbDCt3uNd/GYhXyc0iWWdxRiK0klKUtOFd7N
         s3maIFO2em5lDyacR/+nJ0f+XrUCkMcTfugZl4TdF0nOw8Q0nwETTpeXpeiba1eraHqw
         vhKjiRN3HaSlT1AYrnGZGnmk/kw0YRqcUpdbA1vVSNCPZB5TZmc5x275/12jHtDqPBE1
         5jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694434049; x=1695038849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XX4v8HhseDUrg4nK4GOlhuMrgfux3e3KYPTg4pZxyPI=;
        b=viCuVY6OqLBZwWc5XDbd9BoShefcM8XbNURpC4vCxtDQPc2kDaeg1f9jLf3hkwDQ2h
         iYS0ijNmfzJfM3lvX35+J43JfM9bN3Doo8HrP6d7eS2eSGc3RDlLcw6qsbQF/1hWOESW
         3i1+pw1N7SCFhAv9Guv21bmksawHBH6RHB1VQy1vFoIOHEUGmzRkOUc6SjgIWCUoZnx+
         Nxs9oTFKlBQBosvZ38IIPAHqQrm8IfM6rM+IlAqgNHrPlyX0yPFmSWnW23o/pGvqHCeY
         ftxIhjOxaGwj4eSwUdMw37H/5f5uAlR3q5C+I0dRbGTg11ngwmdaOhoChEQ5ztDGWhmm
         gVZw==
X-Gm-Message-State: AOJu0YxlJZN9LSVtUtWj45k7vOLLUnkwKA5mN7Yz0BRRtOyQzc/K55bd
	OUH7jFetIN3QnWTVWAbYRPhTg5yBhUmfrnfVCCGvVAdUfbXPhExl5IvwtQ==
X-Google-Smtp-Source: AGHT+IES24EorS8GUJRuowcjC8+FAzezIUBouFFfC1NtKEb/nqAMSCkSw+Lyxw6KKpapAaBFc8ChmLvFJE9CTPGxwwE=
X-Received: by 2002:a5b:709:0:b0:d80:68d1:b826 with SMTP id
 g9-20020a5b0709000000b00d8068d1b826mr4839146ybq.6.1694434048864; Mon, 11 Sep
 2023 05:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
 <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
 <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com>
 <96bb0de0-06d9-46f8-b02f-dc924afff13c@app.fastmail.com> <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
 <CAPDyKFrJH-1uaPCwnWZDPi4MRtOm=N2CHSRyvjXRDbQ1y-oOrw@mail.gmail.com>
 <CAJZ5v0hqWYnkNXVju3U3n-9i8eqtjs197tLLNWv8Qa_N9T=KEw@mail.gmail.com>
 <CAPDyKFpXLj_2HAgyV_VJf+GPQVmxb_iiDe77Q2MY17MDNqy9fA@mail.gmail.com>
 <CAMuHMdVxLkxN0bmSRXW74R_dGNDSRDB4Z=zE0DoiXDOuweSM0A@mail.gmail.com>
 <CAPDyKFpUUJeGD77GTYCk59cvW=SdGTkOEXH4dap1JQWekAa0Eg@mail.gmail.com> <CAMuHMdUZcrtHZz7daKjL7Oz2MEmCrjJ_ovO3ttTnZ7xuRWgiRA@mail.gmail.com>
In-Reply-To: <CAMuHMdUZcrtHZz7daKjL7Oz2MEmCrjJ_ovO3ttTnZ7xuRWgiRA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 Sep 2023 14:06:52 +0200
Message-ID: <CAPDyKFpctt6AQBpu+vBQ0ymW3PQGB8dt8-QEhgbz0Uo5T-1Wxw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
To: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Sept 2023 at 13:48, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
>
> Hi Ulf,
>
> On Mon, Sep 11, 2023 at 1:28=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> > On Mon, 11 Sept 2023 at 09:52, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> > > On Thu, Aug 31, 2023 at 1:39=E2=80=AFPM Ulf Hansson <ulf.hansson@lina=
ro.org> wrote:
> > > > On Thu, 31 Aug 2023 at 11:33, Rafael J. Wysocki <rafael@kernel.org>=
 wrote:
> > > > > If I may suggest something, I would call this "pmdomain" instead =
of
> > > > > "genpd".  I don't think that /drivers/power/ is a particularly
> > > > > suitable location for it, because it doesn't really have much to =
do
> > > > > with power supplies and more to do with device PM.
> > > >
> > > > "pmdomain" is probably giving a reasonable good hint of what goes o=
n
> > > > in this subsystem. This works fine for me, thanks!
> > >
> > > > > Also, I would move drivers/base/power/domain.c to drivers/pmdomai=
n/
> > > > > (and rename it to something like core.c), because it would be a b=
etter
> > > > > location for that fiile IMO.
> > > >
> > > > We could certainly do that, let's discuss it a bit more.
> > > >
> > > > Although, at this point I want to focus on the genpd providers, as =
to
> > > > release some of the burden from arm-soc maintainers.
> > > >
> > > > > I can also handle future pull requests for this if that's fine wi=
th everyone.
> > > >
> > > > Thanks a lot for your offer! However, if a re-route is preferred (I
> > > > think not?), this is probably better suited via arm-soc, as most
> > > > changes are going to be arm platform specific.
> > >
> > > Which brings me to the final question: what is the upstream path
> > > for changes to drivers/genpd/*/ (or whatever it's gonna be called)?
> > > Before, we sent PRs to (arm-)soc.  Do you expect us to send them to
> > > you? There's usually quite some interaction between drivers/soc/renea=
s/
> > > and drivers/genpd/renesas (and there are DT binding definitions),
> > > but not more than with e.g. drivers/clk/renesas/.
> >
> > I would be happy to pick this up and funnel this via my new genpd
> > tree. As long as it's coupled with changes affecting "genpd
> > providers", of course.
> >
> > I can certainly also collect patches directly from the
> > mailing-list/patch-tracker too. Whatever works for you the best. Of
> > course, in that case I need your acks before I pick up the relevant
> > patches.
> >
> > If we need "immutable" branches, let's discuss that on a case by case b=
asis.
>
> At least for Renesas SoCs, every new SoC comes with a DT binding
> definitions file under include/dt-bindings/power/, to be shared by genpd
> driver and DTS (the same is true for clocks).  So PRs will work best.

Good point! And Neil pointed out this too [1].

I am going to host an immutable branch for the dt bindings that you
can pull in. Would that be a better option for you?

[...]

Kind regards
Uffe

[1]
https://lore.kernel.org/lkml/4303c141-30df-4a2b-aba7-f11a98db9941@linaro.or=
g/
