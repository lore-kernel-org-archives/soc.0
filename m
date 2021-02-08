Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70ADBC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 19:54:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0623D64E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 19:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0623D64E56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SFDR8lgs/lRJ6c26cpjMARtmNbeXtelYIuujo3iKzXM=; b=izCjmAThccMKPjNNYzSmtfCWR
	ScWjICDF2wdyNANWRM8uKTKvkIA2pdzfQwjptYtm/mGoTVCbxbtiSknGKmP1QjhbgQzyxbE1J/Zvf
	/E2OOqcd89tfkih1VUvDDy/mT9NMHWMbZgqtJZnMDmSyARYhqt4MoCjnRnGAY5zIQ5oVoqF85eMHq
	CjnGLVb3LbBPdimzOePTbhMzF1+Xo02Z5GNYS2sDog2h2N6RfbyxuPhxIx9E66O9OUmamJaNc8aRO
	0Woj00i3P1vmpLU1wVHd9iiSW5ofEUx3JlW+J2fqklnZfXWwW5bfndai4qVnL8Gd3nauRtd8WsHj3
	IQdsJJx1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Cai-0000yX-H8; Mon, 08 Feb 2021 19:53:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Caf-0000xi-Af
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 19:52:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2F5B64E6C
 for <linux-arm-kernel@lists.infradead.org>;
 Mon,  8 Feb 2021 19:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612813974;
 bh=eiGanYsM4ny9pQGs912SF4AjxSKKcTeDEGaxwswWXHw=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=sl4jWNNo4YORxyEzt8jZsjZou1nPtH5ZTvYUe9Prt76sUHA8RqB8dCcrEiLn1Fm3m
 fD+97pAuzRsFb4FLH8dk5TMg/Pp6rbWa+Lfvmzc6dvaCJ1KYkIlh+TWWo2FKFQlvBs
 LT4KgixKoahCWJBCo8hPP7qPPG+E0Lok5EcIcvGBVPN/ygDOMoxb0fVsoVMN4UbJlL
 JKfKTcALX+1E+kCA9StiG0U9hPrVPuzTyRBFnE63K8abGfeQBkGdhmb9CCfNGTx19q
 otaUBRkChFtwNxjA/ymSKkglw82up3Mf95uqvw3NuPwNwpibqPmm+NtXVSGyLat4CO
 HF6pwn7/rK4OQ==
Received: by mail-oi1-f175.google.com with SMTP id h6so16922074oie.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 11:52:54 -0800 (PST)
X-Gm-Message-State: AOAM530w5lUXxOmI/NYnshPcyp9RDK5ckM6LHKES+Mo9euL5qFfK3Bre
 Ynn1cbFHoWwCq0q06MgY4wpNkjoRZlMiC8Fai5o=
X-Google-Smtp-Source: ABdhPJxG0g9yRMUDUJ/hYPb/xCqi+0HinEPiqQg/dwp7s0Nd+LTawyFBWEQ9STEMvEbnL1t+YMm7YsXd7v6Yz0CjEPo=
X-Received: by 2002:aca:d908:: with SMTP id q8mr234432oig.67.1612813973836;
 Mon, 08 Feb 2021 11:52:53 -0800 (PST)
MIME-Version: 1.0
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
 <YCGBIvRfoP0BeyrP@builder.lan> <20210208184230.onhlioflyylkx6xo@kozik-lap>
In-Reply-To: <20210208184230.onhlioflyylkx6xo@kozik-lap>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Feb 2021 20:52:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3bsw8p2Geyo-vh1AJUfMQCCf3kpa_YB+tKmcvWHqRcEw@mail.gmail.com>
Message-ID: <CAK8P3a3bsw8p2Geyo-vh1AJUfMQCCf3kpa_YB+tKmcvWHqRcEw@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_145257_517795_39847048 
X-CRM114-Status: GOOD (  24.68  )
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
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>, arm-soc <arm@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, DTML <devicetree@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Ripard <mripard@kernel.org>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208195237.v2zYLQtbMvbAW6NRrUsBDOw0vgOnFUUBgO7oOY0n8nw@z>

On Mon, Feb 8, 2021 at 7:42 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Let me steer the discussion to original topic - it's about old kernel
> and new DTB, assuming that mainline kernel bisectability is not
> affected.
>
> Flow looks like this:
>
> 0. You have existing bidings and drivers.
> 1. Patch changing bindings (with new compatible) and drivers gets
>    accepted by maintainer.
> 2. Patch above (bindings+drivers) goes during merge window to v5.11-rc1.
> 3. Patch changing in-tree DTS to new compatible gets accepted by
>    maintainer and it is sent as v5.12-rc1 material to SoC maintainers.
>
> So again: old kernel, using old bindings, new DTB.
>
> Another case is where out-of-tree user of bindings, e.g. FreeBSD, takes
> new DTS (at point of #3 above or later) but did not take the bindings.
> Such system would be broken but it's their fault - they took DTS without
> taking the bindings (which were there already for one release!).

The particular boot flow that I am worried about here is when the dtb and
kernel are not updated in sync. Traditionally this happens when the dtb
is contained in the firmware image or generated by the firmware, as would
be the case on any server class system, but also on embedded systems
that can run an upstream kernel but without having the dts contributed
into the kernel sources.

When you have this case, you can install a working system, and install
an upgraded kernel without problems. You might then want to update the
firmware as well, in order to take advantage of the features implemented
in the kernel kernel that require a DT description. Again, no problem.

However, once the firmware is updated, it may no longer be possible to
go back to the old kernel in case the new one is busted.

A similar problem can happen with the EBBR boot flow that relies on
a uefi-enabled firmware such as a u-boot, while using grub2 as the
actual boot loader. This is commonly supported across distros. While
grub2 can load a matching set of kernel+initrd+dtb from disk and run
that, this often fails in practice because u-boot needs to fill a
board specific set of DT properties (bootargs, detected memory,
mac address, ...). The usual way this gets handled is that u-boot loads
grub2 and the dtb from disk and then passes the modified dtb to grub,
which picks only kernel+initrd from disk and boots this with the dtb.

The result is similar to case with dtb built into the firmware: after
upgrading the dtb that gets loaded by u-boot, grub can still pick
old kernels but they may not work as they did in the past. There are
obviously ways to work around it, but it does lead to user frustration.

         Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
