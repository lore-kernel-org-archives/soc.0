Return-Path: <SRS0=AL35=GT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBA6C4332F
	for <soc@archiver.kernel.org>; Mon,  6 Nov 2023 12:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A01DC433CA; Mon,  6 Nov 2023 12:46:24 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9759FC433B9
	for <soc@kernel.org>; Mon,  6 Nov 2023 12:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9759FC433B9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-da41e70e334so3745265276.3
        for <soc@kernel.org>; Mon, 06 Nov 2023 04:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699274780; x=1699879580; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HWAObhP5Y4Ruw2zeVW2EcRdOCA3o8d+11pOULKBklzI=;
        b=tJfSB0sITU/a1m3dzGev+pYUTKwbLo9hsIOyfnZ1gbLtpIabdph2MPF8aOuytiGqMO
         PR4TaRctoJAffZQfZEgQAOqqVulDdMj42KIhm5X5lT7K8lOZgW2FL8hTLWSBDM4CwM+Z
         C7H1g964VIZyaKAMq9bNFtCFNaB4WjjiWT7CQhf0Z2OkVADu8QUsu/Z19llLToU58hXZ
         fmUg0zBifRMfgGmIkhtDbob3SZcSt0oFAdw7CD3t9JBI+q08yQlvkEGi8m7PTLBEKNbO
         exFLlCTf1fxso2gA9a/X9bQ/7o4LIEwBqRdk08tON8itWtzek+yq6iG7e3t170nw4/04
         cMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699274780; x=1699879580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWAObhP5Y4Ruw2zeVW2EcRdOCA3o8d+11pOULKBklzI=;
        b=TIjhTqZIW5LLahUaa0QRVliV+/UFR+kC+cC9ZWnqbMn0Cwca3kDmbRx3khnLmyblcT
         p/fiusx1qW8KC98KuZajKwP2Iap72wJbPOK6DHGF8OzeY0uaxHmNDI1r1kt+UIzc6jgD
         0NrWCN/QlSz2kBZdsklvFOsm8PY+iUDqY+HPw5h52BPdQpD7KCM+1fcto0lex6rjpdP6
         +OISbtBqFcjWCtjXRd0TCn5zMSq4/DT0Ab+bmXXKRX5taIs2bi6P7CScOYbfzaN1ToxA
         72WcA04SxAkdchyrcg+nh4zHljKPxLpljB37xDuji+T7Yb97DO/85AWcxK1h0KMiERL/
         +6wQ==
X-Gm-Message-State: AOJu0YzHqqiA2z37PfVk9bPJQgvR/PleWqPo7JczNpsp5X+HrrSAP3vh
	iAwhN/nrgj1viTysvj5PslYa7n/8sKwMmHYPl6rpYuU3a05GxWug
X-Google-Smtp-Source: AGHT+IH0bQGrPvMEjqnPy2jbrB9q4MxjXaupGC2/8uUWT1XpgjHaJ8J2tt+u28M2q1iqEh+RdBAv9noS6tYeUvUMiq0=
X-Received: by 2002:a25:aaae:0:b0:d9a:5666:7ab5 with SMTP id
 t43-20020a25aaae000000b00d9a56667ab5mr30049732ybi.10.1699274780413; Mon, 06
 Nov 2023 04:46:20 -0800 (PST)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua> <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
 <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
In-Reply-To: <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 6 Nov 2023 12:46:08 +0000
Message-ID: <CADrjBPqB5MOQeMV6uSJHLVyMJYWm7Nm_1XGSq331gPRfO1jkzg@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
To: Maksym Holovach <maksym.holovach.an.2022@lpnu.ua>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"

Hi Maksym,

On Fri, 3 Nov 2023 at 13:56, Maksym Holovach
<maksym.holovach.an.2022@lpnu.ua> wrote:
>
> Hi Peter,
>
> On 11/3/23 15:11, Peter Griffin wrote:
> > Hi Maksym,
> >
> > Thanks for your feedback.
> >
> > On Thu, 2 Nov 2023 at 22:32, Maksym Holovach
> > <maksym.holovach.an.2022@lpnu.ua> wrote:
> >> Hi, all
> >>
> >> I wanted to inquire about how do you all feel about calling this SoC by
> >> the Google "gs101" name.
> > Interesting question, I think calling it gs101 is the correct approach see
> > below for my rationale.
> >
> >> I believe the proper name for it should be the actual Samsung name,
> >> written in the silicon and reported in the Chip ID hardware: Exynos9845.
> >> This also touches the Tensor G2 (Exynos9855), Tensor G3 (Exynos9865),
> >> and possibly the "Tesla" SoCs.

Also Exynos850 as I pointed out previously. I think that is the wrong approach
and very confusing. This SoC is not commonly known by anyone as
Exynos9845.

The same as the Exynos850 isn't known by anyone apart from Samsung folks
as Exynos 3830, and the tesla fsd SoC isn't known by whatever internal Samsung
name that presumably had.

Maybe Alim can comment what tesla fsd SoC has in the product id register.

> >>
> >> I do not think the Linux kernel should be a marketing material: it
> >> should reflect reality. The chip is almost 100% composed of Samsung
> >> Exynos IP blocks and should be called that way.

Where does this 'almost 100%' number come from? Are you measuring the die
area here or something else?

> > As you alluded to Tesla fsd and Axis artpec8 SoCs are also based on
> > Exynos designs and support upstream uses the axis,artpec8* or tesla,fsd*
> > compatibles.
> >
> > So using google,gs101 is consistent with the existing upstream naming
> > scheme, for customized ASICs that were based off a Exynos design. But
> > it also reflects the reality that this SoC is not a Exynos9845 as there is
> > also a lot of Google owned and other third party IP integrated that is not
> > found in Exynos9845.
>
> A quick question: Do you imply Exynos9845 exists outside of the context
> of Tensor G1? I used to believe Exynos9845 **is** Tensor G1.

You are correct. William clarified that point for us. Thanks William!

>
> Also, what kind of Google IP are you talking about? I believe only the
> neural accelerator should be custom-ish.

This should not be considered an exhaustive list, but whilst looking in the
downstream public drivers at least the following Google IPs in the SoC

TPU/ML accelerator
Bigocean av1 video accelerator
Emerald hill compression engine
Camera ISP blocks
(AoC) Always on Compute

Plus of course Arm IPs (CPU+GPU), Synopsis IPs (USB, PCI. phys) etc.

The Exynos based IPs tend to be for things like pinmux, clocks, i2c, spi,
uart, mfc, display controller, timer etc.

>
> Additionally, I believe it having or not having Google IP is irrelevant:
> for example, the new Raspberry Pi 5 Broadcom SoC has a lot of
> Raspberry's own IP, but it's still called Broadcom as it's the real
> manufacturer and designer of the chip.

I think RPi / Broadcom is a very different situation to this. The original SoC
in RPi 1 was wholly designed by Broadcom, and marketed as a Broadcom
SoC [1].

Further iterations of the SoC until now have also not had RPi IP integrated.
RPi themselves refer to them as "Broadcom SoCs" on their webpage [2],
so it is completely expected that they live in a broadcom directory.

BCM2717 has integrated the RPi ISP, but to all intents and purposes this is a
Broadcom owned and designed SoC, albeit only now sold to one customer.

[1] https://web.archive.org/web/20120215080023/https://www.broadcom.com/products/BCM2835
[2] https://www.raspberrypi.com/documentation/computers/processors.html

> >
> > I guess the same is also true for `axis,artpec8` and `tesla,fsd` SoCs.
> > IMO the SoC compatible string should be uniquely identifying the actual
> > SoC, not a close relative.
> >
> > Regarding product_id you are correct this reads 0x09845000 but even
> > within Samsung Exynos family there are examples where the register
> > value does not match the SoC compatible. For example Exynos850 SoC
> > has a product ID value of "E3830". Where the Linux compatible is
> > matching the Samsung marketing name, not the internal/outdated name.
>
> I did not know Exynos 850 is also not going under it's real name.

It is going by its real name :) just not by its internal name that nobody has
heard of.

> Ultimately, I believe all of those SoCs should go under their technical
> name in the exynos/ directory.
>
> Another concern is that Google could in the future license other SoC: be
> it Qualcomm, Nvidia or anything. If we put completely different hw under
> google/ directory, does it really make sense? In that case, who'll
> maintain the google/ directory? Exynos people? Qualcomm people if they
> license it? Some other people?

I expect Google, or Google sponsored devs (as is the case for Linaro) to be
helping maintain the Google SoCs upstream. See the MAINTAINERS entry
for this series of who I expect to maintain this google directory.

>
> Then, I don't think Tensor G3 has a proper "GS" name, it goes by "Zuma"
> in decompiled kernel modules as far as I see.

That is correct, it is named Zuma downstream and they did away with the
gs101, gs201 type naming scheme.

>
> Finally, Tesla people already tried to submit drivers called by Tesla
> name, but which basically copied the functionality of the Exynos
> drivers. We would want to avoid that, ideally.

As you can see from this series we are not proposing that. Any IPs that
use Exynos IP we are using the existing upstream driver and enhance
it where we have features that aren't present upstream.

>
> My opinion is that all the Tesla and Google SoCs should be in the
> exynos/ directory, not only because they are basically Samsung Exynos,
> but also because they don't really need a separate directory: neither
> Google nor Tesla didn't neither manufacture or design those SoCs from
> scratch.

Who manufactures it seems irrelevant. Qcom and Broadcom don't
manufacture their SoCs either, but they still live in qcom and broadcom
directories upstream. Whether they designed the SoC from scratch or not
is also IMO largely irrelevant. In many cases the upstream community
has no way to determine whether things were outsourced or not anyway.
Did Apple outsource things in their silicon design? Who knows, and why
do we care? It's an apple branded chip in an apple branded product
let's call the directory apple.

Interestingly apple uses the same uart driver as Tensor, when I check back
through the commits in the driver.

fcbba344907afe26da487f1ed0b0e285c06a547b

tty: serial: samsung_tty: Add support for Apple UARTs

Apple SoCs are a distant descendant of Samsung designs and use yet
 another variant of their UART style, with different interrupt handling.


> The only reason I can think of for them to have it in a
> separate directory is maybe because Google and Tesla actually paid
> Samsung money for the right to call Exynos "Google designed" SoCs, but I
> believe the kernel should be left out of that.

Also the fact that they contain IPs not found in Samsung designed devices,
aren't known to most people as Exynos, and the maintenance issues of
having all the Google, Tesla, Axis, Exynos based SoCs in the same directory
(and who knows how many other ASIC customers in the future).

Ultimately it is Krzysztof's decision I think. I followed what he had previously
accepted for other SoCs for consistency and also because it seemed like the
correct approach to help scale up and ease the maintenance burden. If I look
at the number of tensor based SoCs, phones per SoC and board variants per
phone model, then you end up having a lot of files in the exynos directory over
time.

regards,

Peter
