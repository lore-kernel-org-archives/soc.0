Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F18C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 15:52:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A7864DC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 15:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02A7864DC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e6IbVkZJCltSLiEgvFsWcA4or+dUPB7ayFjEScs0iN8=; b=r0o2Sh73XyxiAe9s5lyKaooNp
	ck0vMcKoxsew+d9AXY3Vse+fjaZOUpJ7X/Wn7iaCR4amKxwMmFOSHQ8ywlSrCacJjqKiR+6I2Lq4Z
	1yKeQUxiUrUgsxTqTzKjzwiN+1/rc84PdvT2O7F1AED9wis9+9lT1r3aE163cEFm28d528/M3Jg82
	xBI4iQLnmlM4QlbAVA37gKf8Xbd95GC2O+rjeCvgaZL8T2H0ePU5Iy+e1c+lTPVxOWBvafxjiIUg5
	g14au41tkSXWLYNTdcW9lMkXBbxBE75U+gv+TPRC+QbeoZqMd5ZNkeOPmeFW31pR6x5qJNBSLFmaJ
	r6a4tg6CQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l98oo-0004kv-OQ; Mon, 08 Feb 2021 15:51:18 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l98ol-0004kO-CS
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 15:51:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id DE5D94207F;
 Mon,  8 Feb 2021 15:51:11 +0000 (UTC)
Subject: Re: [PATCH 08/18] arm64: cpufeature: Add a feature for FIQ support
To: Marc Zyngier <maz@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-9-marcan@marcan.st> <87im75l2lp.wl-maz@kernel.org>
 <d110504f-2461-8b41-72cc-72681d775a97@marcan.st>
 <87czxalrwc.wl-maz@kernel.org>
From: Hector Martin <marcan@marcan.st>
Message-ID: <271fc761-d782-31b8-d97b-907041f15289@marcan.st>
Date: Tue, 9 Feb 2021 00:51:09 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87czxalrwc.wl-maz@kernel.org>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_105115_585910_558AA50F 
X-CRM114-Status: GOOD (  13.99  )
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
Message-ID: <20210208155109.Y1MwEdJR3b4jScF5Xy03eVZaSuZNbI7iMlg6PCuV1kg@z>

On 08/02/2021 20.29, Marc Zyngier wrote:
> I'm not sure we want to trust the FW on that particular front (no
> offence intended...;-).

Hey, I don't even *use* the timers IRQs; if they are unmasked it's 
iBoot's fault! :-)

> That is my current take on this patch. Nothing in the arm64 kernel
> expects a FIQ today, so *when* a FIQ fires is pretty much irrelevant,
> as long as we handle it properly (panic). Keeping the two bits in sync
> is trivial, and shouldn't carry material overhead.

Sounds good then, and again that simplifies a ton of stuff. Will go for 
that in v2.

> Aside from the lack of programmable priority, the lack of convenient
> masking for per-CPU interrupts is a bit of an issue...

Yeah... we'll see how that goes.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
