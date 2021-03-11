Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362C4C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 09:17:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E6CD64E69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 09:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E6CD64E69
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sFIvl21OJFRU2TbMOiPeBOUpN/503FN85iKrZ8i9TU4=; b=SvCSQSYlbQ4SvnU1hrkSqrG8g
	QR4uJU3ZsPFRvw+lQxbQui0EdHfTU0bf5WbqrxYwGdcGdA8izV+CVm1iRz66I2RRvJUp2gJCYdPwZ
	M3vBDaVTA8Po3rOw0W6diSCQqfUfTjFmARUzohQMUn1koZkS9zoHSkhbdsHNnm2qT9xS/j1VNC5q/
	RLdladUnqlHox0lNG/mfGAUTw2kROC6YzEkuztat8fvODPzjjMnH3fe8DdAziazUS33h+FCaO6ifQ
	lF+xBAlnpk1kqe2GxQYn4sjtIvU+OkzcvpWzLxQfXJAWigoRmmkHZ0bwl2hUbH5hTzRgWmqwXPz+B
	1QURfjKXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKHPV-008jLp-9a; Thu, 11 Mar 2021 09:15:13 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKHPS-008jL7-An
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 09:15:12 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MKMIR-1l1lsz20ch-00Lqgg for <linux-arm-kernel@lists.infradead.org>; Thu, 11
 Mar 2021 10:15:06 +0100
Received: by mail-ot1-f52.google.com with SMTP id 75so854356otn.4
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 01:15:06 -0800 (PST)
X-Gm-Message-State: AOAM531A+VUW5SGohv2l6aIQaMC8b5X5nRTeRD/8XxA92mqy5Mycavl1
 amD4sZtiJcETE+WbC99Yg9Fi7+EMtG64Np7fJFc=
X-Google-Smtp-Source: ABdhPJyn+biUFqeUpWbgYz+onSoY1lB5lZXnaVdOJ59ivfe6fWw6B/LYP9dm97k0WNF1I7ZVkGTZlALTwC9lFjwxZew=
X-Received: by 2002:a05:6830:14c1:: with SMTP id
 t1mr6129948otq.305.1615454105254; 
 Thu, 11 Mar 2021 01:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell>
 <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
 <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
 <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
 <52d0489f-0f77-76a2-3269-e3004c6b6c07@canonical.com>
 <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
 <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
 <fb0d8ca3-ac46-f547-02b0-7f47ff8fff6b@canonical.com>
In-Reply-To: <fb0d8ca3-ac46-f547-02b0-7f47ff8fff6b@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 11 Mar 2021 10:14:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a05VkttECKTgonxKCSjJR0W4V1TRrUYMydgUGywbCSCWQ@mail.gmail.com>
Message-ID: <CAK8P3a05VkttECKTgonxKCSjJR0W4V1TRrUYMydgUGywbCSCWQ@mail.gmail.com>
Subject: Re: [RFC v2 3/5] arm64: socfpga: rename ARCH_STRATIX10 to
 ARCH_SOCFPGA64
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Moritz Fischer <mdf@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, linux-edac@vger.kernel.org, 
 linux-fpga@vger.kernel.org, Networking <netdev@vger.kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, arm-soc <arm@kernel.org>, 
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>
X-Provags-ID: V03:K1:D58NCdJIrb98WJTdix30Bi4AMyWPJCbXg2Jx6XAa/CjZcMzpD5i
 mptJUF59bie75XSEGNEuKdpaa2pVp+gKL1SrZisss2YY8sEhoOxGB5SpnooEZQ7VuVut7G5
 ICgPfEUmle1JcPANIGje2rUejEt692R8cpws/dHcnjGdeTSjDX+Q3+ywnqp61jp7V9hdYlO
 PEoi2NGYITPzHniTVY7Vw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9qNLf8FqpI8=:AwYfWNJz4XYQucgxDeyaDO
 RchblNtoeu+iau08MHLWY8tx86VcrOGB3UnJnNXXvPw9VhVsCSMfyrakonwyBhSnbRCJalzPj
 HxP8eyWzX8Ng7nhCfw1WJUPNm7WwyzsGds0PtEMfwJBRUx3raeKBY9hHaUp6uTsTdL9bm7Tcy
 ahyMyLclMmk4Khi0sR1WGMJHCRNlZBWp3wvnniUBFYO9Lj05SNkSW/HuKUeOvpY6BR9npQNnU
 SWpPXzc3jSwKifEbEC1KSdhInlxHYXcNBQ3eaXB6pJb6I66ids26JH4IhbV2M0U1zkksZTKlz
 g2FymqQZcsxKGoqiS4FeI8OQeVkP+AE83TSNNGblCiPOb5B2Ro8Tgus/JE7UVan+iAO/w1TS2
 Orq/LsS2N6Y9kIIvFY3Dq2Vm8ECg/rguOJ2urtpU0RcBr+cBaKrOAX7XgNDTZDBemIOq9zCJt
 BKWvrqkM4+RCs1pOfMVWuNLOlPk5rWnIjLY+Veg/pxIxo4jKc0xy5bEFMLXF+Zz5pHwvQqr/q
 /A2skGe8bPRTvxAmVqio58X9OFqIneK8FyMF7/okgw8Jp2mHCsD+pksxXyLMJuX3A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_091510_508314_36A67F20 
X-CRM114-Status: GOOD (  25.56  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210311091449.2YNJ4HqOohQnovPYIJCYyws5vmd9wD0vvbo8yyaE9ow@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
