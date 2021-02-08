Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21C5C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 14:55:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E76B64E27
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 14:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E76B64E27
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qIr6I8I210wajWTrlMOR8b08DxzWckzFkCl2asB0JmY=; b=AMnEnI/8VdC4bnVAzvWxm7Z9+
	eUMtmRwRBTtZNRRVOUnBkc8gRTd9uv5iO00qzXhONElMAKf5/ALrEJRXgvKUnGigY+oVzkvbNOlVD
	dnzvxyY8C1yBdT4nfE2dN/q0gagh9uv+YQ69PMGg+C5kd8gdF+0FBNkAJBEnEgNxDwbcd9vKpWLCE
	FXtKJF5zbbwJtkAo4yjfEAvGv/8mrZx6h5/pfR5PqMmDY9KcbnlfspfF7hqgF1riekRo37rAx6FTo
	ELJFrwmi2qFSXNe/48v0J3uLiBVd6pP0JhhutWLNEezsE7pesFANsrV4twDEUQQ+Qha0QADD2Vgb7
	qUqk3M4Mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l97vP-0001ko-OY; Mon, 08 Feb 2021 14:54:03 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l97vL-0001kF-HM
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 14:54:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id AB4A941F47;
 Mon,  8 Feb 2021 14:53:54 +0000 (UTC)
To: Marc Zyngier <maz@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <a2825482e2f68c2f8cad7cb564414759@kernel.org>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <8d660b1f-cb80-d16c-14e4-2a1c7f5229d1@marcan.st>
Date: Mon, 8 Feb 2021 23:53:52 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a2825482e2f68c2f8cad7cb564414759@kernel.org>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_095400_035930_BB40C9F7 
X-CRM114-Status: GOOD (  19.93  )
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
Message-ID: <20210208145352.vKLQSH5pcfO5U2PIAB5MkS2f-xbaQvxnRlNsMI5nCLE@z>

On 08/02/2021 21.27, Marc Zyngier wrote:
>> +	timer {
>> +		compatible = "arm,armv8-timer";
>> +		interrupt-parent = <&aic>;
>> +		interrupts = <AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>,
>> +				<AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>,
>> +				<AIC_FIQ 1 IRQ_TYPE_LEVEL_HIGH>,
>> +				<AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>;
> 
> This unfortunately doesn't match the binding, which doesn't cater
> for systems without a secure physical timer, nor allows the description
> of the EL2 virtual timer.
> 
> You should also have *different* interrupts for EL1 and EL2 timers,
> although this is all a lie...

Well, we do - now that I confirmed all 4 timers work properly, the AIC 
driver should provide all 4. And ideally I find those EL1 timer mask 
bits and implement them in the aic driver too (for only the virt timers 
that have them and of course need them).

I just found the code in arm_arch_timer that forwards all this stuff to 
the kvm code, so it all makes sense now; if I can wire that up properly, 
heck, KVM might even just work here.

> 
> Looking at the only similar case, XGene lies about the secure timer
> (it doesn't have any), and of course doesn't have an EL2 virtual
> timer (ARMv8.0 only).
> 
> A sensible course of action could be to update the binding to at least:
> 
> - tell the kernel that there is no secure physical timer (and that
>     the interrupt should be ignored)
> - introduce a 5th possible interrupt for the EL2 virtual timer.

Sounds like I should be introducing interrupt-names support into this 
driver and using that, so we can just not specify IRQs that don't exist, 
instead of the hack with dummies. Falling back to indexes of course, to 
keep DT compat. i.e.

const char *names = {"phys-secure", "phys", "virt", "hyp-phys", "hyp-virt"};

bool has_names = of_property_read_bool(..., "interrupt-names");

for (each irq)
	if (has_names) foo = of_irq_get_byname(..., names[i])
	else foo = of_irq_get(..., i)

That said, is there a use case for the EL2 virtual timer? The driver 
always uses the EL2 physical timer with VHE right now. I guess it's 
worth describing it in the binding and dts, even if the driver never 
selects it...?

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
