Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E083FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 15:49:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EDB664DAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 15:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EDB664DAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PW03LxE7hcdl1Ubt56lc3xF8sGZQ4eqe0O8IHEqnwfE=; b=YBn2DtqO6ozJPieEC3VWkSXhQ
	YEdMLBdDqo95FCcOX7ny5Q63G6KcWH/q6DjvBZS2V5vQya+U59k+40cRGIJxGayjvFei/fuWloBZM
	XcBdrU/1FUb0XihffA0SwCL5nkMCmxd33iDPzZTrKK4CFU1T1Jx9urCJ1kKtlV7fUOPjn27LaMBvM
	nfab1vRRxjMQ/O5Zy/QaeborIWegZHo1uG8leXMkpujQWLFKiPWHS/O7wfsSZ9TaSBKNi1sVuZpk+
	rrPRpC/pWhTnMC894JnHVaApHhLUjsL7Bl3FqO72OM6vx/1y+yc+0cojhBK4a05To6snMMpjyt3Q0
	RE/MUDBZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l98ls-0004UI-Fc; Mon, 08 Feb 2021 15:48:16 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l98lq-0004Tk-0q
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 15:48:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 9F3BA4207F;
 Mon,  8 Feb 2021 15:48:07 +0000 (UTC)
Subject: Re: [PATCH 11/18] arm64: Kconfig: Require FIQ support for ARCH_APPLE
To: Marc Zyngier <maz@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-12-marcan@marcan.st> <87ft29kxmp.wl-maz@kernel.org>
 <860b7dac-ccad-b6c9-c7be-537d6b1c5ede@marcan.st>
 <2a93bf0df74df8cb022e61d69d1de88e@kernel.org>
From: Hector Martin <marcan@marcan.st>
Message-ID: <4ed0001c-2196-5e54-9de0-e77236b2a306@marcan.st>
Date: Tue, 9 Feb 2021 00:48:05 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2a93bf0df74df8cb022e61d69d1de88e@kernel.org>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_104814_186768_2792BCAB 
X-CRM114-Status: GOOD (  19.04  )
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
Message-ID: <20210208154805.qysE08Yz1Lapcdi5TmKLxLC4zYlWuVI1JFNakxvixa8@z>

On 08/02/2021 21.05, Marc Zyngier wrote:
>> I was trying to introduce the Kconfig before the code that depends on
>> it; is it kosher to have it in the other order, looking for CONFIG_
>> defines that don't exist yet?
> 
> Absolutely. The only requirement is to make sure that nothing breaks in
> the middle of a series.
> 
>> Though in this case the only user earlier in the series is the Samsung
>> stuff, which doesn't care about FIQs, so I can just sort things as
>> FIQ->ARCH_APPLE->samsung->AIC...
> 
> Seems fine to me. Sorting out the infrastructure first (FIQ, memory
> attributes) first is a requirement anyway, so the ordering of the
> series could reflect that priority.

Cool, that simplifies things.

>> I'm not sure about AIC vs. ARCH_APPLE though. Right now the pattern is
>> that AIC depends on ARCH_APPLE and also defaults to that. But then you
>> can build with ARCH_APPLE and AIC disabled if you so choose, which
>> does result in a broken system on these machines. AIC should build
>> without ARCH_APPLE (as long as we're on ARM64), so we could reverse
>> that.
> 
> As long as ARCH_APPLE selects AIC, you can make AIC selectable on
> its own. What I'm trying to avoid is people ending up with an unbootable
> system, and not having interrupts is one thing that makes it really hard
> to debug...

Sounds good, I'll flip it over.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
