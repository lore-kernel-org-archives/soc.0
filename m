Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6843C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 22:23:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AB9164FAA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 22:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AB9164FAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+6y5Sl4RrU7AebUpKSQ6AgiNcli3BuHyqDPStnZUjOY=; b=ePGZgyrt/+JxIYHMZJjwA19+4
	en5U4Dq4TEyt5JBrb46415Kks1sH9m27031nUEUvDvS3dMdeHf0ePOFyaL10n/N1yesv+Cw2yON11
	BN8nUPXv/63CTGCLVnk4F6bVft43pdQyGs6V0Rkm4Ekoa/f0QP4V5p1j6m9Ph6uM0bO5gl6/IP6WS
	9tCGk9ddOJaikpRfeJIySx/tcQwxPxtgR4YvMT5xMAmMTnTnIfq2GF3IOI2fPvQcivpDpEgonbVUS
	rQkC+Q+D6RO3PolE9uaDvxyg08gj+m3fSRE6Xvy9+jkVuU798pTJBLAoBx4Qsdv0MC0HLID7rkF99
	erkdVlLrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7n0h-0000mx-Fo; Thu, 04 Feb 2021 22:21:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7n0d-0000mT-CK
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 22:21:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BF3064F95
 for <linux-arm-kernel@lists.infradead.org>;
 Thu,  4 Feb 2021 22:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612477314;
 bh=+CN1uQQdXEXC6lYww/lENb5xIX2/gfEMQhCaXNwvkk0=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=Yh3KOH43BaHHKlfEczso9qspSyZVUfdKzWdEWC4873St2CMG2KW6q5XR0YnwjXW7R
 1U45HxpcwAYNPjq2nSqfXp9NRuVx7TEqfgF10RQZfQws7S/7MO+G8h7X45AH16bEuB
 AFQ8C6T/cz0se0OSXOj5/ra4F7MH0oI+TPeRb2LfaTOulEmB6LhxM2CiNxPILq7e5g
 FlnDWUXAzsyK+U66X6AUC+ewHuJ1FkAMi25GI+GTFwb3H1LubjeFRnWtflqSv6XhDc
 S5Hp3Nbzjoo76KAxqsEWLXGsHyD32qbec5mRdvdca3JZXSpCHl5LPqq07ze4894n1K
 VhJN6cn+StEBQ==
Received: by mail-ot1-f45.google.com with SMTP id s107so5013459otb.8
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 04 Feb 2021 14:21:54 -0800 (PST)
X-Gm-Message-State: AOAM533EUQbP8/zmAyAKmXJqw5T7si5blxgaP0aJuqeQMj9qVDwO1DCy
 UIyc9p7eFdbiP0+URdDmiSNill8SCLY/srCs2Aw=
X-Google-Smtp-Source: ABdhPJxXUXVbuY/S0+eUdx9Jy7dDg6OwFBF4ottxP9khsQRYlS+5mKLCtGW6GfO14olLjV0pGBNpwDDO3MhCt6eD3L0=
X-Received: by 2002:a9d:741a:: with SMTP id n26mr1184259otk.210.1612477313315; 
 Thu, 04 Feb 2021 14:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-14-marcan@marcan.st>
In-Reply-To: <20210204203951.52105-14-marcan@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 4 Feb 2021 23:21:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3NywhXSB9qPLPygZ7rQ8=vahQSWSZtmdOs=7Xw8g=UVg@mail.gmail.com>
Message-ID: <CAK8P3a3NywhXSB9qPLPygZ7rQ8=vahQSWSZtmdOs=7Xw8g=UVg@mail.gmail.com>
Subject: Re: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms
 that require it
To: Hector Martin <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_172155_597251_CA44D439 
X-CRM114-Status: GOOD (  23.55  )
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
Message-ID: <20210204222137.0JiipQGwsr7MeFRQg9oYGnuc701SQbuuZE7t_ED1an8@z>

On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:
>
>     Currently there are three ioremap variants:
>
>     ioremap()
>     ioremap_wc()
>     ioremap_uc() (not normally used on arm64)
>
>     None of these really capture the nGnRE vs nGnRnE distinction. If
>     a new variant is introduced in common code, we'd have to provide
>     a default implementation that falls back to regular ioremap() on
>     other arches. Something like ioremap() vs. ioremap_np() (nonposted)?

The ioport_map() function could be considered a variant of nonposted
I/O, as being nonposted is a requirement for PCI I/O space. It's
a bit weird to overload it here, as I/O space has a number of other
special cases, including a limit for the total size of the address space,
and the assumption that all I/O ports are always mapped into virtual
addresses at boot time.

Are the registers that need nGnRnE all part of a well-defined
physical address range that we could pretend to be I/O space?
Also, is the actual PCI I/O space within this region?

The main advantage here would be that we could reuse the
IORESOURCE_IO bit to signify a register in this area.

Note: I don't actually think this is going to be a good solution, just
throwing it out as another alternative in case everything else ends
up being worse.

> (2) The converse of (1): keep the nGnRE default, but introduce special
>     casing to the OF binding code to use nGnRnE when instructed to do so
>     on these platforms. This means of_iomap() needs changing.

It probably also means changing of_address_to_resource(),
and devm_ioremap_resource().

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
>
> All discussion and additional ideas welcome.

A very simple but ugly hack would be to take one of the high address
bits in phys_addr_t to encode the type, and then pass that through
all the way into the ioremap implementation.

This does have some precedent with the upper bits of the (96-bit)
PCI addresses encoding the type of resource, but it also conflates
the DT representation with the arm64 kernel implementation and
requires extending both in a fairly generic way to do something that
is highly platform specific.

         Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
