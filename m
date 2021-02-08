Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A7FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 22:58:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9DDC64E28
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 22:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9DDC64E28
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H6A6RiWraGQNeYXN4KNlEYaAembF2x3w5YpZNhRRIwM=; b=ek1aznVdt92Ub1/Qfyq1sVaXX
	+zwx9CVpsNQsuXolFTLSCYF3LDzXfncyno8+4sYNEsfX1OoUYm98N+aZJWBl73qcS69FyucnWLF3H
	G7yxmPmYo34uRnM6yYwXDrk8/bmS5ibZSpA6yL8qEqf9MYy3LHZrpASXI446SE+/7IBwhIpDU72yf
	T9lrCw7EjKX4k/u8UeBM2zjNb31AoFBdhxlIZ+IL1yW2thkMpQ/R9I5RczmS94bIqrZRznulXKJyQ
	AYUK5sQgzCW5/CUV/LeaKiytfAMx7Ct7Z5VGX0snX0ESPVFXIwBE3vKo1EP01kEIPoiGpqOOPvI8l
	MwVc+ATcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9FTR-0008LH-9Q; Mon, 08 Feb 2021 22:57:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9FTO-0008Kj-LK
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 22:57:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89C1F64E82
 for <linux-arm-kernel@lists.infradead.org>;
 Mon,  8 Feb 2021 22:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612825057;
 bh=P919Qa1qJD32fbxaRvfNFYW+BSfOgHq6PEyBAAiS8/w=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=KL+z2rOMfiTAozdB6tLLj9PWBH575k90toSUAlj/CVcZdXXFlHog57EMuJBh9gvY2
 5uRhp90fIuRTXK4huDETvqPxh2V7SLiTXvT9L4Rw/sn+16RThUcc25FibkCQb1xIO7
 7Y2uXrG5bGhqDdxQOYgYfIvrycPgA4ymZNDSR8gy78n4wUD44WquYqmSyY0GVOIiGL
 3DI9xQfWRBGbn/9LSVAlem8vhOe+PWEm4STAX8mxOeCsSvrP3ODz1tI5ozZdXnIkYQ
 9Rh33hkMfp2l03XcjX4WPgZ+w8WrOeKh06vAK2KrcD0thibQfMEx4uNHctB/PVM75C
 vgkV3zvZtOzyA==
Received: by mail-oo1-f48.google.com with SMTP id x10so2310375oor.3
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 14:57:37 -0800 (PST)
X-Gm-Message-State: AOAM5311+DOirXcHaRLnW96cJbMGcGJU6gIm4lxWhhRZ8HNiH8wPXj08
 dDm6Z6cWQlVRcnLnugA4V+R+89DKRpc351TIwvg=
X-Google-Smtp-Source: ABdhPJzmqJI4/MzPqEaK7uhiIQopRrNmfASqC0/l5Hh3ECLuGMBkOfMkpb0tBvruXeOtvMFfkds+U0Dx5D9DkogAqwI=
X-Received: by 2002:a4a:88c9:: with SMTP id q9mr14267961ooh.26.1612825056855; 
 Mon, 08 Feb 2021 14:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-14-marcan@marcan.st>
In-Reply-To: <20210204203951.52105-14-marcan@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Feb 2021 23:57:20 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com>
Message-ID: <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com>
Subject: Re: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms
 that require it
To: Hector Martin <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_175738_839220_F2DB4F43 
X-CRM114-Status: GOOD (  19.81  )
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208225720.mTdxlfB2JTBWyUywvzHUEx9CO9rwwfm1VbZ4VQc-1y8@z>

On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:

> (3) Do it at a lower level, in ioremap() itself. This requires that
>     ioremap() somehow discriminates based on address range to pick what
>     kind of mapping to make.
>
>     Declaring these address ranges would be an issue. Options:
>
>     a) An out of band list in a DT node, a la /reserved-memory
>
>     b) Something based on the existing DT hierarchy, where we can scan
>        bus ranges and locate buses with a property that says "nGnRnE" or
>        "nGnRE" and dynamically build the list based on that.
>
>     The advantage of this option is that it doesn't touch non-arch code.
>     The disadvantage is that it adds a complete new bespoke mechanism to
>     the DT, and that it does not let device drivers actually select the
>     IO mode, which might be desirable in the future anyway for some
>     devices.

I tried investigating further what this would look like, but scanning through
the ADT dump for what nodes use which register ranges. At first it seemed
the range 0x200000000-0x2ffffffff is used for all normal devices, while
the three PCI buses fall into the 0x380000000-0x4ffffffff,
0x500000000-0x67fffffff and 0x680000000-0x6ffffffff ranges
respectively. This would allow a nice abstraction where one node
contains all the devices in the 0x200000000-0x2ffffffff, and we do a
translation in of_address_to_resource(),  similar to what we have for
pci and isa nodes with their special addresses.

However, I did find that there are several nodes that use mmio
addresses next to the PCI addresses, e.g. apciec0, dart-apciec0,
apciec0-piodma, dart-acio0, acio0, acio-cpu0, atc0-dpin0, atc-phy0,
dart-usb0, and usb-drd0 in the 0x380000000-0x3ffffffff range, just
before the MMIO space of the first PCIe bus, so it gets a little
more complicated.

The actual device node could look something like

#define MAP_NONPOSTED 0x80000000

arm-io { /* name for adt, should be changed */
     compatible = "apple,m1-internal-bus";
     #address-cells = <2>; /* or maybe <3> if we want */
     #size-cells = <2>;
     ranges =
               /* on-chip MMIO */
               <(MAP_NONPOSTED | 0x2) 0x0   0x2 0x0 0x1 0x0>,

              /* first PCI: 2GB control, 4GB memory space */
             <(MAP_NONPOSTED | 0x3) 0x80000000  0x3 0x80000000  0x0 0x80000000>,
              <0x4 0x0   0x4 0x0  0x1 0x0>,

              /* second PCI: 2GB control, 4GB memory space */
             <(MAP_NONPOSTED | 0x5) 0x0  0x5 0x0  0x0 0x80000000>,
              <0x5 0x80000000  0x5 0x80000000  0x1>,

              /* third PCI  0.5GB control, 1.5GB memory space*/
             <(MAP_NONPOSTED | 0x6) 0x80000000  0x6 0x80000000  0x0 0x20000000>,
             <0x6 0xa0000000   0x6 0xa0000000  0x0 0x60000000>;
}

The MAP_NONPOSTED flag then gets interpreted by the .translate() and
.get_flags() callbacks of "struct of_bus" in the kernel, where it is put into
a "struct resource" flag, and interpreted when the resource gets mapped.

The PCI host controller nests inside of the node above, and (in theory)
uses the same trick to distinguish between prefetchable and non-prefetchable
memory, except in practice this is handled in device drivers that already
know whether to call ioremap() or ioremap_wc().

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
