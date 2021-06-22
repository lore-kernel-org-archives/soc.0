Return-Path: <SRS0=9du6=LQ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4606C2B9F4
	for <soc@archiver.kernel.org>; Tue, 22 Jun 2021 07:42:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B20DC611BF; Tue, 22 Jun 2021 07:42:30 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA04E6113D
	for <soc@kernel.org>; Tue, 22 Jun 2021 07:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA04E6113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mzhf5-1l02ab1QpN-00vguw for <soc@kernel.org>; Tue, 22 Jun 2021 09:42:28
 +0200
Received: by mail-wr1-f46.google.com with SMTP id j2so11876761wrs.12
        for <soc@kernel.org>; Tue, 22 Jun 2021 00:42:28 -0700 (PDT)
X-Gm-Message-State: AOAM5313d1NzMV6M3I2E6r2ccOD7xj7Jh+pF4SI8JCTm6CKInTGew/cB
	VlH3RaQJ1EQsTAE5jbIryMMZgTeRNgaoTjIOJEg=
X-Google-Smtp-Source: ABdhPJyKvKuJF/dWQppGTkZZQVXvZbZUieWdyo+mrwK6HDTCF2UYRTAfX4ZpVRLzPLA/AqN/ajXhtSjb0V7cwDLBIBA=
X-Received: by 2002:adf:f80a:: with SMTP id s10mr3001421wrp.165.1624347747989;
 Tue, 22 Jun 2021 00:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210621202131.127802-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210621202131.127802-1-u.kleine-koenig@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 22 Jun 2021 09:40:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Xx9JCpqQN+jBkz872jMy4i1zvROESnVYEpUgD2BxQKA@mail.gmail.com>
Message-ID: <CAK8P3a1Xx9JCpqQN+jBkz872jMy4i1zvROESnVYEpUgD2BxQKA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Drop ARM/VT8500 entry
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Alexey Charkov <alchark@gmail.com>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EltGjiz9wOypkEz4vxRMUb8CQcRtix11gQirkmS1nk/oE1bsDWv
 GU5R0O/1lH5P0zLwKvK+KNPMdtMbc6qY3at9bySGyLo24lCzuw5uTEF1jYnT546LQlWaxuf
 p23HY4PLKhNPhEMfCV0oCqJTw/JNKDid+fLDem46oIA9rksJpd7ag6/y4nxVWIrZa4Ebnhm
 N91bSNhMmDlJ30/NhFu4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q1hzClkKmqs=:SIMbbwX7cuH2BaDWQqeb4z
 twGXEW4kb4wUL1raxD5E3W2LpGHBs23+Z3MjZTdppkertI0K5MVXjj83QFwweSLfFspLuh2ne
 5xb4+zk9SBrsUzCDf/qHzsZ9LQIxhLmASejTtAiDlGiUCf2haofcCwUtZAK7aI2LdzuFexcsK
 /RMj6azL6fymH4FL6WNfctF1b1hyUDyDPeolQV3SGcBkbouw86W3XVoegC+UeE/zyGNpX9vhM
 m6xtUydyGK0Z6Gq2ApAfbvKqbM0QCOKr5wdBh/LoJo1UylJsTYviKS/yp/ytv216seBZll2XC
 Ycf2NGNJeKb4jVPMvLuytKIpUsStAR/bG64XBbxJifAIOAS5soEttYXWUnGhdTyAaDel/8nfc
 peFvPNzyR8BWkxQtZixUsUXfGTgp6gT5khI5nK/q1HmdiCyqGsc7v3RvEb2zfhDOFQ2cYyZ34
 cySGEuUcNGmWSQwEasMeaxf9YHpbkBKNdV8mFgZtMhmurkQpnAGq1xfaVZ6r8JyXrRAFI9Jgd
 At9AkyxvYtdFSBFfMuiT5w=

On Mon, Jun 21, 2021 at 10:21 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Tony's email addresses bounces since at least January 2021 and Alexey
> Charkov claims already then he was MIA for quite a while. So drop the
> entry.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd7aff0c120f..b59308a7646c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2726,24 +2726,6 @@ S:       Maintained
>  F:     arch/arm/mach-pxa/include/mach/vpac270.h
>  F:     arch/arm/mach-pxa/vpac270.c
>
> -ARM/VT8500 ARM ARCHITECTURE
> -M:     Tony Prisk <linux@prisktech.co.nz>
> -L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
> -S:     Maintained
> -F:     Documentation/devicetree/bindings/i2c/i2c-wmt.txt
> -F:     arch/arm/mach-vt8500/
> -F:     drivers/clocksource/timer-vt8500.c
> -F:     drivers/i2c/busses/i2c-wmt.c
> -F:     drivers/mmc/host/wmt-sdmmc.c
> -F:     drivers/pwm/pwm-vt8500.c
> -F:     drivers/rtc/rtc-vt8500.c
> -F:     drivers/tty/serial/vt8500_serial.c
> -F:     drivers/usb/host/ehci-platform.c
> -F:     drivers/usb/host/uhci-platform.c
> -F:     drivers/video/fbdev/vt8500lcdfb.*
> -F:     drivers/video/fbdev/wm8505fb*
> -F:     drivers/video/fbdev/wmt_ge_rops.*
> -

I would prefer to leave the entry in place and just remove Tony's name here=
,
either adding Alexey with "S: Odd Fixes" (or even more if he wants), or
leaving it as orphaned. That way we can double-check against the file list
when we eventually remove the platform completely.

       Arnd
