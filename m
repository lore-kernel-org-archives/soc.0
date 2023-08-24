Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91E4C6FA8F
	for <soc@archiver.kernel.org>; Thu, 24 Aug 2023 11:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 981C2C433C9; Thu, 24 Aug 2023 11:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061C1C433C8;
	Thu, 24 Aug 2023 11:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692875860;
	bh=HWiWA8gsfZEsDUVVd6eiU8MOxOf2rjtHb0k9xkzinCk=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=kED1QtUeIBXIHi6ajPV1kcIVTY+102eSFld7Tjc4s+goUrYt49FOgShSGKEhx8IdI
	 1G8dI7A6pXSZ73KSlBT0opVZdR9XBSU4ov+6tPbL41N7uR4Jd+vlr2eBCe7igDPR8q
	 4xfqaQV7vv6aMjq4pV2PuwjJUCDLO3zdKXgIfbbjHDwJyWXFBZwCb/gbJM3JLFF83+
	 hCQYZOSE4cJAo2faC8FogT5jCQU5hw6BFPJ62mt0dcTmfZG51niSrW6ddqN+o3kGkd
	 pn7VEVfaIoT+IZZJjwZUtja6QKX6bNgp9quX0TyHu2xn7MXASN/gPqjphQ0kC2Ij9Q
	 wPmXj8yA3GUSQ==
Date: Thu, 24 Aug 2023 13:17:36 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann 
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Rob Herring
 <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: add cznic,turris-omnia-mcu
 binding
Message-ID: <20230824131736.067c40e2@dellmb>
In-Reply-To: <5dfbdffa-7460-d1df-b821-63231fb7af66@kernel.org>
References: <20230823161012.6986-1-kabel@kernel.org>
	<20230823161012.6986-2-kabel@kernel.org>
	<7213dd0d-5783-cda7-6d49-8bf442e81921@kernel.org>
	<20230824100349.2d0080d8@dellmb>
	<5dfbdffa-7460-d1df-b821-63231fb7af66@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Aug 2023 10:23:27 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> You replied only to me. Instead please reply-to-all to keep discussions
> public.

Sorry about that, I've redirected the messages to the other people.

> >>> +++ b/Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml    
> >>
> >> ARM directory is only for top-level bindings, so this should go to soc.  
> > 
> > Hmm. The board uses a marvell SoC, but the board is from CZ.NIC (who
> > does not create its own SoCs). So should this go into soc/marvell or
> > soc/cznic?  
> 
> Indeed and it is a dedicated MCU (some Cortex-M or similar, right?), so
> maybe arm is suitable at the end.

There are three Cortex-M options (M0, M0+ or M3, from STM, NXP or
GigaDevice), depending on the board revision.

The bindings/arm already contain for example amazon,al.yaml, which is
platform binding (not SoC).

So I guess I will stick with bindings/arm, unless someone suggests
something else.

> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/interrupt-controller/irq.h>
> >>> +
> >>> +    ic: interrupt-controller {
> >>> +        interrupt-controller;
> >>> +        #interrupt-cells = <2>;
> >>> +    };    
> >>
> >> Drop this node, not relevant.  
> > 
> > Will the binding example compile without the ic node if the
> > system-controller below uses it?  
> 
> Yes.

OK

> >>> +            interrupt-parent = <&ic>;
> >>> +            interrupts = <11 IRQ_TYPE_NONE>;    
> >>
> >> Are you sure interrupt is type none?  
> > 
> > The interrupt type is either LEVEL_LOW or EDGE_FALLING, depending on
> > the version of the MCU firmware, so this has to be selected by the
> > driver.
> > 
> > I tried setting LEVEL_LOW, since that is the one that is used by the
> > newest MCU firmware. But then if the firmware is old and I want to
> > select EDGE_FALLING in the driver when requesting the IRQ, it fails
> > with message
> >   type mismatch, failed to map hwirq-%lu for %s!
> > from
> >   kernel/irq/irqdomain.c function irq_create_fwspec_mapping
> > 
> > I guess I can use irqd_set_trigger_type() before requesting the IRQ to
> > avoid this error.
> > 
> > Should I use use LEVEL_LOW in the binding example and device-tree?  
> 
> I guess in such case this NONE is okay

Thx.
