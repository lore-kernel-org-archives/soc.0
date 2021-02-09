Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926A3C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 09:36:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DDB564E70
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 09:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DDB564E70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=My+sLnmfBbQl5SkZUdwPBaVSNH6wevRW+tWDujJX+f0=; b=HTd8ZE2/P+OG4yC6iSCkustZF
	b7q1DnNi0Zb6qNeirpxEEMyZYYAihxE21AZSEXJjSxkOxajjMx0D6dioV4EkeBpUAyGe/lQmKVpgC
	IepP4B4Kp4B3/pRN/C4JdJXSHxt7JBa9VPoh/E4RgNe4QYeJ7MDH/T22O0T0/4i7BLHSby0C7mbZ6
	2QpMn16A08hr9J9yPUwrkFpjQPnMPehkqvzwaR1okoyT558msbcXBp040QxgkOb02dx0BPmcmCvgF
	GaMmiGryyx52/hH+NZhxZtCYRc/aE66HMrE8WbNaT1Dfltk+RAsH5gYT1mr0Bh7DJXtUyBLtPtvNL
	drK4idlZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9PQp-0005tM-8o; Tue, 09 Feb 2021 09:35:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9PQm-0005sf-5b
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 09:35:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E75E64EBE
 for <linux-arm-kernel@lists.infradead.org>;
 Tue,  9 Feb 2021 09:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612863335;
 bh=jL3SniywO5u2HvwWvr+4zpdojrM78OfC5sqXBjRhatw=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=gd6jEHvfD96JX7nfGOEc9j3evHHbTaQiRR3sAK6EVh25wJNFutm5JnHu7lapXeCvR
 iAk4SxCNzPstiAswUSyQ7z2AfKgQAzheUPFlcebEfckzyQmLEhk7uezQQz+rwE0wjJ
 t37RUdsONKIZOiMY/ZmL49Q8C8x/F0303Q+Op1RC9haqfKw58d+z+6xg+H43G+XxvU
 17AZXrFkWaDpxv+LT0L2eQqjM0Dt0qsKczXMBdf9TZlUB0h0J1b/9KTawd0WZ184s7
 7jqFPV7Ua3/cJOlySXFwMsIaeTOhxC5t4vvvKeTyY9v4cSbBuzj6cSlSuk8lPVhHnk
 PnlQJ++HSg94Q==
Received: by mail-oi1-f175.google.com with SMTP id g84so4960084oib.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 09 Feb 2021 01:35:35 -0800 (PST)
X-Gm-Message-State: AOAM530JAoZI7P7Na3Zb+5rYIKbVqClZGY0zJMcz72ExlSQkRh7mS5UH
 D5kFKABSXoFce5hVwKS9NW/5r05a2C305J5+Lh0=
X-Google-Smtp-Source: ABdhPJw4GWCSmfeKweQNGUXXQathR0hMRFccaBX7SQUZo5cOel2AR/HsZ26KG+B51/GiHwEKLujdvDR41UwJZukDjZQ=
X-Received: by 2002:aca:e103:: with SMTP id y3mr1802723oig.11.1612863334458;
 Tue, 09 Feb 2021 01:35:34 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-14-marcan@marcan.st>
 <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com>
 <c1bc2a087747c4d9@bloch.sibelius.xs4all.nl>
In-Reply-To: <c1bc2a087747c4d9@bloch.sibelius.xs4all.nl>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 9 Feb 2021 10:35:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ovXa3P67XXDVN0p5ECGeJRjmbGAursoKMpBKTzsDi1g@mail.gmail.com>
Message-ID: <CAK8P3a0ovXa3P67XXDVN0p5ECGeJRjmbGAursoKMpBKTzsDi1g@mail.gmail.com>
Subject: Re: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms
 that require it
To: Mark Kettenis <mark.kettenis@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_043536_379790_DD5D6D9E 
X-CRM114-Status: GOOD (  20.16  )
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
Cc: DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Hector Martin <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209093518.zwZ6lVgD4DtaSe_i2QabnhhZKEJKl5DNc7L64ZWYBJc@z>

On Tue, Feb 9, 2021 at 12:20 AM Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> > From: Arnd Bergmann <arnd@kernel.org>
> It is only PCI mmio space that needs to be nGnRE.  The PCI host
> controller register space itself needs nGnRnE just like all other
> integrated peripherals (or at least it works that way).
>
> For U-Boot I'm using the following memory map:
>
> static struct mm_region apple_mem_map[] = {
>         {
>                 /* I/O */
>                 .virt = 0x200000000,
>                 .phys = 0x200000000,
>                 .size = 8UL * SZ_1G,
>                 .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
>                          PTE_BLOCK_NON_SHARE |
>                          PTE_BLOCK_PXN | PTE_BLOCK_UXN
>         }, {...
>                 /* List terminator */
>                 0,
>         }
> };

Right, that list agrees mostly what I found, except I didn't see a
continuous 8GB range at 0x200000000 in the ADT ranges properties
but instead a 4GB range for most of the on-chip components plus a
2GB range for stuff that is related to the first PCIe host, starting at
0x380000000 and nothing inbetween. I suppose this makes no
practical difference.

For the PCIe ranges, I see that only one of them is non-prefetchable,
while the other two ranges are marked as prefetchable. These usually
get turned into ioremap_wc() or ioremap_wt() mappings in Linux,
which are more relaxed than MT_DEVICE_NGNRE. Having
stricter attributes in u-boot shouldn't hurt, it might just be slightly
slower than it has to be.

> struct mm_region *mem_map = apple_mem_map;
>
> This seems to work so far.  It only has the regions for one PCIe
> controller.  I suppose the other two are there to support the TB4
> ports?
>
> So there is one 512M region for "32-bit" mmio starting at 0x6a0000000
> and one 1G region for "64-bit" mmio starting at 0x6c0000000.

What is connected to this controller?

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
