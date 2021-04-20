Return-Path: <SRS0=+HkC=JR=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CC4C433ED
	for <soc@archiver.kernel.org>; Tue, 20 Apr 2021 10:18:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4BCFE61168; Tue, 20 Apr 2021 10:18:33 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72CB06103E
	for <soc@kernel.org>; Tue, 20 Apr 2021 10:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72CB06103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M1aQN-1lWJQL2mgl-0031mb for <soc@kernel.org>; Tue, 20 Apr 2021 12:18:30
 +0200
Received: by mail-wr1-f47.google.com with SMTP id r7so25002481wrm.1
        for <soc@kernel.org>; Tue, 20 Apr 2021 03:18:30 -0700 (PDT)
X-Gm-Message-State: AOAM533zuzvG3ywwf77lgqtnUv8ZsFiEB6JfkLmmSs3bWWVLJ48SJ+CM
	F2rZHJ0l1JMDSEARfpZP9CMexgSy+qaSwVJp42M=
X-Google-Smtp-Source: ABdhPJyUDsDPQ/TzUO8hSAxeXP/7fjRSZkp95zkMD5TB1W8OuX2Qb7o1zHiTDoK9iL0zdA6C2BM7nWmTaVrP5+w7sgI=
X-Received: by 2002:a05:6000:1843:: with SMTP id c3mr20452851wri.361.1618913910297;
 Tue, 20 Apr 2021 03:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
 <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com> <CACPK8XfkSQpMz9J+8xN7DP9Wabv=+DAgmX6NGL9742Ss3HsehA@mail.gmail.com>
In-Reply-To: <CACPK8XfkSQpMz9J+8xN7DP9Wabv=+DAgmX6NGL9742Ss3HsehA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 20 Apr 2021 12:18:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0OJhjF4R1zCm0jD_MUiS8TeDR2x9wTsTC5Apr5Mq_fSg@mail.gmail.com>
Message-ID: <CAK8P3a0OJhjF4R1zCm0jD_MUiS8TeDR2x9wTsTC5Apr5Mq_fSg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:A4BkvFSUWasiHycXiBQb6fOUlyUY1a0oWl9tyU+uuFDm001knFy
 ojW9DNby8+GnYL/W8XXILf4bMaUZo8M6/A+Cs0Y6R0GCGOX7V2e3nsmb8os1mGk7WawznoO
 dFXAEAgkLT//4wCUwnK6yGHavCpjmBFmB/Fox9kwCd7PiUPHtGGH4tFHV7H5lyNIdyLQgLg
 9bDby9FmYK6IxaufTwOsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZlYIb3usb+E=:jd2E7euFwn3ZsS1G9Ybb+m
 fq7LFGpFWHNfB7KQENfuXErfGQSWJr3dQuTBj5c3eJKQdtTtGrgR7YboznWwE+GWceN6/KYc0
 8rG81jJiF2WUib9Bbio7wJoqBc0CfkSyYSqkV8uWFVwGy3L2QeXw/cSuOj9WnL3b5cr2MJkXB
 1Hae7cWbhBqCC/+kwrS0OU1ThTJ+apod4QxhocylyfpAI3UjrjNR/Cst1KehENcBm0SKU7CfC
 h3qSbsBqG0lDBixw38i9V/bHqOTdrSPGWQccRhn5Xs7RJJMA1z84CDuxGYQfipQVbXJI9mRZ5
 TH1+dz7FUE2M5gE3SpZA5SalsselohMo7ekkxqVAn7RIg6b2NbNqzyKVFeg9k/2WXrTjqm0Xg
 Jy073XxueIpuRk5m3BLVwMPK6qn/ragHzcNa+72wzI2VOvWDnHuBoH8fCfU+focfR54onGwry
 7BlwTGHqyLo3ecsX5gUDQDW7MkiMZ+XFlMg2LXlEaNn+k7zeq4L6GjoCSWdxRPUckNrdyKwmI
 5LMuZ8Zhl1OAodsCbNttS4=

On Tue, Apr 20, 2021 at 9:11 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 19 Apr 2021 at 14:44, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, Apr 16, 2021 at 5:27 AM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > Hello Soc maintainers,
> > >
> > > Here are some fixes for the changes that have already been merged for v5.13.
> > >
> > > I also merged some changes that came in later. If you would prefer to
> > > not take them then I can send a pull with just the fixes.
> > >
> > > The following changes since commit f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
> > >
> > > for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
> >
> > Hi Joel,
> >
> > something about this pull request doesn't add up, and 'b4' refuses
> > to pull it since the 'since commit f0145db2' and 'up to f0145db2'
> > references refer to the same commit.
> >
> > I assume this is just a copy-paste error on your end, but it would
> > be nice if you could double-check and resend the pull request
> > based on the ee33e2fb3d70 commit that I merged.
>
> Nice catch. It looks I've generated pull requests incorrectly from
> v5.5 onwards, and this is the first time we've noticed. My bash
> history shows I started generating them like this:
>
>  git request-pull tag url tag

Ah right. I'm surprised this resulted in the correct shortlog
and diffstat, but that clearly explains it.

> I'll try sending this one again now.

I only started using b4 recently, so I wouldn't have caught it in the past,
as I wasn't paying close attention to the commit hashes. I usually
tried to ensure that the contents match up with the description, and
that worked fine. I've had sporadic problems in the past with b4 and
it's possible that I just papered over it with a manual merge thinking
that I did something wrong instead of b4 pointing out an actual
problem.

      Arnd
