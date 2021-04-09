Return-Path: <SRS0=z3Z6=JG=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118D0C433ED
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 16:37:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DE5E06054E; Fri,  9 Apr 2021 16:37:27 +0000 (UTC)
X-Greylist: delayed 63 seconds by postgrey-1.34 at mail.kernel.org; Fri, 09 Apr 2021 16:37:27 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87873600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=hayashi.kunihiko@socionext.com
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by mail.kernel.org (Postfix) with ESMTP id 87873600EF;
	Fri,  9 Apr 2021 16:37:27 +0000 (UTC)
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 10 Apr 2021 01:36:23 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 9C05E2059035;
	Sat, 10 Apr 2021 01:36:23 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Sat, 10 Apr 2021 01:36:23 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 2E3A4B1D40;
	Sat, 10 Apr 2021 01:36:23 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	soc@kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH RESEND] MAINTAINERS: Update ARM/UniPhier SoCs maintainers and status
Date: Sat, 10 Apr 2021 01:36:11 +0900
Message-Id: <1617986171-20346-1-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4

Mark the UniPhier platform maintained and Masami Hiramatsu and
Kunihiko Hayashi are taking over maintainership of the UniPhier platform.

Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ab84c09..65279ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2643,8 +2643,10 @@ F:	drivers/pinctrl/visconti/
 N:	visconti
 
 ARM/UNIPHIER ARCHITECTURE
+M:	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
+M:	Masami Hiramatsu <mhiramat@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Orphan
+S:	Maintained
 F:	Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
 F:	Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
 F:	Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
-- 
2.7.4

