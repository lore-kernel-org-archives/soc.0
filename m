Return-Path: <SRS0=Q9lI=RH=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7A9C433EF
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 22:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB738C36AEA; Wed, 22 Dec 2021 22:07:07 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B0A2C36AE5;
	Wed, 22 Dec 2021 22:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B0A2C36AE5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M1YtP-1n1XbX1qcF-0031yv; Wed, 22 Dec 2021 23:07:04 +0100
Received: by mail-wr1-f47.google.com with SMTP id r17so7618515wrc.3;
        Wed, 22 Dec 2021 14:07:04 -0800 (PST)
X-Gm-Message-State: AOAM533RQfryhxt2S+jeyoCkPS4ypMUu+OoozBGnUR1q3TInCFjTaNTx
	c5b3RUZOURFQlRxkhA4J3w5t7MYDdnxaKAsYpZM=
X-Google-Smtp-Source: ABdhPJzzBYkUBpyhb9+uQV9hiCG0IJ/EfIoS9CtTtV40ZNSoDzeFEr2Xo8Ij+vyFx3mgMm10HU0EQEB1/Tx3N/0MpFs=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr3223788wru.12.1640210824096;
 Wed, 22 Dec 2021 14:07:04 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xc6q=N6iFLnHt8RHhxvBhqu73WN9jBvitbwU3L6SJv85Q@mail.gmail.com>
 <164021040904.6701.11939230483125968234.git-patchwork-notify@kernel.org>
In-Reply-To: <164021040904.6701.11939230483125968234.git-patchwork-notify@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Dec 2021 23:06:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3MrzmsFGwzBJonZeRF9kOr5-rMq5WcUtEONKCPgzF1QQ@mail.gmail.com>
Message-ID: <CAK8P3a3MrzmsFGwzBJonZeRF9kOr5-rMq5WcUtEONKCPgzF1QQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.17
List-Id: <linux-soc.lore.kernel.org>
To: patchwork-bot+linux-soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Ri2FB5maY/gc/PL2gm8XrA1btIc14nqjttVJeWkHgOe5J2Uk1FD
 gelP5BsQPrGerNAvKPIY2AafGv1R4jIKse98Oa/aE08Jjlt3+HBk/SMCUVQDNfGuLr8cso5
 +FHKnC+EczmCzx76+N5er11+Wx15o2ghJgZ7W69mpj9DOXm+axadRCrSVK810bvlKTdCm/j
 nC40z7UIXkc5VTZqieAOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IBqdtAQ7Wr4=:QUeLf8/dANn4xk7AmH0AQv
 g41z6lO9zNbuXZrSmA/GbF/Itd/s0oNAGSBONZCPOPHHPuv8n4OiKXp21v55jALPye/K3mTZU
 /a11R/LpK+FLmgyX6wTXrhg7EOZnCXp0w31iGdTuYfoC0AIUY8Bv3fH2IvqIDp7Yk4/gdwgUZ
 o20Qmt+xn5wNzHikt9NEP98CyK61n7YRi5MkTTJuQVt0rFc+bwehWVum20RTOM5ps0vc42YsM
 ws5ZsfYKLpXO2HbycPcFluq4iG6MnHtj1ITJlcxZTZII35VUVqblrBiw9giP7xLxAZqVjltFd
 UcoouMwNwDRtn+8Skhrdw2D/S/C0KdrmnNmouBCPCLRdwTqWEHqOg8DdtrscfGpca5aROVHDN
 RPO9ejTvDrMqDmUbmEfi2b9Y8igEH8af5ImzcmGqgMbD/PVUMYmEvsm8sBZ4uqdSk1mg1CBeB
 KD3l8mReQhCkGIylfQonnQ5sZm8sefdsIGEQIxkYQnnfEu82x7Z0Jb+1kUsXXjaUt+g3Wuhyu
 OC5xiq3k741By2xtpGvvlvWj0Rp6Go729JgGhw5W53E/lD8Zdtv6NX3I9OCvBEo12ITeOzLT4
 nKuzxcmZuVnLyIAJW/HjquBOgXEQoa7BKL3DpPv7xe6q34mE8bxSoJEZQbVHQYsg3U/tu9pK5
 rtUx+gPnE9crYD6+TnuC42bEdBc4kB0huLP0jBNIxPo/67rQL97WN2Bu4nCprV/So+TakSXEQ
 1iZqpXXrX/P2YL+Hzz98pii1s2jkND3B6owyIA2DRthyh1aQnHRWjmlfRoi37AnDiViYlCMFn
 Yyta1JkmOgZV8a5i1j8TM+yUF+heWR2zw7FAavBb7n2Q1qTHbo=

On Wed, Dec 22, 2021 at 11:00 PM <patchwork-bot+linux-soc@kernel.org> wrote:
>
> Hello:
>
> This pull request was applied to soc/soc.git (for-next)
> by Arnd Bergmann <arnd@arndb.de>:
>
> On Wed, 22 Dec 2021 01:55:38 +0000 you wrote:
> > Hello Soc maintainers,
> >
> > Here are the aspeed soc changes for v5.17.
> >
> > The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> >
> >   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> >
> > [...]
>
> Here is the summary with links:
>   - [GIT,PULL] ARM: aspeed: soc changes for 5.17
>     https://git.kernel.org/soc/soc/c/19bc5e6380f0
>
> You are awesome, thank you!

I pulled this and accidentally pushed out the branch before looking at
the contents.

I'd actually prefer to not take this one for 5.17, as I see two problems
with the soc-id driver:

- the sysfs attributes are not documented in Documentation/ABI/stable/
  as far as I can tell (let me know if you have queued a patch elsewhere)

- I actually want to avoid custom attributes on soc device instances as much
  as possible. I have not looked in detail at what you add here, but the
  number of custom attributes means we should discuss this properly.

The other patch seems fine, we can merge that as a bugfix. Let's
revisit the sysfs patch next year for 5.18.

      Arnd
