Return-Path: <SRS0=6xFU=II=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A97C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 16:43:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CC3C64FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 16:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CC3C64FB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2veGjgeYNXHePRSu1rtsHxa9vxpYErG3IF37GlBs/HY=; b=Cu8/5oec+ihZcJsjVmIosO9zU
	PnNkVUBXq7kaOc9YCkO4729iZr1jXxe+s0lCfZnNouW71O8nBaIP6yxfCaWydO3KpvvFdXXHMyQQb
	nno0a9s1JKRQwbIOvfN6bg3jp6vnIW8jz80sOrlwd7pkWPx2iM+zugukWxFTVHdxwTBbCXBRsWjHl
	qQ5HGDWyoC7fMIQIQFtHIuj7sKB+V4gFtcq4mT3q4iAPlA3Mhz6zm4dgDk+rlgIQZZ6JEmpFCn1XU
	+rvtATqQeYe0X3U8OTJMi+8Dp7xVjTJW1/PY+F19TxUFPSuhqJrqsrylAuFte9n9pVuGCpsNa36am
	12v1zIaSA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK1uw-007G6r-7R; Wed, 10 Mar 2021 16:42:38 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK1ur-007G65-Pe
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 16:42:35 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MhDN4-1ly1IQ1pNy-00eP0E for <linux-arm-kernel@lists.infradead.org>; Wed, 10
 Mar 2021 17:42:32 +0100
Received: by mail-ot1-f50.google.com with SMTP id 75so13734146otn.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Mar 2021 08:42:31 -0800 (PST)
X-Gm-Message-State: AOAM532Kygq5y/qBDacrGCGUf1hARHcBcdEEYTDr0+CRnBsKyqKI0TcP
 CTQZSU3JmdPS/ankfE0zAicUf7+3XPEkNKsmGd0=
X-Google-Smtp-Source: ABdhPJwWKWol/izxVLT1AnVOt4GuD9z3iMz5KYY704sE+gXiB+rSpGmz56qGx1HmOVASlj0OW4Sd2OtpS9wyLv30UgQ=
X-Received: by 2002:a05:6830:14c1:: with SMTP id
 t1mr3205568otq.305.1615394550932; 
 Wed, 10 Mar 2021 08:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell>
 <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
 <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
 <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
 <52d0489f-0f77-76a2-3269-e3004c6b6c07@canonical.com>
 <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
In-Reply-To: <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Mar 2021 17:42:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
Message-ID: <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
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
X-Provags-ID: V03:K1:PLJfhYMPJIOQd66/ZKUX3BnTbAQe2Y8bdBiXfpR6erR7rLfSHzj
 6TYsQjeAV/MyU+dSoXPMXcGmwV55NR3C7dHnAR8croFPnX+tw6405k+22vpyL14I0x0fwKF
 6gI+RBbv5g7+fD4yVdeRLJtadfTr95nJTIxSWxwfk1c1AheDlQqEUgphR1eCuG90nKpOsnC
 HzdTi9c8Z0GxKFU3I+S/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1Gqv92l/Ss8=:zKHdzh6OxOgyOELYPU0Mmb
 XQUNLn6Of82PReKy06S9+r18DZRN7bILtA5nN45x+cuOB2SfLMaPdJQ+EGYfHgEoJVkbeEydh
 Sac/3yUWJS/25bs0QqQbQrjgXPEFLfgKB0W7skkbCiGzoEClpGopnPLy1d79ayyLpKaltyzNv
 YUkJaQ7bjvOSNUE80sEORNNKUeqlYsLGZIFQrfHo5Z1CuEs9fmijFKIj9xxqCseFrSM/Q/qz9
 Nr0vld/H77DipWplj17Y2sxk/eiHpB8RtdRjLF7+Z9mZXUIhmWWZUA3wQfK21Gu8zJwO4ikM8
 z2OILr+w7mCaMfigFcocKSNKZVDEI6bgozFrl9Yfd0qvYgtTfGKr1QjqRsswfPoFoy7pYM5VD
 HQN6rWp1cQvJJz4nieKe6W0OjaE/jM0spUbmf0Ii1kpr1OMykjoOai9wNjHkimxqf5CWaQLRv
 5we9/mV89viFddREd0jqkcq96mpgezXCrwRnzLfOfirugPeUoXizL04ucpbBxF6zYdf48EnrU
 TmrPrwvldZz2/UN2n5su3NSMnMa7UqgxTTgWlaaTSLRxFYFIQr/r+q4oB8V8tz0Zw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_164233_954405_C591DEFC 
X-CRM114-Status: GOOD (  17.85  )
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
Message-ID: <20210310164214.HycCAAPlM-lqyW4xoeGnv3Xuu5J_1yhbVAetPzgEJWQ@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
