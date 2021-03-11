Return-Path: <SRS0=JLLq=IJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E591CC433DB
	for <soc@archiver.kernel.org>; Thu, 11 Mar 2021 09:15:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 97E1B64FB8; Thu, 11 Mar 2021 09:15:12 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9966A64E69;
	Thu, 11 Mar 2021 09:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9966A64E69
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-ot1-f43.google.com ([209.85.210.43]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MrQN5-1m7vJ60vSB-00oVJ9; Thu, 11 Mar 2021 10:15:07 +0100
Received: by mail-ot1-f43.google.com with SMTP id t16so860419ott.3;
        Thu, 11 Mar 2021 01:15:06 -0800 (PST)
X-Gm-Message-State: AOAM533I95g3qKnJGpU2/swNr0GTQHyFDxiytcfzUNPZSP3OEhwVL+jz
	e4tgxIFIkiaAIEJcQ6YuoB0efMjC+MzcQR1cDdw=
X-Google-Smtp-Source: ABdhPJyn+biUFqeUpWbgYz+onSoY1lB5lZXnaVdOJ59ivfe6fWw6B/LYP9dm97k0WNF1I7ZVkGTZlALTwC9lFjwxZew=
X-Received: by 2002:a05:6830:14c1:: with SMTP id t1mr6129948otq.305.1615454105254;
 Thu, 11 Mar 2021 01:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell> <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
 <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com> <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
 <52d0489f-0f77-76a2-3269-e3004c6b6c07@canonical.com> <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
 <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com> <fb0d8ca3-ac46-f547-02b0-7f47ff8fff6b@canonical.com>
In-Reply-To: <fb0d8ca3-ac46-f547-02b0-7f47ff8fff6b@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 11 Mar 2021 10:14:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a05VkttECKTgonxKCSjJR0W4V1TRrUYMydgUGywbCSCWQ@mail.gmail.com>
Message-ID: <CAK8P3a05VkttECKTgonxKCSjJR0W4V1TRrUYMydgUGywbCSCWQ@mail.gmail.com>
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
X-Provags-ID: V03:K1:QJkSDiV1wbCmdeUEnO+jqRlmB3Yhbfg9R08Abx3GOrE3sc4Bi/e
 +hBiHQhr18xcfmxVrHwsk+HgtGDc5qS3QCqyl5bfgoIxkcyoT3RHPQKCNT7zXTA4+Hv3GS2
 MqE6tnYVkUBQoSDsiDZhCBv8YVwzyMf+apBzx3cJ47igL6JPNCscgBHjbCkLjbSLzAots+s
 gUv423ZfVV2o3ecSfVQBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J4FEMRqtu/A=:GT/969kV8lASh5iPiCI1I6
 QCSRcAcyALiu9vGrk3P8QXTKfaDJXVrG7NMsWVuiCwlmbbXy33OP9LI/BthKD4kZiuTqZbqZO
 EmggUQwwOhAsbK02EJ52+CFQPPMX4gS7JBhcioODUka4qxXYn6Z4rO8U1GhbsOvImNL//gwmC
 /PsKkJK9g5CqRH5bwld+ejrBps2d8SyFa54fLz2UzP+sOFVxdyWvkFNkoFV39kpz35ok4K1AI
 19Z1a3lEsZKAN0Pmg0dEWsdEGn9oDN9g/fqTQ++hFFn52zc6Le7rPG1UbCGF0jw+bka6r6vj2
 /Km8kyW6RXOLoI/+yArqutBcbl9cgX1JXqoS4NysXVpkC5UUJqZXVpOE7gifmfOUpl10Rrmu9
 pRdVRyBj+38jI6Y/6HaCLnVI785nFClc7y2nMihEMF53/w9dBsKYKTg8ErcqiS1T5WfcubVe4
 T9d6TjOvLqagXalplPlHkIYQj7elSGtEKWD224Ly1xIbkB1S1+fx1hdqyXUv8eRjsO5KRflIL
 TMLBtmV8iIbCReMC9E5pUWP30+GVtyOiI93MLShaEP0zx0VYRIcoCQXPsJT02ujKw==

On Thu, Mar 11, 2021 at 8:08 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 10/03/2021 17:42, Arnd Bergmann wrote:
> > On Wed, Mar 10, 2021 at 4:54 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >> On 10/03/2021 16:47, Krzysztof Kozlowski wrote:
> >>> This edac Altera driver is very weird... it uses the same compatible
> >>> differently depending whether this is 32-bit or 64-bit (e.g. Stratix
> >>> 10)! On ARMv7 the compatible means for example one IRQ... On ARMv8, we
> >>> have two. It's quite a new code (2019 from Intel), not some ancient
> >>> legacy, so it should never have been accepted...
> >>
> >> Oh, it's not that horrible as it sounds. They actually have different
> >> compatibles for edac driver with these differences (e.g. in interrupts).
> >> They just do not use them and instead check for the basic (common?)
> >> compatible and architecture... Anyway without testing I am not the
> >> person to fix the edac driver.
> >
> > Ok, This should be fixed properly as you describe, but as a quick hack
> > it wouldn't be hard to just change the #ifdef to check for CONFIG_64BIT
> > instead of CONFIG_ARCH_STRATIX10 during the rename of the config
> > symbol.
>
> This would work. The trouble with renaming ARCH_SOCFPGA into
> ARCH_INTEL_SOCFPGA is that still SOCFPGA will appear in many other
> Kconfig symbols or even directory paths.
>
> Let me use ARCH_INTEL_SOCFPGA for 64bit here and renaming of 32bit a
> little bit later.

Maybe you can introduce a hidden 'ARCH_INTEL_SOCFPGA' option first
and select that from both the 32-bit and the 64-bit platforms in the first step.

That should decouple the cleanups, so you can change the drivers to
(only) 'depends on ARCH_INTEL_SOCFPGA' before removing the other
names.

        Arnd
