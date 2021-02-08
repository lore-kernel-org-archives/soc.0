Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51761C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 16:15:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7AD664E7D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 16:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7AD664E7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fxDQme4oftO1WcJD8VEQInWcADhWCZECA44tFEBzSF0=; b=MonjXdCTW8wSxrgorVNU7Bhfp
	tWCcVSsTcArE4r4A1LGoLMmT3KeyL0aZxP9Jg3TdRiHwEblYAYktc1HSJ3ibSde7su/FQ0pmhBbbT
	WgvBVVSLy9It59WJKTokG1+cbqxWn+Pt3FbFu/YC4suNjTz95U48k4kY6VNHYI5PJB3g+y7d3RGhM
	/d/KqhuO5CaGsCs7VZVO9CQoHFo4ZyFNca3ncJHrlzAUU5GGcSXH2M1pseH6j3/M29oVfyXa3zWIt
	YEQPMBdolWKg0iCLWRgS0KcJlxQgyC3Wm4qfuKntGUD40/ZbAGEvIs8nDjaovakgvDgazUpXNe+Al
	Ah5LCMJUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l99BP-0006Vs-RU; Mon, 08 Feb 2021 16:14:39 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l99BM-0006VO-VW
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 16:14:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id C510B4207F;
 Mon,  8 Feb 2021 16:14:32 +0000 (UTC)
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st> <87lfc1l4lo.wl-maz@kernel.org>
 <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
 <e2bd8f99-58db-4cae-30b3-6fa608bc76dd@marcan.st>
 <20210208093625.trpm3tte2gw24w4l@kozik-lap>
From: Hector Martin <marcan@marcan.st>
Message-ID: <9d395524-7aa9-0c6f-33a8-0cd47f0a7633@marcan.st>
Date: Tue, 9 Feb 2021 01:14:30 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208093625.trpm3tte2gw24w4l@kozik-lap>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_111437_164750_98963DF8 
X-CRM114-Status: GOOD (  15.63  )
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
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org,
 robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208161430.z7sSmAFBPzeh8nhrtl0gVIyXYBinHkCZ0fZcsvEwN8U@z>

On 08/02/2021 18.36, Krzysztof Kozlowski wrote:
> Please use the scripts/get_maintainers.pl to get the list of people to
> Cc. The script would point necessary folks.

I thought I'd try Thomas first since he introduced the IRQF_SHARED 
specifically, but I should've gone straight to maintainers (I did use 
get_maintainers.pl to find you).

> A different issue is that all your emails from this thread were marked
> by Google as spam.  I don't see any particular warning signs in the
> header so it looks more of content-based match for spam.

That's weird. Maybe it's because my server doesn't do DKIM yet, and they 
went through a mailing list? It's probably time to set that up...

>>> Either way, certainly not for Apple SoCs; I'll get rid of IRQF_SHARED
>>> for v2.
> 
> Please send a v2 after fixing issues pointed out by kbuild.

Will do, already have those fixed in my WIP tree.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
