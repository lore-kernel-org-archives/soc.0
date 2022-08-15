Return-Path: <SRS0=FC7w=YT=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E7BC25B08
	for <soc@archiver.kernel.org>; Mon, 15 Aug 2022 19:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91165C433D6; Mon, 15 Aug 2022 19:53:09 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B97B0C433D7;
	Mon, 15 Aug 2022 19:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B97B0C433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ej1-f44.google.com ([209.85.218.44]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MVe9i-1nyPWH2hNs-00RYxo; Mon, 15 Aug 2022 21:53:05 +0200
Received: by mail-ej1-f44.google.com with SMTP id uj29so15325042ejc.0;
        Mon, 15 Aug 2022 12:53:05 -0700 (PDT)
X-Gm-Message-State: ACgBeo1Dkb/mjjsfaXumF3buGP3InOJD8izyvQ7NeqMl/PX2BY2J6/Ct
	Zx7hX2GlkFmqtchlADaC7bQ3NHeYQVRbwQ3IvC8=
X-Google-Smtp-Source: AA6agR6WukBGcfTJVUl5CIbKuxExURcZy41XrLH6cR4WZu9dKLWxqz0LIbjhFDRnvnzwIquLGWfm92gIJBXogAGXdQo=
X-Received: by 2002:a17:907:7609:b0:730:d70a:1efc with SMTP id
 jx9-20020a170907760900b00730d70a1efcmr11372637ejc.766.1660593185195; Mon, 15
 Aug 2022 12:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220712164235.40293-1-f.fainelli@gmail.com> <CAK8P3a2QrYbWOqV+CG-W0ZkzW6ORgw8R6Dv-L3o2ZAtJs-B3Kw@mail.gmail.com>
 <0131e1d6-09c0-31a4-5b9d-0e2fc49d61ac@linaro.org> <CAMuHMdWDDY_72y3WYt401hG122xg1s7_VRCG9Vyhhkzco-nBYw@mail.gmail.com>
 <fb4f4444-20c2-0e35-bb83-79a419ec87a7@gmail.com> <f4adf05b-d3da-a692-3bd8-0b4d705e0dc2@gmail.com>
In-Reply-To: <f4adf05b-d3da-a692-3bd8-0b4d705e0dc2@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Aug 2022 21:52:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0R7tL0+saXK-+pHUfT=ZsmOVr6LEecn40e+OSUtZAWLw@mail.gmail.com>
Message-ID: <CAK8P3a0R7tL0+saXK-+pHUfT=ZsmOVr6LEecn40e+OSUtZAWLw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig.platforms: Re-organized Broadcom menu
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, william.zhang@broadcom.com, 
	anand.gore@broadcom.com, Olof Johansson <olof@lixom.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Li Yang <leoyang.li@nxp.com>, Wei Xu <xuwei5@hisilicon.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Matthias Brugger <mbrugger@suse.com>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:3uxON0mTeBF9riaBpXKNSLDnBUcyytwuIzaA183yqv0jDy+/NEK
 u+WLs/omhbAOGX+QKxNX4xwa2u0w/riV1JHTWXoHJDPr1BwzC15LF0fxf3bCDlzrkqYquwI
 i/aes8DXwJTo76zyfbXiW5za/9xHDXlbdvZdZBMRN5qTxNpCTOXfvcmGy9licaehqQEm2ei
 yMs6E7hfBrIWn3Pokgwrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7xmLf4rmLlM=:+ahsepuXESmTOA/WxGTHXy
 eTETx4tArxl1OG4EQUd01emSj54LweNLODx/2C1xTJSR/8emypigKcGO4m8mU1OjHV+EpM3Wd
 KuBkl3iHJr/aZHS6Kfc1H3c1sQvhYzfQS//6zgcccr311abisC9E2//Y2SEu+cbLNbIYOwBFT
 xV79ri3hNF8yXf3k1EESAjUdUjBaXsmEf198Te2ngizmI+A0z+voZ8mT+XV8GSV1GhnX/sYGG
 gaapVLA6oL3wV2xQHGI+E7rEQuxFueIeVrWqnCtm7tfmoVoCEFFS68RE1ClNs5O3nbpGOzcG0
 QYtXleysp32K1NUzKPuAFJEd8MjAnk/TjKoKCgVMMKhmajC2mgNw0zpRUCASssTtrsHeMuh1C
 5pbodo9ptcrqJ4taNDD4xenAIYnp/iEDhCEj6m9IAmsuoU1N9UcWqacDEoT9Qiwa8cnvnSE8m
 UiTuDvxHs6EBFhS4WXNJi5ApKWqUogJ8OUzU6CeNN7sh+eWPWZ7nk1yqpmUYlQ4FHmYClMSnX
 jXv0sn+r5UH2BHYtbS9kh6Z/W4E6calI8gtwXfOcEJokRyb+Rdz4W5MPHkB/mOFMDsQTS8WVs
 vk5J4Gc37hkRRxbssyKAcpNIm0vy26mcpPySlHGVXRabLf0QqGFQ5s21+RtLw8RuQpCYFCatJ
 UARJqaXhd3LAqGAlEWuw0xuIPxnJdlpCVJuuZyuJd7GBadCjhNGgTf1w8f+zKn7ljMf4krF2l
 QGJGWscal4quMK1t+0IXaimEO834CR6BSRaBXoHpfw4nevwJPj7pZDRwQq2BOlE/3yCwod6n8
 P3xeTRkCaMUE26u/rXLHsSmgFlBUYH3kZEeE1d7hlqbWEBq+JDC70tg2XgG8meLzO96GGVQMY
 SPytrk0RsSLSDfuZnbHA==

On Mon, Aug 15, 2022 at 7:15 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 7/13/22 15:05, Florian Fainelli wrote:
> > On 7/13/22 02:17, Geert Uytterhoeven wrote:
> >
> > The itch that I wanted to calm was that ARCH_BRCMSTB was after the other
> > Broadcom platforms separated by ARCH_BERLIN. if you prefer a pair of
> > KConfig comments to delineate them and flatten the platform selection,
> > that works for me, too.
>
> There are 2 Marvell-based platforms (Berlin and mvebu) as well as two
> NXP-based platforms (MXC and S32), would it be better to also group them
> under an ARCH_MARVELL and ARCH_NXP menuconfig symbol the same way this
> patch does it for Broadcom-based SoCs?

Berlin is now Synaptics after Marvell sold them the business unit, so that one
should probably stay separate. For NXP, there is also Layerscape. I
agree it would
be nice to group the three NXP together.

        Arnd
