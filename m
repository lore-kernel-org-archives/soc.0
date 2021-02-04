Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F53C433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 22:21:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5B85A64FB2; Thu,  4 Feb 2021 22:21:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C2A764FB0;
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
Received: by mail-ot1-f43.google.com with SMTP id k25so2914805otb.4;
        Thu, 04 Feb 2021 14:21:54 -0800 (PST)
X-Gm-Message-State: AOAM532p5sufwHx049bxzvgfbsPdIUEjBO63xo/Vq9RstiGA4r8YAXVh
	SfeLstkhhWv4Pu6eHE69fFe5n7OcOEzqmpRW7ug=
X-Google-Smtp-Source: ABdhPJxXUXVbuY/S0+eUdx9Jy7dDg6OwFBF4ottxP9khsQRYlS+5mKLCtGW6GfO14olLjV0pGBNpwDDO3MhCt6eD3L0=
X-Received: by 2002:a9d:741a:: with SMTP id n26mr1184259otk.210.1612477313315;
 Thu, 04 Feb 2021 14:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-14-marcan@marcan.st>
In-Reply-To: <20210204203951.52105-14-marcan@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 4 Feb 2021 23:21:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3NywhXSB9qPLPygZ7rQ8=vahQSWSZtmdOs=7Xw8g=UVg@mail.gmail.com>
Message-ID: <CAK8P3a3NywhXSB9qPLPygZ7rQ8=vahQSWSZtmdOs=7Xw8g=UVg@mail.gmail.com>
Subject: Re: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms
 that require it
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

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
