Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35A8C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 15:37:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B2F664DFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 15:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B2F664DFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4LmzG+wKHd2CC3V03nLkD/WT2zc0Al2mHgg0bppKntM=; b=0KZmSTtoiI4NqZRc/WPD4/19M
	X24zJDDMCuNSlg5Xq40q/j4oZG/LN1GE9mYDAkqmuiONU9serAyBbOmBD35dv7vRnR82BWpmcic1/
	upmG78MbKTU4PrKyUyMlsPffwElZcRL6gIjLaI9xpgLVVs0pJIO6DpZ33Lv5WPJ0s9A6Qwo4n0VtO
	ib7ZXaJnuWfj7HdgomORGLTWrmiq03VCznnttkJC+cC2dfD57xMCndImdJr5ccgf5qBXDdq4tUurs
	+UbyTYITBR0roYL+15cwzUe2sw3QHENfbASaomW32LeoU3ByhlEq34HsTD4AAyJULRJ+9/FvG2lZ7
	d42gbspLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l98aH-0003U9-CA; Mon, 08 Feb 2021 15:36:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l98aE-0003Sy-FO
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 15:36:15 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57BA264E30;
 Mon,  8 Feb 2021 15:36:13 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1l98aB-00Cp19-6M; Mon, 08 Feb 2021 15:36:11 +0000
MIME-Version: 1.0
Date: Mon, 08 Feb 2021 15:36:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: Hector Martin <marcan@marcan.st>
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
X-SA-Exim-Rcpt-To: marcan@marcan.st, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, arnd@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, olof@lixom.net
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_103614_898698_7B637679 
X-CRM114-Status: GOOD (  23.68  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208153611.tYk31eNP-T2H6SXRSJnF7VTwBioBFIxHC2bSmWfKkNY@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
