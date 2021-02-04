Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC76FC433E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:42:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 527F664F67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 527F664F67
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GYDw9EBSHayzQES4Ae10LQV4mNhWV4G0Ow29DE3DCg4=; b=mF9PTDSkOZV5gBVsHTQ/WNZhQ
	oXz3tYRWXY6bnPuFeaXnzWFgZIQZvkpQSGQPwhbbdZItLXnfBxS8ju7XZXUDKeScJrTEcf0OwnCPF
	xCyvpeiBeYk2ntvyOMRI9d8/ykqinZXheg/4R/1PWT9rkNqmOi/54rwYq42xq5iRevaCUl5C2rTE7
	yzZUL5cUU5Ed7ynSZ86hm/ch0py7Zqye73RqMAC+4CDomQanhKHDFaIIDMt+bipZu+dRQjFvs2lxt
	vPLqw9/3ZiaBzbhpGClGqqmRlQhknk5qhgMLeTN6/qhhIGMwpV1vhWZf9AUslc16zatesbCqOCmtw
	cbrKUwZZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7lQV-0007tA-4I; Thu, 04 Feb 2021 20:40:31 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7lQN-0007rR-Ix
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 20:40:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id D4BB84283E;
 Thu,  4 Feb 2021 20:40:19 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: Hector Martin <marcan@marcan.st>,
	soc@kernel.org
Subject: [PATCH 04/18] arm64: Kconfig: Introduce CONFIG_ARCH_APPLE
Date: Fri,  5 Feb 2021 05:39:37 +0900
Message-Id: <20210204203951.52105-5-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_154025_373619_DFD6BE07 
X-CRM114-Status: UNSURE (   9.47  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This adds a Kconfig option to toggle support for Apple ARM SoCs.
At this time this targets the M1 and later "Apple Silicon" Mac SoCs.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 arch/arm64/Kconfig.platforms | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6eecdef538bd..e3e3bd2c4374 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -29,6 +29,13 @@ config ARCH_ALPINE
 	  This enables support for the Annapurna Labs Alpine
 	  Soc family.
 
+config ARCH_APPLE
+	bool "Apple Silicon SoC family"
+	select GENERIC_IRQ_CHIP
+	help
+	  This enables support for Apple's in-house ARM SoC family, starting
+	  with the Apple M1.
+
 config ARCH_BCM2835
 	bool "Broadcom BCM2835 family"
 	select TIMER_OF
-- 
2.30.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
