Return-Path: <SRS0=KkGf=WG=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCB1C433F5
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 12:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26FBBC34119; Mon, 30 May 2022 12:24:39 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27A53C385B8;
	Mon, 30 May 2022 12:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27A53C385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id z43so8803513ede.1;
        Mon, 30 May 2022 05:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gf3IvEnikRvp3Oa8O4SMunFc6fuhRnS1KPonMS+jQ+I=;
        b=NyQ+kCGK3kg3v6Adv/XUYZAJCjEWhflsEmpIwgkeTZw0Ni7YgQNimIJ2MWBNV1J314
         nFrO3LoILzRYfe9Uxh7YsjXWZd2OPNcp8ToAqOOe0jCLJgXnz/o5vCjc42nMfojO7kCj
         QAgjC16cVioo2a0vkXIolNnbvAvJQXhm23uI9P611ez5yYfOfS+13Mj3Ko5Y3eSd8nqu
         04KBpo7UkSbNUsWgDO4pPc/PjbB3R5O+rJ4J80+Wq+oPF1Ds2ccn9Jw9JfMx9b+VGSBj
         RdU8wZe8Yc+5yxCCchki9DZpn+1NmjBczSEkDXrqxz61zhVt9K2emiU88ADzGKrJNWRU
         bnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gf3IvEnikRvp3Oa8O4SMunFc6fuhRnS1KPonMS+jQ+I=;
        b=ERxH7Ii4ZJKYg2bydJH4tWPdYmR5VcgfvBFs4qBWIHWBWPIuTnBBqZyh3U0/u4E1ew
         knJeDtIf/Ch99lqb4tMFSUTFCQSFAOG9PXZ3wr6MbD+TARC4bh2lnxx5TYvlex9Aeoyt
         smI0jQBdHYEQYjy3QVRgkoXPQpDtCnc8k5OktjYlXs4hRLF9nL+VZ6ZhC2pb0OIwmBbt
         L/dwFhThGxGczcUG09ZuLtFMFyjvpWvRrZz3Enx+uG4toZPWrCfpZDv7iFYgakkV4KSj
         XJxMVUm/b6jXgq4r1CSOZQbmLr1RccDlBRS7JNTfL1y01qMuOKlMMrxkxPhzS/2DnOQd
         +Kzg==
X-Gm-Message-State: AOAM531skVOtI/wdhg0oEzWjFXrqpXKEVkjGNBrWhusVls/+tFOlyu23
	KE5nAQq8iuVwJzbX/GL7cUck+d5uFR3m8oYyukk=
X-Google-Smtp-Source: ABdhPJyByk+8pCmJj05rtEymQhMckw/8QiNYSuteRwbfSGq4YiABghOAxycfRHnt7uQgycGiWNHw22Dc1Nbyr02Cx7o=
X-Received: by 2002:a05:6402:2382:b0:42b:7fec:1abf with SMTP id
 j2-20020a056402238200b0042b7fec1abfmr33516209eda.111.1653913476233; Mon, 30
 May 2022 05:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <CAK8P3a2CUy17vbd5Go523894vcF_oLz=dAR7JNLsUuR1Gsc9sA@mail.gmail.com>
In-Reply-To: <CAK8P3a2CUy17vbd5Go523894vcF_oLz=dAR7JNLsUuR1Gsc9sA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 May 2022 14:24:00 +0200
Message-ID: <CAHp75Vc3i6bWOo_ZHD25rtn0o1pjzHtdfRQg4RkAfrmMs77eOw@mail.gmail.com>
Subject: Re: [PATCH v1 00/19] Introduce Nuvoton Arbel NPCM8XX BMC SoC
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, gregkh <gregkh@linuxfoundation.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, Vinod Koul <vkoul@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Robert Hancock <robert.hancock@calian.com>, 
	"nathan=20Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>, Lubomir Rintel <lkundrak@v3.sk>, SoC Team <soc@kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 23, 2022 at 1:59 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sun, May 22, 2022 at 5:50 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > This patchset  adds initial support for the Nuvoton
> > Arbel NPCM8XX Board Management controller (BMC) SoC family.
> >
> > The Nuvoton Arbel NPCM8XX SoC is a fourth-generation BMC.
> > The NPCM8XX computing subsystem comprises a quadcore ARM
> > Cortex A35 ARM-V8 architecture.
> >
> > This patchset adds minimal architecture and drivers such as:
> > Clocksource, Clock, Reset, and WD.
> >
> > Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.
> >
> > This patchset was tested on the Arbel NPCM8XX evaluation board.
>
> Thanks for your submission. Please note a few things about the process here:
>
> - The merge window is currently open, which means a lo

Something wrong with the script?

> Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.
>
> This patchset was tested on the Arbel NPCM8XX evaluation board.
>
> Tomer Maimon (19):
>   dt-bindings: timer: npcm: Add npcm845 compatible string
>   clocksource: timer-npcm7xx: Add NPCM845 timer support
>   dt-bindings: serial: 8250: Add npcm845 compatible string
>   tty: serial: 8250: Add NPCM845 UART support
>   dt-bindings: watchdog: npcm: Add npcm845 compatible string
>   watchdog: npcm_wdt: Add NPCM845 watchdog support
>   dt-binding: clk: npcm845: Add binding for Nuvoton NPCM8XX Clock
>   clk: npcm8xx: add clock controller
>   dt-bindings: reset: add syscon property
>   reset: npcm: using syscon instead of device data
>   dt-bindings: reset: npcm: Add support for NPCM8XX
>   reset: npcm: Add NPCM8XX support
>   dt-bindings: arm: npcm: Add maintainer
>   dt-bindings: arm: npcm: Add nuvoton,npcm845 compatible string
>   dt-bindings: arm: npcm: Add nuvoton,npcm845 GCR compatible string
>   arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC
>   arm64: dts: nuvoton: Add initial NPCM8XX device tree
>   arm64: dts: nuvoton: Add initial NPCM845 EVB device tree
>   arm64: defconfig: Add Nuvoton NPCM family supportt of maintainers
>   won't be reviewing your patches at the moment. It may be better to wait
>   for the -rc1 to be out before sending out v2
>
> - don't send your patches to soc@kernel.org unless you want me to pick
>   them up into the soc tree and they have been reviewed already. The series
>   is clearly still under review at the moment, and I expect it to go through
>   a few revisions first.
>
> - gmail marked your emails as possible spam for me. I don't know what
>   happened here, but you may want to look into this to ensure that
>   everybody receives it.
>
> Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.
>
> This patchset was tested on the Arbel NPCM8XX evaluation board.
>
> Tomer Maimon (19):
>   dt-bindings: timer: npcm: Add npcm845 compatible string
>   clocksource: timer-npcm7xx: Add NPCM845 timer support
>   dt-bindings: serial: 8250: Add npcm845 compatible string
>   tty: serial: 8250: Add NPCM845 UART support
>   dt-bindings: watchdog: npcm: Add npcm845 compatible string
>   watchdog: npcm_wdt: Add NPCM845 watchdog support
>   dt-binding: clk: npcm845: Add binding for Nuvoton NPCM8XX Clock
>   clk: npcm8xx: add clock controller
>   dt-bindings: reset: add syscon property
>   reset: npcm: using syscon instead of device data
>   dt-bindings: reset: npcm: Add support for NPCM8XX
>   reset: npcm: Add NPCM8XX support
>   dt-bindings: arm: npcm: Add maintainer
>   dt-bindings: arm: npcm: Add nuvoton,npcm845 compatible string
>   dt-bindings: arm: npcm: Add nuvoton,npcm845 GCR compatible string
>   arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC
>   arm64: dts: nuvoton: Add initial NPCM8XX device tree
>   arm64: dts: nuvoton: Add initial NPCM845 EVB device tree
>   arm64: defconfig: Add Nuvoton NPCM family support
>
> - For an initial platform submission, I can merge the
>   clk/clocksource/serial/reset drivers along with the platform if they
>   have an Ack from the subsystem maintainers. I would normally
>   not include the watchdog patch in this as it's not essential, but
>   I suppose that it's fine if you only do a oneline change and it
>   has an Ack. If you have other nonessential drivers that need changes,
>   best submit them separately though.
>
>          Arnd



-- 
With Best Regards,
Andy Shevchenko
