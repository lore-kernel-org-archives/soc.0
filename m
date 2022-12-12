Return-Path: <SRS0=/5Jt=4K=bootlin.com=alexandre.belloni@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980A0C4332F
	for <soc@archiver.kernel.org>; Mon, 12 Dec 2022 14:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6345FC433D2; Mon, 12 Dec 2022 14:00:12 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7B96C433EF
	for <soc@kernel.org>; Mon, 12 Dec 2022 14:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7B96C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 71AA1240002;
	Mon, 12 Dec 2022 13:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670853602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6CCT62JP1C7U0DXDZAyRviDx98X4et9QFWwKWnF20lc=;
	b=YOtdqWzKck5OZMbcQ9aP/uxsYRnLTBIXwOtt+slHAC2/unQFuKKcmdYGWHWrS5woIrdGjD
	cVYzU9QpS75uZxlwfvpD1gC07kzYpIc6CG67c1hOzioQkK7caaFClKF/JWXsTNFyZwXEyT
	xkGr5R8DdDbjN2JehiLJjmNK4STKSaKtkBCzypqPbe4szvR+wjDh0YIgR7uOe0MDho0bDy
	lHufuQdNJKBoVLtgifryOalPAmmPOOb7snbvq2gmrX40qcYQTaK698ZW3pvOGK9ye+io5k
	+/OOkOjh+lIHgKdO/66vb/MSLRRpGMf7T75xdUw902Tr3eZtXK0M8SdLpyq0OA==
From: alexandre.belloni@bootlin.com
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: footbridge: drop unnecessary inclusion
Date: Mon, 12 Dec 2022 14:59:52 +0100
Message-Id: <20221212135953.212303-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

isa-rtc.c doesn't use any definition from bcd.h, remove its inclusion

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 arch/arm/mach-footbridge/isa-rtc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-footbridge/isa-rtc.c b/arch/arm/mach-footbridge/isa-rtc.c
index b8f741a3a37e..237b828dd2f1 100644
--- a/arch/arm/mach-footbridge/isa-rtc.c
+++ b/arch/arm/mach-footbridge/isa-rtc.c
@@ -20,7 +20,6 @@
 
 #include <linux/init.h>
 #include <linux/mc146818rtc.h>
-#include <linux/bcd.h>
 #include <linux/io.h>
 
 #include "common.h"
-- 
2.38.1

