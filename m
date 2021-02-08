Return-Path: <maz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B235C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 12:27:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4592964E7E; Mon,  8 Feb 2021 12:27:47 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1728F64E3F;
	Mon,  8 Feb 2021 12:27:47 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <maz@kernel.org>)
	id 1l95do-00CmEL-QF; Mon, 08 Feb 2021 12:27:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 08 Feb 2021 12:27:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, Arnd Bergmann <arnd@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Olof Johansson
 <olof@lixom.net>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
In-Reply-To: <20210204203951.52105-19-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <a2825482e2f68c2f8cad7cb564414759@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: marcan@marcan.st, soc@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, arnd@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, olof@lixom.net
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On 2021-02-04 20:39, Hector Martin wrote:
> This currently supports:
> 
> * SMP (via spin-tables)
> * AIC IRQs
> * Serial (with earlycon)
> * Framebuffer
> 
> A number of properties are dynamic, and based on system firmware
> decisions that vary from version to version. These are expected
> to be filled in by the loader.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---

[...]

> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_FIQ 1 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>;

This unfortunately doesn't match the binding, which doesn't cater
for systems without a secure physical timer, nor allows the description
of the EL2 virtual timer.

You should also have *different* interrupts for EL1 and EL2 timers,
although this is all a lie...

Looking at the only similar case, XGene lies about the secure timer
(it doesn't have any), and of course doesn't have an EL2 virtual
timer (ARMv8.0 only).

A sensible course of action could be to update the binding to at least:

- tell the kernel that there is no secure physical timer (and that
   the interrupt should be ignored)
- introduce a 5th possible interrupt for the EL2 virtual timer.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
