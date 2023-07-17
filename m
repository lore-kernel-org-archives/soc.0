Return-Path: <SRS0=Vv+k=DD=robh_at_kernel.org=rob@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5EDC001DE
	for <soc@archiver.kernel.org>; Mon, 17 Jul 2023 23:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8CDCC433C7; Mon, 17 Jul 2023 23:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0730C433C8;
	Mon, 17 Jul 2023 23:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689634856;
	bh=L8ZQ9Ur6SNWSgV6u8t4z+UPhVHEOdzE18wYtjgnrA9s=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=ugTwGr975HQP8FH1W2WzpIC1UAOAfrqE+pF7/B/dzba9nQHvKYOFEgoMQCXLgiQYi
	 f/1Pz9YjCkfJNkQYCqT16ZEvivJKsK3yDffEouQGo0kkJCDl6xSbitNqP71h1SWuID
	 JUdjYfGEi5ehlgySB2m20sX9UzfvTrc8neTTI0GB2sSndTEZ8C1SECtRlGuAsMwTg3
	 D+bxmbrUORRJgd83tbd5RSLfZYVt1N6d4aiSJr3NwYNI+QvEQZcoRKw6IUuOR2nlLZ
	 viHxxnUsSJhD29q9rIfOXbqEgB2YI5ZzS4s9X+guT2+cclGi8fgdvpLo95/sc5/4Dc
	 JC3N1v/B4eZEQ==
Received: (nullmailer pid 3211169 invoked by uid 1000);
	Mon, 17 Jul 2023 22:54:23 -0000
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: spear: Explicitly include correct DT includes
Date: Mon, 17 Jul 2023 16:54:13 -0600
Message-Id: <20230717225414.3210914-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it was merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/mach-spear/spear1340.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-spear/spear1340.c b/arch/arm/mach-spear/spear1340.c
index a391f154eff9..70986ef6c877 100644
--- a/arch/arm/mach-spear/spear1340.c
+++ b/arch/arm/mach-spear/spear1340.c
@@ -10,7 +10,7 @@
 
 #define pr_fmt(fmt) "SPEAr1340: " fmt
 
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <asm/mach/arch.h>
 #include "generic.h"
 
-- 
2.40.1

