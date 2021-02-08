Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C32C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 12:07:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 788EE64E7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 12:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 788EE64E7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j404UJI/eBjQ9b6f9neZ5yb0uDWT9c4iTZBeRqBsfH4=; b=cPWOrUqr+sT6KwbnLKXbBiWPL
	39LmtUaBHO+vzKkLT36xtqk9QwGvTo7Fi0VqWRL1+eBTaYfdlzUVb9yqh4O9jqnASHqY4Gv4K7zjT
	W1tCyax3aN1BdBxbLzKf85q7Op40+82S/8PLzNwXEu+gh+LE+p9oKrJGZ+pRpBRoxjp7TGZs0eksn
	M7d/5Ah9N8uRxZbsnkkmyCfYERB/wp/sg4HxIDuXgiVeskd2BGhqUCvSQQNrvuKWy2zESl6Nu3xyo
	A7vwgEIExCfj2yX/CBdspiSUjpeKCmU3Ss9+e0lpUMb+RuecFj51y4QS3a9WMrwnMJ7/n2CGaKhvk
	Qx7dHZNxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l95Io-0005QM-G0; Mon, 08 Feb 2021 12:06:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l95Im-0005Pu-5O
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 12:06:01 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E98D64E60;
 Mon,  8 Feb 2021 12:05:59 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1l95Ii-00Clw4-T8; Mon, 08 Feb 2021 12:05:57 +0000
MIME-Version: 1.0
Date: Mon, 08 Feb 2021 12:05:56 +0000
From: Marc Zyngier <maz@kernel.org>
To: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 11/18] arm64: Kconfig: Require FIQ support for ARCH_APPLE
In-Reply-To: <860b7dac-ccad-b6c9-c7be-537d6b1c5ede@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-12-marcan@marcan.st> <87ft29kxmp.wl-maz@kernel.org>
 <860b7dac-ccad-b6c9-c7be-537d6b1c5ede@marcan.st>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <2a93bf0df74df8cb022e61d69d1de88e@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: marcan@marcan.st, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, arnd@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, olof@lixom.net
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_070600_308335_C19BD723 
X-CRM114-Status: GOOD (  21.25  )
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
Message-ID: <20210208120556.dlnItqkqwvxsreYHI1W8T-BgOmlWKQ6O_Adma8vKu68@z>

On 2021-02-07 09:23, Hector Martin 'marcan' wrote:
> On 07/02/2021 00.46, Marc Zyngier wrote:
>>>   config ARCH_APPLE
>>>   	bool "Apple Silicon SoC family"
>>>   	select GENERIC_IRQ_CHIP
>>> +	select ARM64_FIQ_SUPPORT
>> 
>> Ah, this is what I was expecting in the previous patch. I guess the
>> initial ARCH_APPLE patch could be moved down the line and add all the
>> dependencies in one go.
> 
> I was trying to introduce the Kconfig before the code that depends on
> it; is it kosher to have it in the other order, looking for CONFIG_
> defines that don't exist yet?

Absolutely. The only requirement is to make sure that nothing breaks in
the middle of a series.

> Though in this case the only user earlier in the series is the Samsung
> stuff, which doesn't care about FIQs, so I can just sort things as
> FIQ->ARCH_APPLE->samsung->AIC...

Seems fine to me. Sorting out the infrastructure first (FIQ, memory
attributes) first is a requirement anyway, so the ordering of the
series could reflect that priority.

> I'm not sure about AIC vs. ARCH_APPLE though. Right now the pattern is
> that AIC depends on ARCH_APPLE and also defaults to that. But then you
> can build with ARCH_APPLE and AIC disabled if you so choose, which
> does result in a broken system on these machines. AIC should build
> without ARCH_APPLE (as long as we're on ARM64), so we could reverse
> that.

As long as ARCH_APPLE selects AIC, you can make AIC selectable on
its own. What I'm trying to avoid is people ending up with an unbootable
system, and not having interrupts is one thing that makes it really hard
to debug...

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
