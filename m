Return-Path: <SRS0=h8h3=HJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97741C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 08:37:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BED160231
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 08:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BED160231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S0jQ49nwWZF5GGy3+83avBiKW30jTlNerFAGzXIyeoY=; b=yyz+uV4/AlKs7bHc4eYfQGtLj
	lSaL9oVrRfG50cC6whVPsKdZiyfLJt4X3IGmNV2R9baTmdcBzJseaN/Ra6TZE5HRXLsMkAK67/C3b
	YT0o9oVIg3jz87WtWknMo9BaIjSiSc7YNDpW7mwFCYC5Lk6nj/HB7r7Mmtx1HAt16s/UQKM2lbwOK
	1xWcO9R9b0/aRntuhCUVvleZCK3G70Z1I4UUU5FvWC/l0M8/97KC8zEQ7pdBFYxLJRpy+PFRoggrQ
	buKmAYMKrVazu3XzyHslyogr+9M6FGitmwmTbb41Jubp3mHoSZ85hPB0W3wCXjmX3Ssr7yPsVMT5K
	sszNB+bHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8fYM-0001VI-Rl; Sun, 07 Feb 2021 08:36:22 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8fYI-0001Ux-U5
 for linux-arm-kernel@lists.infradead.org; Sun, 07 Feb 2021 08:36:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 3A3F742856;
 Sun,  7 Feb 2021 08:36:14 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-11-marcan@marcan.st> <87h7mpky0f.wl-maz@kernel.org>
 <CAK8P3a0-Qk1WAUaCWeX8Zypphpadan3YAOES9t7LFYBOJkXKog@mail.gmail.com>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 10/18] arm64: Introduce FIQ support
Message-ID: <cb721f28-d5e9-3381-2d04-746c0aa2a0d3@marcan.st>
Date: Sun, 7 Feb 2021 17:36:12 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0-Qk1WAUaCWeX8Zypphpadan3YAOES9t7LFYBOJkXKog@mail.gmail.com>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_033619_250647_FBE139BE 
X-CRM114-Status: GOOD (  18.85  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210207083612.I0ix7Mpkj2HGWIynVVuLJpN-c-92QmpeSOXJzDgjyXg@z>

On 07/02/2021 01.22, Arnd Bergmann wrote:
> * In the fiq handler code, check if normal interrupts were enabled
>    when the fiq hit. Normally they are enabled, so just proceed to
>    handle the timer and ipi directly
> 
> * if irq was disabled, defer the handling by doing a self-ipi
>    through the aic's ipi method, and handle it from there
>    when dealing with the next interrupt once interrupts get
>    enabled.
> 
> This would be similar to the soft-disable feature on powerpc, which
> never actually turns off interrupts from regular kernel code but
> just checks a flag in local_irq_enable that gets set when a
> hardirq happened.

Case #2 seems messy. In AIC, we'd have to either:

* Disable FIQs, and hope that doesn't confuse any save/restore code 
going on, then set a flag and check it in *both* the IRQ and FIQ path 
since either might trigger depending on what happens next, or
* Mask the relevant timer, which we'd then need to make sure does not 
confuse the timer code (Unmask it again when we fire the interrupt? But 
what if the timer code intended to mask it in the interim?)

Neither sounds particularly clean to me... if we had FIQ status masking 
registers this would be more reasonable, but I'm not sure I'd want the 
AIC driver to mess with neither DAIF nor the timer registers. It's bad 
enough that it has to read the latter already (and I hope I can find a 
better way of doing that...).

Plus I don't know if the vector entry code and other scaffolding between 
the vector and the AIC driver would be happy with, effectively, 
recursive interrupts. This could work with a carefully controlled path 
to make sure it doesn't break things, but I'm not so sure about the 
current "just point FIQ and IRQ to the same place" approach here.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
