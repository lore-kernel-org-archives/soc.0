Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CB1C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 12:28:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FAF264E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 12:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FAF264E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O+XMxTJ5drLa8uS8obGOyzmJF3OGwQxYTvTOagHvsyo=; b=BRWulkrc4C3w+rP04mMBqe2a9
	OId5Sy41Y3G+0MtNfG1Sp1pC2skPUJzW/JxUPgQhcHfXyosvSc/R0F8GWpFyR8jRsvSC7hVxHXmB4
	EFPvcDXlWatC0l4mGha/DGG1xEiihGcii/wKPRiTkXEFz+u6fBISiyRxjFQC/rbauPGvAs/RswFfA
	cDOpkKWEc42GT4TNKNZz6Sy80lrCFRcMjaawAMemtQXBDLzEOcgspAp7Zo0NIWQ5QzqUN3+BHqiH4
	A7d6qkRaW1GAqMXlZM73ErhkVzBUOTBiksPkK6qZt3pnZW02KlWAhyIXDmAuF2TglJT2Bsx00Ev0V
	Dg2uR7XAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l95du-0000f4-S8; Mon, 08 Feb 2021 12:27:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l95ds-0000ef-IS
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 12:27:49 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1728F64E3F;
 Mon,  8 Feb 2021 12:27:47 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1l95do-00CmEL-QF; Mon, 08 Feb 2021 12:27:44 +0000
MIME-Version: 1.0
Date: Mon, 08 Feb 2021 12:27:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
In-Reply-To: <20210204203951.52105-19-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <a2825482e2f68c2f8cad7cb564414759@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: marcan@marcan.st, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, arnd@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, olof@lixom.net
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_072748_736424_7D9853AB 
X-CRM114-Status: GOOD (  13.61  )
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
Message-ID: <20210208122744.CK2u33dnf7Sbg97oT7o-1ngg-HZAbEyOWCJ1RZSrJGk@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
