Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772EDC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:28:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 337FD22B39
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 337FD22B39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wCT6jx8VK+3CVMAmeSWKLrTe3oP0VOMHic9sy7WVUq0=; b=dAp7/oyxVPaQVCD/PBUrtBwZz
	US7OGW4sgTPcnwmK9PrkgMHVH0nIurapFJ7rsaUjSLIiEla9fJSdT7jr9uy4Ya3R0WK7XjH/tqPNH
	2BnHCNt6nYiJ5V3A2muO05hnjPosuIFs6V2sWPhrTbJ8u2zToRibfCUswqWHttxIAdXEJun6PcWsS
	nTE0spxgVPi16jtoaXqXqZQyh4Agxsc28BvtG/ZRxYH1lT3UDXIIxUwWkkRl/Azjf+JzQFhmGvzNI
	TSDQRQCl8wqmFvqVufmsRRECVkAoJI5UXFX2qCGQaq+dCEcSJNLd7mGAUTrJhlincRL3vdRfBn0/1
	CxZE37wTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn63I-0002s4-HL; Wed, 09 Dec 2020 20:27:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn63E-0002r7-SM
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 20:27:05 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Subject: Re: [GIT PULL 2/4] Update am335x to boot without platform data
Date: Wed,  9 Dec 2020 21:26:56 +0100
Message-ID: <160754553209.2241259.6092930072303562425.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1606806458-694517@atomide.com-2>
References: <pull-1606806458-694517@atomide.com>
 <pull-1606806458-694517@atomide.com-2>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_152705_019613_1CA71587 
X-CRM114-Status: UNSURE (   9.29  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Arnd Bergmann <arnd@arndb.de>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Tero Kristo <t-kristo@ti.com>,
 arm@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209202656.Wqrn83Qamsfj2Wv7Ou-jylIL3e5D7h9DUPKZWqaMD1Y@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 09:18:47 +0200, Tony Lindgren wrote:
> The following changes since commit 57df7e370d2ab83a64c07acd157acfed4169f114:
> 
>   remoteproc/wkup_m3: Use reset control driver if available (2020-11-16 12:57:40 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/genpd-am335x-signed
> 
> [...]

I ended up making a top-level branch "arm/omap-genpd" for the omap
genpd changes, as they touch both code and DT files.

Merged into arm/omap-genpd, thanks!

merge commit: d36edb048f48babb3fbf9a4b249df115b7fab152

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
