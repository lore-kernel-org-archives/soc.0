Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6020C64E7B
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 21:15:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7485321D7A; Tue,  1 Dec 2020 21:15:39 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 918EA21741;
	Tue,  1 Dec 2020 21:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606857339;
	bh=QPtXSCXTRQaNs8AHJTnnRkJXv7nkPZcm6XmY97Dg3dg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CB8p4MtQ3yTvLzkBii3rB+Be7l4TdaNATRUzy8FPls5jglUJ3Rq9fwdadz9MSeUvn
	 LQiQeSXFr39NTZoiuMzw9QrTzbM+itS7KoOXvwwTXgvGGGKnlvGva1VJwtYCXA7N6x
	 0RfwLJnJwsAxsX6ZJjLNXxn3wCjwIK2j+WySMtGw=
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
Subject: [RFC 2/2] MAINTAINERS: add a limited ARM and ARM64 SoC entry
Date: Tue,  1 Dec 2020 23:15:16 +0200
Message-Id: <20201201211516.24921-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201211516.24921-1-krzk@kernel.org>
References: <20201201211516.24921-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is expected for ARM and ARM64 SoC related code to go through
sub-architecture maintainers.  Their addresses were therefore not
documented to push patch traffic through sub-architecture maintainers.

However when patches touch generic code, e.g. multi_v7_defconfig, the
patch might not be picked up by them and instead should go to the SoC
maintainers - Arnd and Olof.

Add a minimal maintainer's entry for SoC covering only Makefile, so it
will not appear on most of submissions (except new devicetree boards).
It will though serve as a documentation and reference for cases when
submitter does not know where to send his SoC-related patches.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6149066a545e..f302983645bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1491,6 +1491,16 @@ F:	Documentation/devicetree/bindings/iommu/arm,smmu*
 F:	drivers/iommu/arm/
 F:	drivers/iommu/io-pgtable-arm*
 
+ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
+M:	Arnd Bergmann <arnd@arndb.de>
+M:	Olof Johansson <olof@lixom.net>
+M:	soc@kernel.org
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
+F:	arch/arm/boot/dts/Makefile
+F:	arch/arm64/boot/dts/Makefile
+
 ARM SUB-ARCHITECTURES
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.25.1

