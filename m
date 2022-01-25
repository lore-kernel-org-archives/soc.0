Return-Path: <SRS0=03sh=SJ=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A035C433EF
	for <soc@archiver.kernel.org>; Tue, 25 Jan 2022 18:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22CDDC340E0; Tue, 25 Jan 2022 18:47:49 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D50BC340E6
	for <soc@kernel.org>; Tue, 25 Jan 2022 18:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D50BC340E6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id u18so50686482edt.6
        for <soc@kernel.org>; Tue, 25 Jan 2022 10:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uo+vCG3Ml8SK02zUHmttXklj/h/GWPjRaG6auH+OtyU=;
        b=lmBZygBlggBGp5CARgDMs+T/0lc8uiiRV+DyC15Xjyuw1zivr0P+uzPfHHTpyv+WV+
         xNCGrSfnogVVV/yOSQI6exabKLIaqWOS/SvQCeguWrqy5LhZQcRSanvGZnsqPTcoigJw
         5gyQuK/zo1OClHE85S6WZUNbtWokHlnn9Gd7HuYD+LT8JQuTYPtheiEy3VlxJiYM1CMs
         dos+2kQpvjJltM9r+rfB+HUWBCHT+SyPyQC79kU1nAD6WMbAL00UvUstGOsYiemWX10K
         Z0Y+4/gJKtAI9leWKjYzFzqyHPPk0NJOF26Cf/6cKQF326Vh/800H8YF0NVPuneWB9XG
         autg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uo+vCG3Ml8SK02zUHmttXklj/h/GWPjRaG6auH+OtyU=;
        b=334o8UJ8jjMvP0Ben37OVlxoy2M76GRizFdN2rnqktaMy75uyuRAJq0yoZu0uP+ECq
         b1XjPi/pZBvBW7lBEiyIteM2HxlUleEdQAGtFTELsWBREwgZy8ACRkW6bQfFm8S+OdRa
         0Roto5GfdmdGPI+VbZpYdmGsYt51zMZpVq/TPLQJC7kTf5QJEoP29BINAtFT/Zkz1sZ4
         eiOtluWIixGDjVzu4FWRkvt81v8S2XOD6RNRDICYVFCo8fNYqA0fDrEIZJWRtTwGYr8y
         zhoKzZACa4RheluIsd+D1d9pqqKH3fYLneYzh0h+6vVUTPxfsk9zrmJkruUw1bKJ/vSc
         xSlA==
X-Gm-Message-State: AOAM531dgveGigUdvHwud54mON7ikHRjYEEikRTfDoRRYVDS524KoQ8G
	yT0M0+NOMxv0ePtbrTQzSK7Hs4FCBg/qvCnKq8/OBA==
X-Google-Smtp-Source: ABdhPJw6TadSADBrMgWhQ86GN//sE7Pa07DOEUvazOlQK6ZSBxxnv6RcquqP7oVRETGx/lRADU6zfq6YgNtssHJvEWU=
X-Received: by 2002:a05:6402:1d50:: with SMTP id dz16mr11584952edb.108.1643136466485;
 Tue, 25 Jan 2022 10:47:46 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
 <7e480da8-0d54-2d62-0a8e-184901c974b6@gmail.com> <ee2c92da-030c-b92f-0f41-1fdbbeed47c7@gmail.com>
 <CAOesGMgx99GJ3gQmdgauSs3aF8xr4FgcgsELRz4HSVXmujHJnQ@mail.gmail.com>
 <CAK8P3a3sBADt4Cu=LGbjHQpQ32O-BtFk1aQFwhL8Ar=M_gj6Xw@mail.gmail.com> <CAOesGMjArmB1J7KasjHZRTNXoZvtUXkTOQAyg5yd29qC8PeS9g@mail.gmail.com>
In-Reply-To: <CAOesGMjArmB1J7KasjHZRTNXoZvtUXkTOQAyg5yd29qC8PeS9g@mail.gmail.com>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Tue, 25 Jan 2022 12:47:35 -0600
Message-ID: <CAOCOHw43DC5P0p0U+C57JHo1YCicWA37y+gbEMEuJwsZB0NC=Q@mail.gmail.com>
Subject: Re: [GIT PULL 0/5] SoC changes for 5.17
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 12:34 PM Olof Johansson <olof@lixom.net> wrote:
>
> On Tue, Jan 4, 2022 at 5:40 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Tue, Jan 4, 2022 at 7:40 PM Olof Johansson <olof@lixom.net> wrote:
> > > On Tue, Jan 4, 2022 at 1:58 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> > > > On 12/24/21 9:11 AM, Florian Fainelli wrote:
> > > > >
> > > > > Should I resend or fix something in those? Thanks!
> > > >
> > > >
> > > > Arnd, Olof, do I need to resend the 3 pull requests mentioned above?
> > > > Thanks and happy new year.
> > >
> > > I'm about to make a pass of merges, likely tomorrow -- I had to get my
> > > Honeycomb working again since it hosts all the trees and mailboxes for
> > > me.
> > >
> > > No need to resend at this time.
> >
> > It's possible that I had accidentally merged them in the end but tagged
> > the branch without those merge commits, so have a look if it's in there.
>
> Yeah, it looks like there were a few merges not part of the pull
> request (Linus just merged them, so these showed up in
> regen-contents). I'll fold them into arm/late.
>

It seems these (at the last the qcom ones) didn't make it into v5.17-rc1?

Are you planning to pick up the qcom patches for v5.18 or should I
just carry them and include them as I send my next PR?

Regards,
Bjorn

> arm/defconfig
>         broadcom/defconfig [sign: Y Arnd Bergmann <arnd@arndb.de>]
>                 https://github.com/Broadcom/stblinux
> tags/arm-soc/for-5.17/defconfig
>         broadcom/defconfig64 [sign: Y Arnd Bergmann <arnd@arndb.de>]
>                 https://github.com/Broadcom/stblinux
> tags/arm-soc/for-5.17/defconfig-arm64
>         qcom/defconfig [sign: N ]
>
> git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux
> tags/qcom-arm64-defconfig-for-5.17
>         patch
>                 ARM: multi_v7_defconfig: Enable drivers for
> DragonBoard 410c [sign: N ]
>
>
> -Olof
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
