Return-Path: <SRS0=mund=II=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1727C433DB
	for <soc@archiver.kernel.org>; Wed, 10 Mar 2021 15:39:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A2EDA64FBD; Wed, 10 Mar 2021 15:39:59 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BD3664FA1;
	Wed, 10 Mar 2021 15:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BD3664FA1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-ot1-f43.google.com ([209.85.210.43]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MQ6C0-1l6lNk2j2m-00M2nk; Wed, 10 Mar 2021 16:39:56 +0100
Received: by mail-ot1-f43.google.com with SMTP id x28so2015398otr.6;
        Wed, 10 Mar 2021 07:39:55 -0800 (PST)
X-Gm-Message-State: AOAM5335OrNR1Txfz8eJ5EYjMoNz3h/NTd+bkZ/sRcSf7/udCTnGJNBt
	KcYb3P1slms6Uu+abGmEkE8cFCrdtGutaflyeug=
X-Google-Smtp-Source: ABdhPJyz+OU7gvgIrSIrSop4e8azU44xAIwSKa5HpTc5C9P44C7QC3z/u5GcCJR7jvFrP3vF9cowRntGlUhuRjPALp4=
X-Received: by 2002:a05:6830:14c1:: with SMTP id t1mr2985547otq.305.1615390794792;
 Wed, 10 Mar 2021 07:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell> <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
 <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
In-Reply-To: <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Mar 2021 16:39:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
Message-ID: <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
Subject: Re: [RFC v2 3/5] arm64: socfpga: rename ARCH_STRATIX10 to ARCH_SOCFPGA64
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Moritz Fischer <mdf@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-edac@vger.kernel.org, 
	linux-fpga@vger.kernel.org, Networking <netdev@vger.kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vkKLLKt6Bzdzqy8q7HuwbIPAORYzML/tOhoNrsUvDDV7eWXBQp3
 VRw9zbA5X0NrlNWzEnDxrDtpnyuW6Tkd8hQpgRKuhVe3THc6TZglmxeSmruUfH7MC8MxI+b
 cNcf6ay7yUKn9o008eBRLU62V+mbeHjjD+/3FeQqCKWBo9McpLEebYNKjfGY8ZCySCWlSvL
 akUz+sGA3ldLfOZ5r5Tsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bXwE1tsuE60=:TwybvquKwcCO02DHBJNaXB
 T+eFNIZrvQfBFr7izPY9YaOka11bYXs3999tGG1d3OKTqcVu9qi7hYrazgu+toHBjIoyBJtCA
 7T/jiQxyJFAuz54aSHcL3F6JSDLmEZlX3Or+Vw/W6i9VZ+bS0M/wrWPuGgVqbkpllSTcxHmOi
 UTRFiJt+jGEfioGUiEV9VYV1qvKH8TFdYnBBXjCjJnWLjztqoxUovSk9xSxJAvo3476deDfF9
 mh3hzlBaRxpaJl2lisGRG56U5sCofxr0B4RYTsf+1jMzDaGeAtrKFV1l1O+izwUZxhzPN+AwA
 gQUTROKpC5wvDw4iR7O4WS2UppyaJ/XYtOfsM/qRxWUMkqQlsIaVQVNE9kl4imylPDP1i1bnS
 RK82pnjpOufAaIPG3KurhyBqVXsA1h9xj5vI2kxXsxUQcrcxV6lcq/rDHm4PR

On Wed, Mar 10, 2021 at 4:06 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 10/03/2021 15:45, Tom Rix wrote:
> > On 3/10/21 1:45 AM, Lee Jones wrote:
>
> Many other architectures do not have vendor prefix (TEGRA, EXYNOS,
> ZYNQMP etc). I would call it the same as in ARMv7 - ARCH_SOCFPGA - but
> the Altera EDAC driver depends on these symbols to be different.
> Anyway, I don't mind using something else for the name.

I agree the name SOCFPGA is confusing, since it is really a class of
device that is made by multiple manufacturers rather than a brand name,
but renaming that now would be equally confusing. If the Intel folks
could suggest a better name that describes all products in the platform
and is less ambiguous, we could rename it to that. I think ARCH_ALTERA
would make sense, but I don't know if that is a name that is getting
phased out. (We once renamed the Marvell Orion platform to ARCH_MVEBU,
but shortly afterwards, Marvell renamed their embedded business unit (EBU)
and the name has no longer made sense since).

Regardless of what name we end up with, I do think we should have the
same name for 32-bit and 64-bit and instead fix the edac driver to do
runtime detection based on the compatible string.

        Arnd
