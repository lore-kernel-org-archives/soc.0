Return-Path: <maz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9745C433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 15:36:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8663464E60; Mon,  8 Feb 2021 15:36:13 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 57BA264E30;
	Mon,  8 Feb 2021 15:36:13 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <maz@kernel.org>)
	id 1l98aB-00Cp19-6M; Mon, 08 Feb 2021 15:36:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 08 Feb 2021 15:36:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, Arnd Bergmann <arnd@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Olof Johansson
 <olof@lixom.net>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
In-Reply-To: <8d660b1f-cb80-d16c-14e4-2a1c7f5229d1@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <a2825482e2f68c2f8cad7cb564414759@kernel.org>
 <8d660b1f-cb80-d16c-14e4-2a1c7f5229d1@marcan.st>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <2c7cd2cba55f5e454bafa85f56ce9fb4@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: marcan@marcan.st, soc@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, arnd@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, olof@lixom.net
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On 2021-02-08 14:53, Hector Martin wrote:
> On 08/02/2021 21.27, Marc Zyngier wrote:
>>> +	timer {
>>> +		compatible = "arm,armv8-timer";
>>> +		interrupt-parent = <&aic>;
>>> +		interrupts = <AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>,
>>> +				<AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>,
>>> +				<AIC_FIQ 1 IRQ_TYPE_LEVEL_HIGH>,
>>> +				<AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>;
>> 
>> This unfortunately doesn't match the binding, which doesn't cater
>> for systems without a secure physical timer, nor allows the 
>> description
>> of the EL2 virtual timer.
>> 
>> You should also have *different* interrupts for EL1 and EL2 timers,
>> although this is all a lie...
> 
> Well, we do - now that I confirmed all 4 timers work properly, the AIC
> driver should provide all 4. And ideally I find those EL1 timer mask
> bits and implement them in the aic driver too (for only the virt
> timers that have them and of course need them).
> 
> I just found the code in arm_arch_timer that forwards all this stuff
> to the kvm code, so it all makes sense now; if I can wire that up
> properly, heck, KVM might even just work here.

There is a bunch of other things to do to enable KVM, specially the
GICv3 emulation, but I've now started refactoring that part of the
code not to rely on a full blown CPU interface. Hopefully I'll have
something for the 5.13 time frame.

> 
>> 
>> Looking at the only similar case, XGene lies about the secure timer
>> (it doesn't have any), and of course doesn't have an EL2 virtual
>> timer (ARMv8.0 only).
>> 
>> A sensible course of action could be to update the binding to at 
>> least:
>> 
>> - tell the kernel that there is no secure physical timer (and that
>>     the interrupt should be ignored)
>> - introduce a 5th possible interrupt for the EL2 virtual timer.
> 
> Sounds like I should be introducing interrupt-names support into this
> driver and using that, so we can just not specify IRQs that don't
> exist, instead of the hack with dummies. Falling back to indexes of
> course, to keep DT compat. i.e.
> 
> const char *names = {"phys-secure", "phys", "virt", "hyp-phys", 
> "hyp-virt"};
> 
> bool has_names = of_property_read_bool(..., "interrupt-names");
> 
> for (each irq)
> 	if (has_names) foo = of_irq_get_byname(..., names[i])
> 	else foo = of_irq_get(..., i)

Yup, that definitely looks like a good thing to introduce.

> That said, is there a use case for the EL2 virtual timer? The driver
> always uses the EL2 physical timer with VHE right now. I guess it's
> worth describing it in the binding and dts, even if the driver never
> selects it...?

Linux doesn't have a use for the EL2 virtual timer yet. It was only
introduced for symmetry with EL1 (except for CNTVOFF of course).
But it definitely is worth describing it. Who knows, we may find a use
for it at some point, and other OSes are using the same DT binding 
anway.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
