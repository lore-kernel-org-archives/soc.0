Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8458EC64E7A
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 21:15:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 40AF32076C; Tue,  1 Dec 2020 21:15:37 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 55AA120671;
	Tue,  1 Dec 2020 21:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606857337;
	bh=znM/sTQPgIAnxhrBqsvxKIzLB8RNYZUrv6AQid0YBZQ=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=cl5xf5afXi5De5TWKaA6eevuRBy+iJitYOpl9/kq6F6qNZPOS/spdN10eXc+X/4QH
	 MhkJtS2pDj2SYWu2Ou77X9HEs1GiUzHd2DeFVB98NgSWBI5bz10jD35iZXo8VYmihJ
	 tfuW4tB+yQhU+WRN18DGuOcUebMnm0fJl9PqKf38=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	arm@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC 1/2] MAINTAINERS: correct SoC Git address (formerly: arm-soc)
Date: Tue,  1 Dec 2020 23:15:15 +0200
Message-Id: <20201201211516.24921-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoC Git was moved from arm/arm-soc.git to soc/soc.git.  Correct the
ARM Sub-architectures entry.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b4a53cbf43d..6149066a545e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1494,7 +1494,7 @@ F:	drivers/iommu/io-pgtable-arm*
 ARM SUB-ARCHITECTURES
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	arch/arm/mach-*/
 F:	arch/arm/plat-*/
 
-- 
2.25.1

