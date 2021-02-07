Return-Path: <SRS0=h8h3=HJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB894C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 09:25:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D0364E43
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 09:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D0364E43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0I8N8kwcF6HDkr/8LAOPu47hZ0rN22trs6hV0zXINz4=; b=ldcdMkpNq4cp+Rjm6rU0NE5OO
	4/1ndZFTL6CVds5L97QtKeW1kGu3ZcJpCuTCtsXTEtBbAv4aM7OAIeRzATvj3o+DowzKok/MO4smP
	B4WMZBuvZpkW8VzorjFmE8f1j7xmcMiqbbqcEcqs4mF/gFIbE0eKM2j6T7Lm3rmaztlRMTraS9w33
	2LOYoiewWdt7J2TwGcCFO/YYP2NXcTHONimwvMs8mFURCGHCKlYTm+NUxrq/fWm9by4y4wBwGYlVZ
	/hU2U043ALXS8IE1dFoiDPd8w2LbuOcP0dEBINdQDcJ4B2sRBgYjyCbvPdnU3cwROoom3iYXTv8qe
	MlU8F+yRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8gI7-0004Rp-HU; Sun, 07 Feb 2021 09:23:39 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8gI4-0004R5-J8
 for linux-arm-kernel@lists.infradead.org; Sun, 07 Feb 2021 09:23:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 58C4142852;
 Sun,  7 Feb 2021 09:23:30 +0000 (UTC)
To: Marc Zyngier <maz@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-12-marcan@marcan.st> <87ft29kxmp.wl-maz@kernel.org>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 11/18] arm64: Kconfig: Require FIQ support for ARCH_APPLE
Message-ID: <860b7dac-ccad-b6c9-c7be-537d6b1c5ede@marcan.st>
Date: Sun, 7 Feb 2021 18:23:28 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87ft29kxmp.wl-maz@kernel.org>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_042336_803622_B0B7BF91 
X-CRM114-Status: GOOD (  16.12  )
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
Message-ID: <20210207092328.zG1Ru6jTV189pRYUtNxDaTUgcmt9p4r7qsaNuZ-ghi8@z>

On 07/02/2021 00.46, Marc Zyngier wrote:
>>   config ARCH_APPLE
>>   	bool "Apple Silicon SoC family"
>>   	select GENERIC_IRQ_CHIP
>> +	select ARM64_FIQ_SUPPORT
> 
> Ah, this is what I was expecting in the previous patch. I guess the
> initial ARCH_APPLE patch could be moved down the line and add all the
> dependencies in one go.

I was trying to introduce the Kconfig before the code that depends on 
it; is it kosher to have it in the other order, looking for CONFIG_ 
defines that don't exist yet?

Though in this case the only user earlier in the series is the Samsung 
stuff, which doesn't care about FIQs, so I can just sort things as 
FIQ->ARCH_APPLE->samsung->AIC...

I'm not sure about AIC vs. ARCH_APPLE though. Right now the pattern is 
that AIC depends on ARCH_APPLE and also defaults to that. But then you 
can build with ARCH_APPLE and AIC disabled if you so choose, which does 
result in a broken system on these machines. AIC should build without 
ARCH_APPLE (as long as we're on ARM64), so we could reverse that.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
