Return-Path: <SRS0=yzNC=EI=robh_at_kernel.org=rob@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB614C3DA66
	for <soc@archiver.kernel.org>; Wed, 23 Aug 2023 16:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 850DAC433C8; Wed, 23 Aug 2023 16:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6312C433C7;
	Wed, 23 Aug 2023 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692809859;
	bh=9pqzRgCnH4DfYz97mncgoNC8MnrSCgZVcFdCaWjI43k=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=luPsH3xUbs/jE9mVEqH5a03ETlmzaY36DeP9zc45jOHR2IhnAfAm1nbJAbEZ397Ob
	 U4L65NTDvbJf0umpvjPb9eVFVEdcs74myoacUjNifE3viTyy5mL62EgCHvXN6x6ACO
	 JwMqVeIbaOimapWct1Bzf5mvvlXLz/e76hqAk/kALm6eQCaiCNwxr2GUKJXYImUhZp
	 3r1t8rOZAzH+86UgiYVBC5m9FGq/MTUb48pILZELPUfkDcAqFZhftC3QMRHZUK1uAU
	 RW/92mC6h0tRFVb5e9pCeI8qOtG7UM748NfV6shsxj4Ov1bIh3y1lEl3G6k3+i3/ef
	 W6XxuH/IKbrPQ==
Received: (nullmailer pid 2467551 invoked by uid 1000);
	Wed, 23 Aug 2023 16:57:37 -0000
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: davinci: Drop unused includes
Date: Wed, 23 Aug 2023 11:56:38 -0500
Message-Id: <20230823165637.2466480-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_platform.h include is not needed, so drop it. It implicitly includes
of.h (for now) which is needed.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Arnd, Here's one more that slipped thru the cracks. Please take 
directly.

v2: Fix subject to be 'davinci' not 'keystone'
---
 arch/arm/mach-davinci/pdata-quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-davinci/pdata-quirks.c b/arch/arm/mach-davinci/pdata-quirks.c
index b8b5f1a5e092..b5b5c7bda61e 100644
--- a/arch/arm/mach-davinci/pdata-quirks.c
+++ b/arch/arm/mach-davinci/pdata-quirks.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2016 BayLibre, Inc
  */
 #include <linux/kernel.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 
 #include <media/i2c/tvp514x.h>
 #include <media/i2c/adv7343.h>
-- 
2.40.1

