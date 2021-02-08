Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1FCC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 23:18:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E76DE64E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 23:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E76DE64E75
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kqv60ZO85Fdsppdwzv4m0nLqyEjEEbTKSkjZnt+1kDo=; b=bxhZU8TZO4bLsvbSVmMU+hNeF
	E6BU7df2J+tmqYku1HW3KujsG+uHyp+wHJVcYjmPbqBG/rqYrOITXh2Y4xZYcJqnSyG2svOVGYWFH
	5yZlH2KoOqvbRKXW370KnSmxEcsiQvxpcIqBMgaY5+I/JlUxPsROOJsXejPVgWsNm6gnI8Px6cU7u
	sUe/BzANtzur/Jvl5qi9wPGOyPqKpYYE0ZZfU9Vi2PoQLhoQ37PCStNjXeia95n5cJCRHEP8tJxg6
	AZZFPpZlKF49zidHMcNDUEJgTWxVJxPYfJMj12TWebSF6x2KXh8Z0MhcImwT9gUASFo4m/Ax7U7Tp
	bqh4ZeZnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9FmN-0001yw-6u; Mon, 08 Feb 2021 23:17:15 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9FmJ-0001xU-FS
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 23:17:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 562004207F;
 Mon,  8 Feb 2021 23:17:06 +0000 (UTC)
Subject: Re: [PATCH 01/18] dt-bindings: vendor-prefixes: add AAPL prefix
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-2-marcan@marcan.st>
 <20210208102730.p4nhsl35oowsklv2@kozik-lap>
 <20210208173215.GA1567700@robh.at.kernel.org>
 <20210208181248.tbgffdwghlseawic@kozik-lap>
From: Hector Martin <marcan@marcan.st>
Message-ID: <0cbe3536-2415-a2a4-75e6-0e1c6deffd42@marcan.st>
Date: Tue, 9 Feb 2021 08:17:03 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208181248.tbgffdwghlseawic@kozik-lap>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_181711_672084_FF23F2A7 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208231703.0sfmP7j4xs-xRLVvgv5Z71_ozJF9IbEI_Sjcl9bBg2Y@z>

On 09/02/2021 03.12, Krzysztof Kozlowski wrote:
> Mentioned grep brings only one result:
> arch/powerpc/platforms/powermac/pic.c:   * cases where the APPL,interrupts property is completely

You want to grep for 'AAPL', not 'APPL' :-)

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
