Return-Path: <SRS0=GKdq=SB=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CA2C433EF
	for <soc@archiver.kernel.org>; Mon, 17 Jan 2022 20:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8965C36AF3; Mon, 17 Jan 2022 20:41:24 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A04D4C36AE7
	for <soc@kernel.org>; Mon, 17 Jan 2022 20:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A04D4C36AE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pj1-f45.google.com with SMTP id l21-20020a17090b079500b001b49df5c4dfso230551pjz.2
        for <soc@kernel.org>; Mon, 17 Jan 2022 12:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DaEW+T1OlYjEvgl1v+fiAGbi9cgefd6M15EmTSYK7p8=;
        b=qL+9oymID13l5leI9oL2NXeoWZDZS0FnLGl7BaAsfC/9si8ozIDAt8ZIV7tc5iA1o2
         Br2Qr3OkBwB+nNW4I4tX432o/2CvCNlJydzyByC1DG5NlyTyDPYf+cg9VcYsDwUocI4O
         JBsIy0WWuiwggkFd88mJ94QQSrxUEc9kfkVaZzYCt2/9bcN54FX4s24tbsCp6Gx+7ID+
         +1HVrrdvbuBG9PdlQNiOcrdvwH6Ir+aW51KKprc9yP1DTcvoLL3xPYbtxQzVDiu/F6Mq
         6s+yGQFUqij7Q12adcg76wW6B3GFphK/zzKD3LtUfOuoa5JfjIiaVSB8p46MFjNS9e4t
         8DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DaEW+T1OlYjEvgl1v+fiAGbi9cgefd6M15EmTSYK7p8=;
        b=dLeJURKRYAQxNRmfrQ8y8KWmnkfuW3+VqcMXjhWWj5wLKDDns2LIhcB+f/ilyobDzB
         JpkxJefgFyAyP0xJNf0hq0k1j6murdZXvH8Kc5k36/ZGpoi7YcEKZ/sGCpLYr75glAN9
         VqT44izbgX/rRMyDWjxSCWjZ/jDfpOHGc/GQR6YYi/Yi4qxXGbBaOLU9bMDYZKLPUIYk
         v/s47VZh2Pu6xvSY+9CITDoJxnOu7gqfNENvIGEkUFllc89upF4XoBQMg25DVMymLRgd
         FSi1XgHIehhpc733GXCaQHpJ+ew+ME706kjm6NdDbPzRLJZrz1UKTNH3tCs1BtJvOa0Z
         hNwA==
X-Gm-Message-State: AOAM530218XyFyry+59A8b5px+bYVGTlSaOacDQ7a0uV2MLAHxnUGjAV
	Hz8PwADZ2LI9kNRZoTM0i20nV5qUikuMnXgvCBMBug==
X-Google-Smtp-Source: ABdhPJwE7UeFIDS9E9xTFIUTi44uAthZAhCX33RElPAXvziM5JWtThj7gcSv/uSFe6j4ZU6h4munX3s1YH0wzzKyUfk=
X-Received: by 2002:a17:902:e54f:b0:14a:1bbf:9cf0 with SMTP id
 n15-20020a170902e54f00b0014a1bbf9cf0mr24490160plf.158.1642452082991; Mon, 17
 Jan 2022 12:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122408epcas5p45053d1bf0acf2d8233a98b6c1abab6eb@epcas5p4.samsung.com>
 <20220113121143.22280-14-alim.akhtar@samsung.com> <53c17ddc-a049-72ed-7237-de23db7889da@canonical.com>
 <085801d80967$e4b8fe00$ae2afa00$@samsung.com> <5ab62673-8d46-ec1d-1c80-696421ab69ca@canonical.com>
 <00c901d80ba5$c9ae6ab0$5d0b4010$@samsung.com> <CAK8P3a31bCHNcNWrLX+QW+4RuK=DBpxLA_j5BFKxXxXKCT8PFQ@mail.gmail.com>
 <9b98fd89-87b5-5026-fb0c-16bb956801ea@canonical.com>
In-Reply-To: <9b98fd89-87b5-5026-fb0c-16bb956801ea@canonical.com>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 17 Jan 2022 12:41:11 -0800
Message-ID: <CAOesGMi8EBFGGj7sQsPZfDh=AhpPCBYFazb9yRYdEVX=MO7tog@mail.gmail.com>
Subject: Re: [PATCH 13/23] dt-bindings: arm: add Tesla FSD ARM SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, 
	linux-fsd@tesla.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 17, 2022 at 7:00 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 17/01/2022 15:14, Arnd Bergmann wrote:
> > On Mon, Jan 17, 2022 at 2:26 PM Alim Akhtar <alim.akhtar@samsung.com> wrote:
> >>
> >>> I cannot judge how different this is from Exynos subarchitecture - looking at
> >>> patches it is not different - so I could understand a FSD sub-arch with only one
> >>> SoC.
> >>>
> >> I understand, it is a bit difficult to visualize it with the current patch set.
> >> As discuss on the other thread, FSD is different, more over the vendor is different, internal design is different.
> >
> > Is it based on another SoC design then? Most new SoCs are derived from
> > some other
> > one, so it makes sense to put it into the same family. E.g. the Apple
> > M1 takes bits from
> > both Exynos and PA-Semi SoCs but has more newly added components than
> > either one.

I think it's a misnomer to call SoCs like these "based on each other".
What often happens is that a manufacturer reuses IPs between designs
since they're there, they're available and they work and there's
little reason to redo it, etc.

For cases such as a vendor building a custom SoC for a specific
customer (which, from the looks of this patchset seems to be the case
-- this is not something I say with insider information :-), it makes
sense to reuse IP blocks in the same way. It's actually a competitive
benefit of the vendor to have silicon-proven IPs in this manner.

Does this mean that this custom-built product is a part of a product
family? I don't think that's the primary conclusion I would make --
it's more complex than that. And it also doesn't make all that much of
a difference whether it's considered a family member or not. I would
be very surprised if this SoC had a Samsung marketing name, since to
my knowledge it's not sold to any other customer.

If all we're arguing here about is a toplevel compatible and a Kconfig
variable, then I don't see a need to spend a whole lot of time on this
-- as long as it's not a change that ends up proliferating the whole
source tree. I.e. if you want to create a new sub-arch, make sure it
selects or depends on EXYNOS so you don't need to sprinkle a lot of
"EXYNOS" -> "EXYNOS || TESLA" edits in the tree (as per below in the
email).

Same with the DT bindings. Can you just augment to make the tesla
vendor prefix an allowed one for the exynos bindings where it makes
sense?  Toplevel board (and SoC) compats can of course still be
independent.

> It seems Apple M1 shares only few bits with SoC. I am aware of only UART
> driver as directly re-usable.
>
> >
> > I would argue that if this SoC shares the pinctrl, clock, spi, adc,
> > and timer implementation
>
> Plus: UART, watchdog, PWM, I2C, I2S, USB PHY, DWC3 USB (in Exynos
> flavor), UFS (also in Exynos-looking flavor), MFC (video codec), some
> similarities in DW PCIe, TMU (thermal). Looking at DTS there are
> differences but just few comparing to most of shared blocks.
>
> Additionally SoC BSP (and maybe SoC itself...) was actually developed or
> co-developed by Samsung, judging by copyrights in the BSP code. Even the
> original DTSI has:
>
>         TURBO TRAV SoC device tree source
>         Copyright (c) 2017 Samsung Electronics Co., Ltd.
>
>
> Tesla could still customize it a lot, but it is a strong hint that most
> of it came from Samsung LSI and shares with existing Samsung designs.
>
> Have in mind that recent Exynos chips are significantly different than
> early ARMv7 or ARMv8 designs and we still consider them part of Exynos
> family.
>
> > with Exynos, we should consider it part of the Exynos family,
> > regardless of what other
> > blocks may exist next to those.
>
> Yes. I don't see the benefit of keeping it outside of Exynos. It will
> sprinkle "depends on ARCH_EXYNOS || ARCH_FSD" all over (or depend on
> Exynos like you suggested).

Depend or select (but select is a slippery slope so might be better
avoided) seems like a pretty good option here to me.


-Olof
