Return-Path: <SRS0=s32l=E3=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4977CEEB57D
	for <soc@archiver.kernel.org>; Mon, 11 Sep 2023 11:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 023C1C433C8; Mon, 11 Sep 2023 11:28:47 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD6B2C433CA
	for <soc@kernel.org>; Mon, 11 Sep 2023 11:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD6B2C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d7b9c04591fso3596367276.3
        for <soc@kernel.org>; Mon, 11 Sep 2023 04:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694431724; x=1695036524; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aH+LgtXU/bZep1051Dmp3W7xLVGoC7LOjeeK6uQUB0=;
        b=kkAf9MFrDE9rvvx82I4OMCw2Ij/6HNyE6sJmvVNn/mMsvM63OhDqowB9pCave4FMoI
         onCQcHFUXl8DEzHCnq1XAIp+wKanqbgKF6UGmDyOAr0d030zMQu6xwvFDpXXK9MqULMr
         z1EtGIEsaIVdPtNsoDyfCbYnqacCe7oHTUdfh3fmf5CwLdt8pbycOMUJEkoZRliB9jI7
         yw6nDWUdBKk5JzOCOIHtNqbtZr2xtP/GmDdb1/H8Cz5eXf33nQYU2DHrxFp4e/IdytC2
         Ovmh+qtjfD8hTY2yztP0bk4xWK3S/OBEtf48LVKrfzlG8GPOXvaD4p67p31Q37lFj0ir
         40Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694431724; x=1695036524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aH+LgtXU/bZep1051Dmp3W7xLVGoC7LOjeeK6uQUB0=;
        b=APdTyzFHBKnCgUioz/9UwIIZ1sSNOJAHWTrbRXiEm8RCYsUkJc+h4cbh3ZzUeoAxy5
         Uh2kLxVU425QzXs3pl750H2qX/I6WFE62sMzg3O1LLDmseYA4ctvl+wVZJ8nYI6cN8Vp
         z9ugTKW8+BfeCDW4Ba3E3aHGAxDNZ60UhgSlUq5gHlF5cbPmQ/hXjPtOLi9hVgJ2JGIw
         p34CbVfYeg3b6SuVI+bLtFBEGFHBU3DXSlM1d3q3OaxiXkY4bFCxS8gLS2eghRAbhVBP
         NtX5x0b2cHscYiuEmLrg0hLS1mPw+QwsWKNMaJ7Vf0HRLaBYQqEG+4rlXS6/ucC+xiqf
         /BrQ==
X-Gm-Message-State: AOJu0YzIb3/0vDv9mg3LD3cbB5KrnyN/RgPDw7y/8h+rbAfN2hbRY+ot
	AIzzkiWzzRnjBwo0WQbmg8Q+6NM4HEIHpRiDpg34IJcyUCJaxck6sGU=
X-Google-Smtp-Source: AGHT+IEswWwSSaXU++NcaMiC0Ujkjj+Vn04CKhSZv7TtPGdjUYWT5Z8lgFE+X0lYJNg7DMjyqZlAFXqETyStZY8C9vo=
X-Received: by 2002:a25:b16:0:b0:d7f:cdc8:e17c with SMTP id
 22-20020a250b16000000b00d7fcdc8e17cmr7889180ybl.51.1694431724711; Mon, 11 Sep
 2023 04:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
 <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
 <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com>
 <96bb0de0-06d9-46f8-b02f-dc924afff13c@app.fastmail.com> <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
 <CAPDyKFrJH-1uaPCwnWZDPi4MRtOm=N2CHSRyvjXRDbQ1y-oOrw@mail.gmail.com>
 <CAJZ5v0hqWYnkNXVju3U3n-9i8eqtjs197tLLNWv8Qa_N9T=KEw@mail.gmail.com>
 <CAPDyKFpXLj_2HAgyV_VJf+GPQVmxb_iiDe77Q2MY17MDNqy9fA@mail.gmail.com> <CAMuHMdVxLkxN0bmSRXW74R_dGNDSRDB4Z=zE0DoiXDOuweSM0A@mail.gmail.com>
In-Reply-To: <CAMuHMdVxLkxN0bmSRXW74R_dGNDSRDB4Z=zE0DoiXDOuweSM0A@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 Sep 2023 13:28:08 +0200
Message-ID: <CAPDyKFpUUJeGD77GTYCk59cvW=SdGTkOEXH4dap1JQWekAa0Eg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
To: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Sept 2023 at 09:52, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
>
> Hi Ulf,
>
> On Thu, Aug 31, 2023 at 1:39=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> > On Thu, 31 Aug 2023 at 11:33, Rafael J. Wysocki <rafael@kernel.org> wro=
te:
> > > If I may suggest something, I would call this "pmdomain" instead of
> > > "genpd".  I don't think that /drivers/power/ is a particularly
> > > suitable location for it, because it doesn't really have much to do
> > > with power supplies and more to do with device PM.
> >
> > "pmdomain" is probably giving a reasonable good hint of what goes on
> > in this subsystem. This works fine for me, thanks!
>
> Sounds nice!
> All of this lives in <linux/pm_domain.h> (with underscore?) anyway,
> and "PM Domains" is the usual naming, as it covers both Power and
> Clock Domains.
>
> However, although I am quite familiar with genpd, I am still wondering
> what is the meaning of the "generic" part in the name? And what is a
> non-generic PM Domain?

I guess generic here means "works for most cases".

There are certainly a bunch of other "non-generic", like the ACPI,
pm_clk, OMAP2, etc.

Maybe some of them could be converted to genpd, but that's another story.

>
> > > Also, I would move drivers/base/power/domain.c to drivers/pmdomain/
> > > (and rename it to something like core.c), because it would be a bette=
r
> > > location for that fiile IMO.
> >
> > We could certainly do that, let's discuss it a bit more.
> >
> > Although, at this point I want to focus on the genpd providers, as to
> > release some of the burden from arm-soc maintainers.
> >
> > > I can also handle future pull requests for this if that's fine with e=
veryone.
> >
> > Thanks a lot for your offer! However, if a re-route is preferred (I
> > think not?), this is probably better suited via arm-soc, as most
> > changes are going to be arm platform specific.
>
> Which brings me to the final question: what is the upstream path
> for changes to drivers/genpd/*/ (or whatever it's gonna be called)?
> Before, we sent PRs to (arm-)soc.  Do you expect us to send them to
> you? There's usually quite some interaction between drivers/soc/reneas/
> and drivers/genpd/renesas (and there are DT binding definitions),
> but not more than with e.g. drivers/clk/renesas/.

I would be happy to pick this up and funnel this via my new genpd
tree. As long as it's coupled with changes affecting "genpd
providers", of course.

I can certainly also collect patches directly from the
mailing-list/patch-tracker too. Whatever works for you the best. Of
course, in that case I need your acks before I pick up the relevant
patches.

If we need "immutable" branches, let's discuss that on a case by case basis=
.

>
> And I just realized you moved the code and Makefiles to drivers/genpd/,
> but not the Kconfig symbols and logic, which still lives under
> drivers/soc/.  So resolving that (and the name) is something that
> should be resolved sooner rather than later...

In regards to the name, I am relying on input from Linus to make a
final decision before I send a patch. In regards to this, I have also
started working on a documentation patch for genpd. It needs some more
polishing before I can send it though.

When it comes to the Kconfig move, I will send out a series for it, this we=
ek.

[...]

Kind regards
Uffe
