Return-Path: <SRS0=HkMw=TP=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8802FC433F5
	for <soc@archiver.kernel.org>; Fri,  4 Mar 2022 10:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E21DC340EE; Fri,  4 Mar 2022 10:09:57 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BCDC1C340E9
	for <soc@kernel.org>; Fri,  4 Mar 2022 10:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BCDC1C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id q9so8523657vsg.2
        for <soc@kernel.org>; Fri, 04 Mar 2022 02:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RSJBHH3RIOxPBOcxPLKpTBjHoXhMbYFt7YY2XmHkL2c=;
        b=LVJRTrUwjgLtiChQ4t98fTwWF5nmzhttA+KFC8QBwhkjXiQ/+93m1cUkxQ9yDGOZh1
         lCm3tbCQ7jq9MRaiDNoxZkviTZvO9CvuVDJ8luzEcK5zpSLqbpXET4v0KeHLRX7aohcN
         nWxHCUhJIPN+/KLh+UK9gAGZdTA0R2eo+I7Mbj0jfvUrn/82uQ4uTmUfwK/nQQW7vgF1
         dpu2+lxPhier/0JMjkml30u0FC3joN1conEQcGRtUxs7DtkPo8Pz7St+8AJ29tPLQTBp
         T9Lyg4OuefdcU54lIjazBZf7jnArGGUH4zGRJXMpALvkRJXNkBQw9FuCELHzDxd4TWNj
         EeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RSJBHH3RIOxPBOcxPLKpTBjHoXhMbYFt7YY2XmHkL2c=;
        b=AIQKBuN1r1Szz6JqfWTm8JzGBwZS2iAU85OWzg0KPnDEBhl2FIIvtujwbALE0EvGym
         BtpaiHP2VzjfR+0ZtQjCeTHNwp292UtOJWihyqN9Od0ava4KkzTmUDH5sEZyd1rsCXZD
         yN2F8ktmSJI1SS0P+tgFaspEZHfC9pccgX5ywUoT+0ZfD8ma+8UfHp1zAwgTW0leGNuH
         FbriFguDDHN+4nbNkFWc1JsrJ8IcoCcPnLUwn/B5F2QXiHbXfQZlZUcJUlTN9E+8xKBV
         3GB6qXOmEkAxv8Rf1v72XgXdT0LSXfdwaTyi4vskAId0zkKJZwmCWA7SfkfDOorxsw2J
         nQlQ==
X-Gm-Message-State: AOAM533oSvXdOdAUGbKmbLJaxnftJygHzh633AqqfoMtE3Y55FSmkhhQ
	Arq1Hg0dc1a7qeXb/UTIVdyPTCkbBO+a0Zywh1k=
X-Google-Smtp-Source: ABdhPJyHzf5pLWlWedCr7aTKVfPFnb/hWZ5e7AA7syMYGDrCO2/YVX+6c9IVDG8SJGat5AWfIjIaA25sjl2rkTOVnV4=
X-Received: by 2002:a05:6102:3912:b0:320:6bb3:f1fe with SMTP id
 e18-20020a056102391200b003206bb3f1femr2827115vsu.4.1646388595625; Fri, 04 Mar
 2022 02:09:55 -0800 (PST)
MIME-Version: 1.0
References: <20220301104349.3040422-1-daniel@0x0f.com>
In-Reply-To: <20220301104349.3040422-1-daniel@0x0f.com>
From: Romain Perier <romain.perier@gmail.com>
Date: Fri, 4 Mar 2022 11:09:44 +0100
Message-ID: <CABgxDo+32A+akgbcD5Y+oGGJwZ_2G+dqfNTAdHYSD3xVPUnoTQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: mstar: Select HAVE_ARM_ARCH_TIMER
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Interesting, when I wrote the patch for msc313e-timer, I always had
ARCH_ARM_TIMER implicitly built, so I thought that it was implicitly
selected by MULTI_V7...
I agree that we should at least have ARM_ARCH_TIMER enabled, otherwise
we won't being able to boot correctly (no clockevents)

I have also noticed that we missed this commit
https://github.com/linux-chenxing/linux/commit/4cf42fcb4618cd77d80f767d5524=
c32fb40a91c6
 (that selects MSC313E_TIMER), which might explain your initial issue
(not being to boot).

MSC313E_TIMER being optional on ARM (because of ARM_ARCH_TIMER), we
should be sure that arm_timer is enabled and we can keep the mstar
timer optional, imho.

What do you think ?

Romain

Le mar. 1 mars 2022 =C3=A0 11:44, Daniel Palmer <daniel@0x0f.com> a =C3=A9c=
rit :
>
> The mstar SoCs have an arch timer but HAVE_ARM_ARCH_TIMER wasn't
> selected. If MSC313E_TIMER isn't selected then the kernel gets
> stuck at boot because there are no timers available.
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>
> I moved one of my CI builds from a 5.16 based tree to a 5.17
> based one and it stopped booting. At some point I had broken my DTB
> so the MStar timer wasn't getting probed anymore and at
> the same time the arch timer driver wasn't getting built in.
> I'm not entirely sure why the arch timer driver was built
> before but isn't now. Anyhow, all of the other ARMv7 machines
> seem to do this so I guess it's right.
>
> Arnd/Olof, please apply directly if acceptable. Maybe this should
> be in 5.17 as a fix?
>
>  arch/arm/mach-mstar/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-mstar/Kconfig b/arch/arm/mach-mstar/Kconfig
> index cd300eeedc20..0bf4d312bcfd 100644
> --- a/arch/arm/mach-mstar/Kconfig
> +++ b/arch/arm/mach-mstar/Kconfig
> @@ -3,6 +3,7 @@ menuconfig ARCH_MSTARV7
>         depends on ARCH_MULTI_V7
>         select ARM_GIC
>         select ARM_HEAVY_MB
> +       select HAVE_ARM_ARCH_TIMER
>         select MST_IRQ
>         select MSTAR_MSC313_MPLL
>         help
> --
> 2.35.1
>
