Return-Path: <SRS0=XNXb=EQ=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798BEC83F10
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 11:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C290C433C9; Thu, 31 Aug 2023 11:37:42 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7AFBC433C7
	for <soc@kernel.org>; Thu, 31 Aug 2023 11:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7AFBC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d7d15e6884dso459547276.0
        for <soc@kernel.org>; Thu, 31 Aug 2023 04:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693481859; x=1694086659; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lypt1ExDbkEeEChHfWqa/VhxnyCI/TkoTn/TCNMR5X8=;
        b=mLrar26ZjPHMhERJYZU69WgJLqSC+4Xs6SOibmK2+ry14T/dzCYY150IFZWRtenIpr
         2C/6pY9dEhbMbnsScDpNXohlglWkHV7UvykRZ9swSofVJrzlpCSR1MKH2eGxGPCyQ4cp
         xaxgOiEwNFg0nN19lCab76/Rg9u+litobTMTeZH4jrBkhuB7OM0mJ9AeRB0uBokP/LjN
         4oMJrfbmkzA3gXXFZZaL9jQ0EftMBOTjespqSc15YgjaP9dxiQ90cvUV7tT1f1kGuZ7f
         9ip6u8e3LfvG0FGF7x18fd5ZCUroOj5WqMxSeaCpVcZrgdXFE1fvcAr56lIILAG3kuSd
         0+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693481859; x=1694086659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lypt1ExDbkEeEChHfWqa/VhxnyCI/TkoTn/TCNMR5X8=;
        b=lcJj6wkRX1aBY1m+PbO5xOPdOpTKsHHCfoSzdVz5Dr7VCU/0VQ/rGh3RSkG9GrNnzn
         +BeIRlmib4LHhYpleHtkSNuHmsCyrJRM8PfZYhsahd4DmyAs7kROvPt8i3T/I9J1ypAj
         +o0eudr4rPLHc92feXysiv9Pux45SFjApyTmYD1RXhxkpgqGqubcT6d75h76lu5z2U01
         MPRUjbWiuG7OgbHDALs2+CLexqym9Kz88NIe99rIqxXlNASXpTceZ23+xwRZ75XdSpmy
         NYSOHmNz1EQAr7npj3cnvbgh9oXHxDI1ZGIafeoSd3BBdJvHzReOu8L23+bLP4LcsV63
         0ceA==
X-Gm-Message-State: AOJu0YyvC36Cx5j/ZVwCUn/CWtB1wRpbp+tsqpV59o9NHaOzxmxJ2p/Q
	Sfg/hyyblBH21tcYMpHP2qHXtaCwn11lU6RBxempSQ==
X-Google-Smtp-Source: AGHT+IGBvK3EVwNwH9rlAiV5YEc2n1O3boSOPFtTlRByjOV/DKA4yqbSCqz3ilp2WwhzpF6hM6wL2mYOd3TXCTemySw=
X-Received: by 2002:a25:fc21:0:b0:d0e:99be:5da2 with SMTP id
 v33-20020a25fc21000000b00d0e99be5da2mr4719634ybd.65.1693481859667; Thu, 31
 Aug 2023 04:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
 <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
 <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com>
 <96bb0de0-06d9-46f8-b02f-dc924afff13c@app.fastmail.com> <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
 <CAPDyKFrJH-1uaPCwnWZDPi4MRtOm=N2CHSRyvjXRDbQ1y-oOrw@mail.gmail.com> <CAJZ5v0hqWYnkNXVju3U3n-9i8eqtjs197tLLNWv8Qa_N9T=KEw@mail.gmail.com>
In-Reply-To: <CAJZ5v0hqWYnkNXVju3U3n-9i8eqtjs197tLLNWv8Qa_N9T=KEw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 31 Aug 2023 13:37:03 +0200
Message-ID: <CAPDyKFpXLj_2HAgyV_VJf+GPQVmxb_iiDe77Q2MY17MDNqy9fA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
To: "Rafael J. Wysocki" <rafael@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Aug 2023 at 11:33, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Wed, Aug 30, 2023 at 10:34=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.=
org> wrote:
> >
> > On Wed, 30 Aug 2023 at 03:20, Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > On Tue, 29 Aug 2023 at 17:48, Arnd Bergmann <arnd@arndb.de> wrote:
> > > >
> > > > How about moving it to drivers/power/domain/ instead?
> > >
> > > That sounds like a sensible name and would seem to fit logically with
> > > our existing tree structure quite well.
> >
> > I am sincerely sorry if I have annoyed you with picking the name
> > "genpd" as the directory-name - and especially without further
> > explanation. The genpd thing certainly deserves to be documented
> > better, I will try to get some time to do this soon. Anyway, me and
> > many others in the power/performance areas that have been working with
> > the genpd interface, have simply gotten comfortable using the "genpd"
> > acronym. Hence, the naming was a no-brainer to me.
> >
> > That said, if you feel that the above directory-path/name is a better
> > fit I can certainly move it over there, np! Although, before you make
> > the final decision I want to point out a few things for you to
> > consider.
> >
> > *) The new subsystem is solely intended for the generic PM domain
> > providers. Other PM domains providers, like the ACPI PM domains for
> > example (drivers/acpi/*), don't really belong here, at least in my
> > opinion. So, maybe "domain" isn't specific enough? Although, if not
> > using "genpd", I have no better suggestion.
> >
> > **) Please keep in mind that we have several other power/performance
> > related subsystems that don't live under drivers/power/*. Moving more
> > things in there is not really going to help the people that work on
> > these things. No matter where and what the name of the subsystem is,
> > one simply needs to dive into the details anyway. Moreover, in this
> > case, "genpd" isn't just about "power" (idle management) but
> > performance management too.
> >
> > >
> > > > I don't think we can easily rename the interfaces that have been
> > > > in use for the past 12 years
> > >
> > > I actually think the interface names are much less of an issue, since
> > > anybody using them is presumably familiar with the naming.
> > >
> > > It was only with the directory structure that I reacted to it, becaus=
e
> > > that kind of exposes the naming to people who definitely are *not*
> > > familiar with it (ie me, but presumably anybody else who sees the
> > > diffstats etc fly past).
> > >
> > > And yes, we have a number of other pretty obscure driver names in our
> > > tree (I end up having to remind myself what "ntb" and "hsi" etc mean)=
,
> > > and I don't tend to love them either, but at least they tend to be
> > > industry / vendor names.
> >
> > I get your point. I was indeed trying to obey the current naming
> > strategy, but I think it's not entirely easy to understand what is
> > prefered.
> >
> > Please advise me on how to move forward.
>
> If I may suggest something, I would call this "pmdomain" instead of
> "genpd".  I don't think that /drivers/power/ is a particularly
> suitable location for it, because it doesn't really have much to do
> with power supplies and more to do with device PM.

"pmdomain" is probably giving a reasonable good hint of what goes on
in this subsystem. This works fine for me, thanks!

>
> Also, I would move drivers/base/power/domain.c to drivers/pmdomain/
> (and rename it to something like core.c), because it would be a better
> location for that fiile IMO.

We could certainly do that, let's discuss it a bit more.

Although, at this point I want to focus on the genpd providers, as to
release some of the burden from arm-soc maintainers.

>
> I can also handle future pull requests for this if that's fine with every=
one.

Thanks a lot for your offer! However, if a re-route is preferred (I
think not?), this is probably better suited via arm-soc, as most
changes are going to be arm platform specific.

Kind regards
Uffe
