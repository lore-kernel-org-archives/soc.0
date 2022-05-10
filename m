Return-Path: <SRS0=d6N2=VS=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60978C4332F
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 07:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2204CC385C9; Tue, 10 May 2022 07:08:27 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5B90C385A6;
	Tue, 10 May 2022 07:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5B90C385A6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f174.google.com ([209.85.219.174]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MV6Bs-1nOZLr2biw-00S9Q7; Tue, 10 May 2022 09:08:17 +0200
Received: by mail-yb1-f174.google.com with SMTP id e12so29031078ybc.11;
        Tue, 10 May 2022 00:08:16 -0700 (PDT)
X-Gm-Message-State: AOAM530Ijvp3KG8GrfDJIihw0/xkxo2SGNlvTDCY9+j5xjB06MKU05Gq
	T/V9KK08oBeVPYhAcbuQ0p6G8qVnJGgqrbD+1Io=
X-Google-Smtp-Source: ABdhPJxWna6rlyrTKaLzkGLXfLQ5G36EvqX7iK3snQCVCxZJEjl921KjovbWJOm/HvkmjLf51wP/GU+2IK3ZKdNeooU=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr16728943ybx.472.1652166495925; Tue, 10
 May 2022 00:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220510032558.10304-1-ychuang3@nuvoton.com>
In-Reply-To: <20220510032558.10304-1-ychuang3@nuvoton.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 May 2022 09:07:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1k8y8U99bBmqBYE1vYAc0q-UeaM0oLP4tTHZCpyYNOgA@mail.gmail.com>
Message-ID: <CAK8P3a1k8y8U99bBmqBYE1vYAc0q-UeaM0oLP4tTHZCpyYNOgA@mail.gmail.com>
Subject: Re: [PATCH V4 0/5] Add initial support for MA35D1 SoC
To: Jacky Huang <ychuang3@nuvoton.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, ychuang570808@gmail.com, 
	Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, SoC Team <soc@kernel.org>, 
	cfli0@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4Ce/E1tUlqVBkFNoPqoDgvLJzskG8FpTFkYaMd43K94/wrv4Red
 JmvmtB8lUOYcfMYCI/52MrD1MKiOrJ0pySBqC/22wbO/IHyhdk+j80GFCX7LXOJG99O13wq
 qCmcI+N/dF9+7ooNDKViTKWNkyOPTGPaH/ivDU+BFHZi6Vx1uPNsOM5/BaZiRjci3euupg2
 AvX8QgJb22ei199vMZN4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NiuSYRT/99U=:9IQS6LXSo7xzEE00HLNi07
 37+1DKYhA1Pq2uGC8ZBcJGILcuUvPvJlswHRF8VU5Mp8MVywHttoLL3UK39bPiaVFDv7vA1QT
 GUQF7RgdQK4+dFTsP5Iu6RkHdQvklynVpo1GpAqkUh7lVF5l36WKSBMmQUmI77uEC8bhg4ztl
 bjofyDBIp9y663VFnkQp+eeR4vG+h1vDDlZJxa6KPaJpwhShekrwsVco8CdVGbnkiEwefEEGx
 zJlm5uttpOSKf8ihxR3mZYyXvhMLdhlm+hEEg8y7sG64ORu6TeQuCaJ+qkf1gBn/Bzp4/cjfO
 Tu9Y/nik5wqkaor4gOlvp+yB8ELUFsyogP4fElKd0P6jpIklp15EPk0tOwYepwbmqBlZ5AVx/
 MMxFe/yKpk7kUZ581gInbYs2394oOf/VLKcJryZlnHj3DTZtFLv45nVyq1YDumOTWknd3qRiR
 ETC/bI4CXqx9yfSMB2b4b/Wd/uLAdkQ0cUZ+T+nHWPl1qp9YHHu2w6z9CPx1gPU/KBj/2LJbx
 CV8Z2KVMAB0GHMj1kX+KJRabDTQmr1w+6yKzpfDqT/CN6uwCaPKnTHg8f+5c/IkIxPmF2Uo8v
 w/zD3ckWcgi2ivxONs4jylHyYiSc9aipGtyH4xD+JcwIwsJGSOqyCScpESRG3q3oqH7SSedBA
 SXsec2C2aMg8dyWIeXkWwf8gmAHVHZnxWVH+xfuvEM5otuiSDzg9akOB6fxfQqym5TDa9IF5b
 OpwQEGVuS0mQwfFOPKg5AN3t7Wn3Rpbhvq0yCZXPsW28JaBz+7zujdpNRz4ojqxPvF12rDTk8
 tIANEjXyHr2NPnj0zXw1JQWGDHRGVARKtLdKbwaYtmtPDYoKAE=

On Tue, May 10, 2022 at 5:25 AM Jacky Huang <ychuang3@nuvoton.com> wrote:
>
> This patch series adds initial support for Nuvoton MA35D1 SoC,
> include initial dts and clock controller binding.
>

This looks fine in principle, but we are getting close to the merge window and
should finalize this quickly to make it into v5.19. I see that you don't have a
console device, as commented in the .dts patch. Normally I prefer merging
platforms only when there is at least rudimentary support for booting into
an initramfs with a serial console, but this is a flexible rule.

As with the changelog text for the .dts file, please explain in the [PATCH 0/5]
cover letter what the status is.

Regarding continued maintainership, we should discuss how you plan to
maintain this platform. In particular, there should be an entry in the
MAINTAINERS
file for the platform, either pointing to yourself, or adding it to the  NPCM or
WPCM450 entries if this chip is in the same family. Is this also a BMC
implementation, or is it something different?

       Arnd
