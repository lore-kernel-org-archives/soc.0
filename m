Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5DCC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:25:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 964AB610CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 964AB610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TvKCdcW7gNf8uCQxG+H/0YIFooKfOV6U3F/nIoI4fVs=; b=RuavlnTDfUhL0Far1qGRQho0p
	+2lhyvn8yAvvy/1u1YJ3qPJAKcegKyFfO4sm15abiqMoWmA4AK5BXNezce5JGo6GTEPUryfmbPAG1
	W6LBekYe8B59tsIUQjugPAQFkK4KuBFyEeF+Qjznqg7ImE4pgoCfentLFX5Kg40Xj3lTnYQgts0FV
	qkB9oaRVERDRjC4i3IKednKHEWNtHlbDO7kKxBf0PmoZHDujLdhJuo6FaujBEv01342BYgfVBoyrk
	X26lzB8wYvOfF3kpUSWkSMLbosfBz+5OsiaMoApsEMDRWfOmgwoWtQUYURUXfcSVQ8xVP/ScoSsux
	sDUQSM9Rw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRuUl-009CnE-0m; Thu, 01 Apr 2021 10:24:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRuUO-009ChD-Kr
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 10:23:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DC216108B;
 Thu,  1 Apr 2021 10:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272627;
 bh=p8DxaNEWZ0HLWX0VW1k5/nLGYEiaqjcI2GjQOj2jHiU=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=KQSxOJ6ksESDHqBoem712XvTkbELNFErHev103V8KjfBUt9wKT55g49CsCnRie8Zu
 K8P9AEkdflfnGvKUBXPdSqSvdu+qNnE8VgAyEJSdGYrhpretY8FtBR5mCvZ/lyEolt
 iheBNFlaEUH5DeM+ibm1O1Dr+PpU2AiOH3nB66IAtPJADym3UGH2Qvg6jW3R4wBQYl
 6Tl0k5c3yHwvu153cU4DI3OApAQgmxoKMaIBx7AFXp9rMBKnMz3DeqRryxWO4q76g9
 P7IBY54AQbgJK3OAjA8z6N6Vw/x8WG9fr7om0v7yWXlXUGi2fmLtmXxf6qo264cyhR
 slG2siYABu8Yw==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Arnd Bergmann <arnd@kernel.org>, Haojian Zhuang <haojian.zhuang@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@kernel.org
Subject: Re: [PATCH] ARM: pxa: mainstone: avoid -Woverride-init warning
Date: Thu,  1 Apr 2021 12:23:29 +0200
Message-ID: <161727243811.583633.1536328285829233051.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323130849.2362001-1-arnd@kernel.org>
References: <20210323130849.2362001-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_112349_125927_399AEBCF 
X-CRM114-Status: GOOD (  10.99  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210401102329.-4Gyl3RkF1mGCdO770A2sLuYsVM9_cE2CDYFc7unYU4@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 23 Mar 2021 14:08:27 +0100, Arnd Bergmann wrote:
> The default initializer at the start of the array causes a warning
> when building with W=1:
> 
> In file included from arch/arm/mach-pxa/mainstone.c:47:
> arch/arm/mach-pxa/mainstone.h:124:33: error: initialized field overwritten [-Werror=override-init]
>   124 | #define MAINSTONE_IRQ(x)        (MAINSTONE_NR_IRQS + (x))
>       |                                 ^
> arch/arm/mach-pxa/mainstone.h:133:33: note: in expansion of macro 'MAINSTONE_IRQ'
>   133 | #define MAINSTONE_S0_CD_IRQ     MAINSTONE_IRQ(9)
>       |                                 ^~~~~~~~~~~~~
> arch/arm/mach-pxa/mainstone.c:506:15: note: in expansion of macro 'MAINSTONE_S0_CD_IRQ'
>   506 |         [5] = MAINSTONE_S0_CD_IRQ,
>       |               ^~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to arm/fixes.

[1/1] ARM: pxa: mainstone: avoid -Woverride-init warning
      commit: b08f9cc97c8e1be0f06fc6e5d467ed389a4161ff

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
