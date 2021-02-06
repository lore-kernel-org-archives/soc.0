Return-Path: <SRS0=0nBm=HI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0830AC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 19:49:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8689F64E0D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 19:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8689F64E0D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iclXAghLyxBHy9WSqdHi6hd1esXUDsflAXt8Bbh1Bpc=; b=QQ9WNDsBaeDrM7UqXLLPgSN+9
	lzLha6YBo6dwJaEcFUe7feOoHAq/RTLdNEAsdquhWXYkUKVzd1+J2oVV6REAArj5II4PnqJsH482a
	8DIgGc0TTsF78eLTpHu9Oky68/QRHsmhmQuKVHq4wa/wjF/HIPMzSw1fgAZpXHKUWaVNkiPj9XkX9
	oL8kp9Kh64boSyKMzvtKHG7udYubvhg3kJ/6FLSC0K5VYnfBiSI8o+CFUWcp9K2+RPuWuvuFNSPim
	XuW2BwOfuXiXI7iLllGiNhl5JRt+NEADyAp4pFJ4ipiYz1jVk1jysdM67otmtYou+MHazRmYlg74t
	VONuwYzOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8TYs-0007FY-DR; Sat, 06 Feb 2021 19:48:06 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8TYo-0007Ej-UF
 for linux-arm-kernel@lists.infradead.org; Sat, 06 Feb 2021 19:48:04 +0000
Received: by mail-ot1-f54.google.com with SMTP id i20so10400171otl.7
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 06 Feb 2021 11:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8mVMNF4fRsyTZazYCsaAIH58/5IMUtcIzDAOPD4XiLo=;
 b=AjWrUVZHkGKlMxqS4dzg9jlDv57asyoAcbiqOl7EYxzwyMBJ+Kg3soAWFb8hb7mlBJ
 7ntC6YaJbWbt0CY9+Nl9zp7M569TvcRhtx4DPpPaTnr50YwXwPO3ndF6KGduOfvI1T8m
 WhHIL9PV+51rT3wXtO/XUsUJs+kk1G46wKN+mAy1Tv2DSUge3h6Voncu3Vdndr+GrchX
 3Lt1YaNjujl+pTNI6raNZlkNxb1dbGQ6j2QmoDLP749g+KBVsSwv4unmX6qqbqhTWnL7
 jB0eAK6YrogYtFDukyG+te5mON49qzJQyyfud+YhwcKLW9oFPukgZK83vol+EUtfO5lO
 hlWA==
X-Gm-Message-State: AOAM531KFokN30S+3PU0dSxhIrjmWBJHF6atmZNedAQDkOVIEAx92VZW
 ln0o0JsWJQT/RDYmh8Ct8cHs7Q8PbnE4lC2QWEo=
X-Google-Smtp-Source: ABdhPJw745S8LM8O3h8fPOXwjE6gI72k4oPqS5/xYZ9eVQi+tWwpGN5S3rTWZsDTboMo0cSPFheifgB+2yBBK2ArvyU=
X-Received: by 2002:a05:6830:15cc:: with SMTP id
 j12mr7710395otr.145.1612640880368; 
 Sat, 06 Feb 2021 11:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
In-Reply-To: <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 6 Feb 2021 20:47:49 +0100
Message-ID: <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_144803_035494_A69136E0 
X-CRM114-Status: GOOD (  29.26  )
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210206194749.9XHFIB19rbJVOkVcTcou_HezdxwFtxHCcBZ9p8SYSbQ@z>

Hi Arnd,

On Sat, Feb 6, 2021 at 3:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
> That said, I'm still not happy about the patch we discussed in the
> other email thread[1] and I'd like to handle it a little more strictly in
> the future, but I agree this wasn't obvious and we have been rather
> inconsistent about it in the past, with some platform maintainers
> handling it way more strictly than others.
>
> I've added the devicetree maintainers and a few other platform
> maintainers to Cc here, maybe they can provide some further
> opinions on the topic so we can come to an approach that
> works for everyone.
>
> My summary of the thread in [1] is there was a driver bug that
> required a DT binding change. Krzysztof and the other involved
> parties made sure the driver handles it in a backward-compatible
> way (an old dtb file will still run into the bug but keep working
> with new kernels), but decided that they did not need to worry
> about the opposite case (running an old kernel with an updated
> dtb). I noticed the compatibility break and said that I would
> prefer this to be done in a way that is compatible both ways,
> or at the minimum be alerted about the binding break in the
> pull request, with an explanation about why this had to be done,
> even when we don't think anyone is going to be affected.
>
> What do others think about this? Should we generally assume
> that breaking old kernels with new dtbs is acceptable, or should
> we try to avoid it if possible, the same way we try to avoid
> breaking new kernels with old dtbs? Should this be a platform
> specific policy or should we try to handle all platforms the same
> way?

For Renesas SoCs, we typically only consider compatibility of new
kernels with old DTBs, not the other way around.
However, most DTB updates are due to new hardware support, so using the
new DTB with an old kernel usually just means no newly documented
hardware, or new feature, is being used by the old kernel.

In case there was a real issue fixed, and using the new DTB with the old
kernel would cause a regression, and we're aware of it, we do make sure
the DTS update is postponed until the corresponding driver update has
hit upstream.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
