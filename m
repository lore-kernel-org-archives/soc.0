Return-Path: <SRS0=mund=II=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB201C433DB
	for <soc@archiver.kernel.org>; Wed, 10 Mar 2021 16:42:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BF30764FC7; Wed, 10 Mar 2021 16:42:35 +0000 (UTC)
X-Greylist: delayed 3756 seconds by postgrey-1.34 at mail.kernel.org; Wed, 10 Mar 2021 16:42:34 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBCE864FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBCE864FC3;
	Wed, 10 Mar 2021 16:42:34 +0000 (UTC)
Received: from mail-ot1-f49.google.com ([209.85.210.49]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MiagR-1lzOLH3bCp-00ffe1; Wed, 10 Mar 2021 17:42:33 +0100
Received: by mail-ot1-f49.google.com with SMTP id f8so11941491otp.8;
        Wed, 10 Mar 2021 08:42:31 -0800 (PST)
X-Gm-Message-State: AOAM5319ufzOYw/WzYBnSsuUUWT1IWXChhYn/aKp9fj67VWNZSsWBhs9
	GZESmzmHYcOpqKrVNDio87cQOA0De72ppiMs2T4=
X-Google-Smtp-Source: ABdhPJwWKWol/izxVLT1AnVOt4GuD9z3iMz5KYY704sE+gXiB+rSpGmz56qGx1HmOVASlj0OW4Sd2OtpS9wyLv30UgQ=
X-Received: by 2002:a05:6830:14c1:: with SMTP id t1mr3205568otq.305.1615394550932;
 Wed, 10 Mar 2021 08:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell> <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
 <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com> <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
 <52d0489f-0f77-76a2-3269-e3004c6b6c07@canonical.com> <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
In-Reply-To: <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Mar 2021 17:42:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
Message-ID: <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
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
X-Provags-ID: V03:K1:bFPcSVnluOyWBPGsWiVziTPGBgxwCMpbum4dL99Wcbqa/x24CVB
 W1oOhh7coufSr68fdZ0e3hy+e4VNrEhHBnXf2d2SWW0s6QqzS8nbquQjY6c7wCIzvPK8Ms5
 sKWs62PX0YEllwU4fVI/Ip61sGV9JlHl7+Z2W9G1Ay3CfM5C13K07HrMk6CBIEnaB0i699H
 M7uUgStT1Ux7hOO4bD8vQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:89IODsnBVbk=:51CvcVPYbuQXICsZTUMaE4
 h8lFdLyNGuFbkV43OrKORvkTeG2ChcUPeRlKPoI7xXKsvt1VcWHdVcw+OrD3U4PNlyZYc3dXc
 WBVCK/2cyRB46U8TYiTQ3YSNNk++i5P/l+/l47LHdbq5wJEN7TWPMxxK6pUsJWjYV8+jpdXXP
 v4CdMCBMNDdUkITV8IYc/yyhJnYlRWpk/oxaNLyeLvln1/tx9+KMe04eMBemPnma3uzwljHFs
 yYU9bVdzN5SVDDbFoBM7hEO7kc/O2Sa2FNaIE2AHNSRT62XPO2A/z0I3Zhm0k14BQKwC2vGoa
 gXaLkDqsanLfhxXb7CHRCUCzMDPl8rnJED7oTnndEIzlHpya2QyWLx9TpG3uQfmLqYq46/4tk
 e5qrY8OijSxStryHSKsC+c4L3286fHMtLhpBImxnBeUHNj7B+kEbUmI+374GC

On Wed, Mar 10, 2021 at 4:54 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 10/03/2021 16:47, Krzysztof Kozlowski wrote:
> > This edac Altera driver is very weird... it uses the same compatible
> > differently depending whether this is 32-bit or 64-bit (e.g. Stratix
> > 10)! On ARMv7 the compatible means for example one IRQ... On ARMv8, we
> > have two. It's quite a new code (2019 from Intel), not some ancient
> > legacy, so it should never have been accepted...
>
> Oh, it's not that horrible as it sounds. They actually have different
> compatibles for edac driver with these differences (e.g. in interrupts).
> They just do not use them and instead check for the basic (common?)
> compatible and architecture... Anyway without testing I am not the
> person to fix the edac driver.

Ok, This should be fixed properly as you describe, but as a quick hack
it wouldn't be hard to just change the #ifdef to check for CONFIG_64BIT
instead of CONFIG_ARCH_STRATIX10 during the rename of the config
symbol.

       Arnd
