Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608EAC83F01
	for <soc@archiver.kernel.org>; Wed, 30 Aug 2023 15:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29BCBC433C9; Wed, 30 Aug 2023 15:07:53 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EBD4C433C8
	for <soc@kernel.org>; Wed, 30 Aug 2023 15:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0EBD4C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99c1d03e124so737832766b.2
        for <soc@kernel.org>; Wed, 30 Aug 2023 08:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693408070; x=1694012870; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gsv2vy0NbRUitL+DqdxFoOF89HcPlyA0hr/AZRAjcvs=;
        b=KKjtLw8OUD6HgCOAVj74CuBgoTsjhcooUTxuX1S5orm0gPzdDWPUEgSFFoTEggjUbk
         NmGQ3HAWOwdhNC9ZjFdauVxrnfCQnMtN9rNXwJ+3IYa1tYy9m3eJh4mEoO/ikrlEc1m8
         XrR/x5y3OblJUKWbGzOpj5Xq91fqo6wnsuZoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693408070; x=1694012870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsv2vy0NbRUitL+DqdxFoOF89HcPlyA0hr/AZRAjcvs=;
        b=W5ggxWVD5u0yjJUIhww1UXNfJ43QXiLyoa27DhgmJNBbiqiAvcXtGJl0OehjwVsDfg
         ytDDthnx4dZy7uIa/9cd7ImPy2cJO6KEFqutvIG2J4rZGv8NVwalSijyXOKsk8DNhAus
         ae39vfbiI1MCNJ1sO5zEFDlFo68wmXf65ne+xjJQaBfExeaWtvsd9U594h4L5v99vED5
         vs1JJjGXV2E43dED9/LH7cGRZLI4yD7fvbd5cGxIAxo1JsrrZUY4Gt5WA6KX7XjDiaFI
         p4MFZfHeSlPHSSYY4rZf2JtTL8k0c1nvzfyJasnt5dwZG11FHHoSU1zT3+08qtwV3UlL
         dhmA==
X-Gm-Message-State: AOJu0YwbogAtPdOiFmxCkhGy3swYYk2tGOuCZzk8QwGIxllgjN7cevkn
	9A82PaKsTJVxO9U1W0/JIDBGU9q3+NUqxupeQGPieae/
X-Google-Smtp-Source: AGHT+IHZ14PrM8y/CV4sjFHaSoGPChXQG6DAEhBBaLQpSUYUXsTEO0t8iZJZdv6JMOTFG0BlCaRFQw==
X-Received: by 2002:a17:907:7808:b0:9a1:fab3:ee37 with SMTP id la8-20020a170907780800b009a1fab3ee37mr1939781ejc.14.1693408069835;
        Wed, 30 Aug 2023 08:07:49 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id f18-20020a170906825200b0099364d9f0e9sm7252247ejx.102.2023.08.30.08.07.48
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 08:07:49 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99c0cb7285fso740249366b.0
        for <soc@kernel.org>; Wed, 30 Aug 2023 08:07:48 -0700 (PDT)
X-Received: by 2002:a17:906:cb:b0:9a2:1ec1:625d with SMTP id
 11-20020a17090600cb00b009a21ec1625dmr2019888eji.64.1693408068433; Wed, 30 Aug
 2023 08:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
 <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
 <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com>
 <96bb0de0-06d9-46f8-b02f-dc924afff13c@app.fastmail.com> <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
 <CAPDyKFrJH-1uaPCwnWZDPi4MRtOm=N2CHSRyvjXRDbQ1y-oOrw@mail.gmail.com>
In-Reply-To: <CAPDyKFrJH-1uaPCwnWZDPi4MRtOm=N2CHSRyvjXRDbQ1y-oOrw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Aug 2023 08:07:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj1j0HuNWKLEzi74zEr2rGnMLEFZjLvV=rzdqzQPqOzdQ@mail.gmail.com>
Message-ID: <CAHk-=wj1j0HuNWKLEzi74zEr2rGnMLEFZjLvV=rzdqzQPqOzdQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
To: Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Aug 2023 at 01:34, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> *) The new subsystem is solely intended for the generic PM domain
> providers. Other PM domains providers, like the ACPI PM domains for
> example (drivers/acpi/*), don't really belong here, at least in my
> opinion. So, maybe "domain" isn't specific enough? Although, if not
> using "genpd", I have no better suggestion.

I'm perfectly fine spelling out longer names. "drivers/power/generic"
would be fine to me too, for example.

We can even use names that are longer than 8.3 or - this is heretical
- the 14 characters of the original Unix filesystem. So it could be
something even more descriptive.

I personally always use tab-completion when doing filenames, so at
least to me, longer descriptive names that don't all start with the
same thing are perfectly fine. Others may have more of a typing issue,
so maybe 'generic' is better than 'generic-power-domain'.

(On that note, exactly *because* I use tab-completion, I hate things like this:

   drivers/scsi/scsi_{common,debug,error,ioctl,...}.c

which is entirely redundant in how it just repeats the "scsi" part
pointlessly, causes more typing, _and_ then also causes tab-completion
to not work well. But that's a separate issue).

> I get your point. I was indeed trying to obey the current naming
> strategy, but I think it's not entirely easy to understand what is
> prefered.

It's not like we have any hard rules. Most of our naming ends up being
pretty random, and everybody thinks that *their* TLA is so obvious,
because they've been using it for ages.

But the "please use common and industry-wide TLA's, write things out
otherwise" is a good rule both when it comes to docs and to filenames.

And that "industry-wide" is pretty important. Not some kind of "local
jargon TLA".

We as kernel people hopefully all know what "TLB" or "VM" means, but
every time somebody sends me something like "x86 SEV" patches, I have
to remind myself, and that's despite me being fairly intimate with
x86.

> Please advise me on how to move forward.

Just to not cause pain during the merge window, I think I'll take the
current trees (eventually - I still have other things pending first),
but I would like

 (a) a new pull request message that actually spells things out and
does *not* use 'genpd' as if it was meaningful so that I can at least
have documentation in the merge window

 (b) a plan to rename that directory to something saner and more descriptive

I don't care deeply about what the exact name in (b) is, but it should
be real words that make sense in context. Or a very standard
abbreviations (ie I consider "misc" to be a word, not an abbreviation,
because I'd rather not see everybody butcher the spelling of it).

                   Linus
