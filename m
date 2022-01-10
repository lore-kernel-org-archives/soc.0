Return-Path: <SRS0=LZNr=R2=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5409C433EF
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 18:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 829D8C36AE9; Mon, 10 Jan 2022 18:33:05 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87F4AC36AE3
	for <soc@kernel.org>; Mon, 10 Jan 2022 18:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87F4AC36AE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pj1-f50.google.com with SMTP id pj2so13318922pjb.2
        for <soc@kernel.org>; Mon, 10 Jan 2022 10:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EdcKV+SsL0jCXV8u1Czp24wEEQPdwJdrZT34tWNtq3Q=;
        b=oJU/NSZJEbIYIt5ZSSnmiVz+walI6/FlD0xbvsZrIQ2QQ0/zJNtwfarhhp/f0T+/Md
         f5dRLoZCJLnykMJu4/FP0brgmCKgEOwCqro3SueoRdrZdHBzdvaf5/wxYbtCm3AVF3Bt
         WYM7ytcfPdO9HkOS7WeMNj/D4wyPL0Mi2T7xePSWTrqz8+vYACjqp3YWQdNhtAm5Uwfs
         zpIKw8KFjL9RW8ekTWnaiTzUKa/OyOlovtw46dTlGfL0g7zGpTOncFn3HP/p17ylIhUv
         WIrUetZXJ8mnqEZe7jU5ZoIj5R2YU+FUoB/KsgzqaKDs2jHEYHhqXYw+55Vu4v+APg6W
         zJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EdcKV+SsL0jCXV8u1Czp24wEEQPdwJdrZT34tWNtq3Q=;
        b=j8XdQcLCb/HV7L5geGrfFLF9U+ykPXeiU4o8eXU1U00bJQgN4MEnaNB70HYTILyuLA
         VSmLa23de3yZhBvmf4nqgeVNVDwRQvm9wrfi0cSgw6pkzZwX/9oXVT1d7TWB8H0nI8bl
         PPY2faOP93ND7AaRA1D+XPwUF8HPtoYpa4OhbK+OqXRTkICQUgrAq9RvpeVFyAaDqckL
         NJJVNC0wkBkNDktebCJo+MW33qJfEUOwElvyG0GGchQEqd438UdThhr7QWpI9oUyM7Pr
         5ZOxCDjNTbTyAko+fQiKsoiOE4T7QUuna+1rCciKpHySCvysv7nE39XV1w/BtJFAYwve
         Svkw==
X-Gm-Message-State: AOAM5312VotHO2u1SUvwpuRGNz7j98h3JpelQUytRaFv08Mw28aWsd4/
	l/32tAp7nR1Eazf62A6BOZNZnjiP99VCK4NP0oJZEp3HGn/AaA==
X-Google-Smtp-Source: ABdhPJzIMi+WJwGBIcQdP6AIC3ctmNDZzyBtiEhCrobmVpdv6qrrck1nuRCeMAVK9V7JTKKtMqnr4urWwVRE6IFbBoA=
X-Received: by 2002:a17:902:e54f:b0:14a:1bbf:9cf0 with SMTP id
 n15-20020a170902e54f00b0014a1bbf9cf0mr667932plf.158.1641839583767; Mon, 10
 Jan 2022 10:33:03 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
 <7e480da8-0d54-2d62-0a8e-184901c974b6@gmail.com> <ee2c92da-030c-b92f-0f41-1fdbbeed47c7@gmail.com>
 <CAOesGMgx99GJ3gQmdgauSs3aF8xr4FgcgsELRz4HSVXmujHJnQ@mail.gmail.com> <CAK8P3a3sBADt4Cu=LGbjHQpQ32O-BtFk1aQFwhL8Ar=M_gj6Xw@mail.gmail.com>
In-Reply-To: <CAK8P3a3sBADt4Cu=LGbjHQpQ32O-BtFk1aQFwhL8Ar=M_gj6Xw@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 10 Jan 2022 10:32:52 -0800
Message-ID: <CAOesGMjArmB1J7KasjHZRTNXoZvtUXkTOQAyg5yd29qC8PeS9g@mail.gmail.com>
Subject: Re: [GIT PULL 0/5] SoC changes for 5.17
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 4, 2022 at 5:40 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Tue, Jan 4, 2022 at 7:40 PM Olof Johansson <olof@lixom.net> wrote:
> > On Tue, Jan 4, 2022 at 1:58 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> > > On 12/24/21 9:11 AM, Florian Fainelli wrote:
> > > >
> > > > Should I resend or fix something in those? Thanks!
> > >
> > >
> > > Arnd, Olof, do I need to resend the 3 pull requests mentioned above?
> > > Thanks and happy new year.
> >
> > I'm about to make a pass of merges, likely tomorrow -- I had to get my
> > Honeycomb working again since it hosts all the trees and mailboxes for
> > me.
> >
> > No need to resend at this time.
>
> It's possible that I had accidentally merged them in the end but tagged
> the branch without those merge commits, so have a look if it's in there.

Yeah, it looks like there were a few merges not part of the pull
request (Linus just merged them, so these showed up in
regen-contents). I'll fold them into arm/late.

arm/defconfig
        broadcom/defconfig [sign: Y Arnd Bergmann <arnd@arndb.de>]
                https://github.com/Broadcom/stblinux
tags/arm-soc/for-5.17/defconfig
        broadcom/defconfig64 [sign: Y Arnd Bergmann <arnd@arndb.de>]
                https://github.com/Broadcom/stblinux
tags/arm-soc/for-5.17/defconfig-arm64
        qcom/defconfig [sign: N ]

git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux
tags/qcom-arm64-defconfig-for-5.17
        patch
                ARM: multi_v7_defconfig: Enable drivers for
DragonBoard 410c [sign: N ]


-Olof
