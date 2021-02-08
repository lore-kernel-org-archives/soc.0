Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A386C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 08:41:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEB4A64E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 08:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEB4A64E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MHm/usI/wCb2v0jdxsm09rAtsJVeUmh3xdCBD8bKBB4=; b=KyE3dw9JUi/7FEowGCPmUgnB8
	e7wsg+FIfF80eP0n1IZ1Q5JY1HG5UmvSWmDOoDT0XKlvSYsRu7Dp48yiBgifdA3Hq9TF40JpzJ35l
	QSo4BQR0fguQxz9VFbUBhyRL0gp5gYMGpEPS2rEUdQ73d/2ltadVeJd+byexyiTbPWhKp2jEGcXL0
	db9gU4sYwcDDWIB6coEvyJ6KeW/kQt8OqCAp+UCISjqXW+K5MtLFbF1Zmba7OtEgU3qFTQi25ul2Z
	Abu+5belwmrl4N1YyBH5eDTLPsocjjFUEqYiTgTCzsrfRM9qLxedBU9QVDT2wbUuB8GamYviN2YQ+
	9sXKFurxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9264-0003oD-1e; Mon, 08 Feb 2021 08:40:40 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9260-0003mg-2H
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 08:40:37 +0000
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id E962A80A3;
 Mon,  8 Feb 2021 08:40:45 +0000 (UTC)
Date: Mon, 8 Feb 2021 10:40:26 +0200
From: Tony Lindgren <tony@atomide.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Message-ID: <YCD4+pb4MfuA1b9e@atomide.com>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_034036_211336_E6A7FA59 
X-CRM114-Status: GOOD (  24.16  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, arm-soc <arm@kernel.org>,
 DTML <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208084026.dUvFPzt6ezh_NN2pURxEgeZgleiWCVefY2_yBfL3xG4@z>

* Geert Uytterhoeven <geert@linux-m68k.org> [210206 19:48]:
> On Sat, Feb 6, 2021 at 3:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > What do others think about this? Should we generally assume
> > that breaking old kernels with new dtbs is acceptable, or should
> > we try to avoid it if possible, the same way we try to avoid
> > breaking new kernels with old dtbs? Should this be a platform
> > specific policy or should we try to handle all platforms the same
> > way?
> 
> For Renesas SoCs, we typically only consider compatibility of new
> kernels with old DTBs, not the other way around.
> However, most DTB updates are due to new hardware support, so using the
> new DTB with an old kernel usually just means no newly documented
> hardware, or new feature, is being used by the old kernel.
> 
> In case there was a real issue fixed, and using the new DTB with the old
> kernel would cause a regression, and we're aware of it, we do make sure
> the DTS update is postponed until the corresponding driver update has
> hit upstream.

Yeah agreed. Adding new devicetree properties should not be a problem
for device drivers.

For renamed devicetree properties, the driver won't be aware of them
if a newer dtb is used. The only thing the driver can possibly do at
this point is maybe warn about some missing old property and bail out.

Making sure the driver changes are in place first helps a bit..
But naturally fixing the driver in advance won't help booting kernels
before the driver changes with a newer dtb :)

What helps though is to make sure git bisect works for building and
booting already at -rc1 kernel to make debugging the issue easy. As
-rc1 is used typically as the merge base the problem causing branches
can be tested separately that way.

Regards,

Tony

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
