Return-Path: <SRS0=YCAW=FM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74A8C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 23:32:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CD2723AAC
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 23:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CD2723AAC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HwfC/uQ6XzpODz7dtYcD5+XXJwH94yiIH9Cv+S/r4D4=; b=u8VGoOmRESL1veEBVoSoShXmy
	1cyob1G4NmWvBUVKJYrvARrr4d4/6vEtnj+zPcpR1clW+NskkQCPutjO5dCDeqkiOIH/XBlMF0xov
	8C1QmcmTeOP4T72AYk/o8Eb/7/HQqhfr5uL9Wi5UGE9I96WmQnSCl5Nh3si3hEtNN1d3l8Pp56oD4
	z3QZd672XE0MEthnBEpGFHSrfpMWUgTRo2vLE8iFpelHnCCvsjiynvTe+hXJkzymIg1W2/gq45APd
	YvRjUxW7sSS0jFYNBEnZbWm3Ae/lZ65x9B3rMSTaEfeYvwB09k4Vx79zody2Dqx1AgY8nBlmnvKXH
	KJctYc1rQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmmT8-0002nF-1B; Tue, 08 Dec 2020 23:32:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmmT4-0002m9-C6; Tue, 08 Dec 2020 23:32:27 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org
Subject: Re: [GIT PULL] soc: amlogic: driver updates for v5.11
Date: Wed,  9 Dec 2020 00:31:38 +0100
Message-ID: <160747024185.3766805.7396434572354620179.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <7him9ljgtr.fsf@baylibre.com>
References: <7him9ljgtr.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_183226_527636_25F27E14 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208233138.-c7naPnoBt53nfqHaP5q1WIm2fvyY7ETjB1Zdwew1T0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 01 Dec 2020 14:34:56 -0800, Kevin Hilman wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4879de98ca746abfb1a76f8755fb46a37fe42903

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
