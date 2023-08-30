Return-Path: <SRS0=IGMu=EP=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21261C83F14
	for <soc@archiver.kernel.org>; Wed, 30 Aug 2023 08:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D841FC433C8; Wed, 30 Aug 2023 08:34:16 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5F09C433C9
	for <soc@kernel.org>; Wed, 30 Aug 2023 08:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5F09C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d7485d37283so5081491276.1
        for <soc@kernel.org>; Wed, 30 Aug 2023 01:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693384453; x=1693989253; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xtdiwzQL21GYKlHw5/D0J/VmrjrErWbcUTzSWFrSXes=;
        b=fbaw/nrKBfe1073s9sHlfBwPXxMrEGDgwt65VpUwxea//26i2FPTh2HxPFz4UIXawP
         NnLgC6O0NiT7gNPxwcQglUd/gcKg3ikuvTfsW1kYPsZb6Auv2ngwUeNZBX2bo30hbEEx
         5xvhdl0dQ9E1rIFOJoak4xpBkTwLKoHTA4i5yfbXKFKnGboxfhF2QIEYmvO67C+GYsw7
         gTHerZZm0bBrzFbKAvRjbX84YDxW5qGgj517K2uiXmCyufUqTWmYfPJ+r6TUyzecZl1w
         fIGVMjNZEABQI4FTU/6Eng0801N67pilzEV82Bgp6L66pa4UbU3ngnT8FO7opqUJlKMM
         Oslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693384453; x=1693989253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtdiwzQL21GYKlHw5/D0J/VmrjrErWbcUTzSWFrSXes=;
        b=Ls8ZwCPUpbuBNtu4AXwMrdkUjJOLfn8BEzwmf71vPTY5B1uN+4aV/GQAgTTBdf9/0C
         p8NDrzzgCj3inPiGXgBUO9Mcz9XfOS0UsTQfei1/FFMJKMBRg1YhDm1MAVOHhvopHFOF
         wyx6ix+zSew0oae8KnAJrsHEp8w7ERtIeHW7e8EfHlTC2ravbl58E//HobCwLDXHQbJJ
         YD5W3y9SaUrl00cbYsrkLOlOrQQTpL+qlJXqeZ9wqqveMjXTjnBE5Qa8SieeVZO0K3+a
         xxU0b3uDShojr4Wkad0ebm14L3tVZtCZXIBn0t0o7YweB+cM7IZI5nzbbZ0bvTemYXzC
         7IuA==
X-Gm-Message-State: AOJu0YzEY7U7QOT/xVeiFId4rUpUMkaSDtvUclnUPAprOor1pu+JMCXq
	w43xbyVPqDBFN7tnSQSNL+UvLDx1H1+se1sCPqzxdVFDjKVvoCQmxVxZUg==
X-Google-Smtp-Source: AGHT+IGtJWftzWF4BAzABxuDQ6HGZfR/UnHG8Az6ZEx5vM7b+S86qvW3j5sh8nuhOsKgT8Zm9TWVIp5MYnP+H44iMh4=
X-Received: by 2002:a25:6944:0:b0:d53:f98f:8018 with SMTP id
 e65-20020a256944000000b00d53f98f8018mr1490963ybc.65.1693384453468; Wed, 30
 Aug 2023 01:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
 <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
 <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com>
 <96bb0de0-06d9-46f8-b02f-dc924afff13c@app.fastmail.com> <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
In-Reply-To: <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 30 Aug 2023 10:33:37 +0200
Message-ID: <CAPDyKFrJH-1uaPCwnWZDPi4MRtOm=N2CHSRyvjXRDbQ1y-oOrw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
To: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Aug 2023 at 03:20, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 29 Aug 2023 at 17:48, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > How about moving it to drivers/power/domain/ instead?
>
> That sounds like a sensible name and would seem to fit logically with
> our existing tree structure quite well.

I am sincerely sorry if I have annoyed you with picking the name
"genpd" as the directory-name - and especially without further
explanation. The genpd thing certainly deserves to be documented
better, I will try to get some time to do this soon. Anyway, me and
many others in the power/performance areas that have been working with
the genpd interface, have simply gotten comfortable using the "genpd"
acronym. Hence, the naming was a no-brainer to me.

That said, if you feel that the above directory-path/name is a better
fit I can certainly move it over there, np! Although, before you make
the final decision I want to point out a few things for you to
consider.

*) The new subsystem is solely intended for the generic PM domain
providers. Other PM domains providers, like the ACPI PM domains for
example (drivers/acpi/*), don't really belong here, at least in my
opinion. So, maybe "domain" isn't specific enough? Although, if not
using "genpd", I have no better suggestion.

**) Please keep in mind that we have several other power/performance
related subsystems that don't live under drivers/power/*. Moving more
things in there is not really going to help the people that work on
these things. No matter where and what the name of the subsystem is,
one simply needs to dive into the details anyway. Moreover, in this
case, "genpd" isn't just about "power" (idle management) but
performance management too.

>
> > I don't think we can easily rename the interfaces that have been
> > in use for the past 12 years
>
> I actually think the interface names are much less of an issue, since
> anybody using them is presumably familiar with the naming.
>
> It was only with the directory structure that I reacted to it, because
> that kind of exposes the naming to people who definitely are *not*
> familiar with it (ie me, but presumably anybody else who sees the
> diffstats etc fly past).
>
> And yes, we have a number of other pretty obscure driver names in our
> tree (I end up having to remind myself what "ntb" and "hsi" etc mean),
> and I don't tend to love them either, but at least they tend to be
> industry / vendor names.

I get your point. I was indeed trying to obey the current naming
strategy, but I think it's not entirely easy to understand what is
prefered.

Please advise me on how to move forward.

Kind regards
Uffe
