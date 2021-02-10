Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051FCC433E0
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 17:23:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C3E1964EBC; Wed, 10 Feb 2021 17:23:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FE8E64DE3;
	Wed, 10 Feb 2021 17:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612977793;
	bh=8GU9DVtt/5bde9Q4EVBFu3ii3pwB0bk2nJKprnW4oJs=;
	h=From:List-Id:To:Subject:Date:From;
	b=WX69UVuOne21ABCZWN8YNi/Qrp0d9qxI1FYS4ziKRO0xjTqDrd9GSAziM1SPRR18D
	 cN63YoL3O0mHRghItnYdw+DzMLI297BrwZcg6c/8K0gerlF1bgDJzSrZd3HvENOVFa
	 H0kYusJAMXoecWpN/xMG2CH0XXWMtlVo/z0gW9cx4svgYjeDTgcFyuZp4j75BgaBRJ
	 erN2O36boqTwPtZBW22od70PZExDXM6l8tJnK5iVWO6H/O1+ywEXVxiUWmMRpdbH8j
	 /77yEjHG/9uOrBOTWp6eSz/qInx1JHBfroohxIGjy7PLmwfj2W/D+Uu/0AgmLCfCGp
	 n7n7Y3Ht3lHjg==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: arm: samsung: include S3C headers in platform entry
Date: Wed, 10 Feb 2021 18:23:03 +0100
Message-Id: <20210210172303.335268-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several S3C24xx/S3C64xx headers in include/linux are not caught by
Samsung S3C/S5P/Exynos maintainer entry and might look like abandoned.
Include them in "ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
entry.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68e2b4cb4788..5f7aa507b812 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2383,6 +2383,8 @@ F:	drivers/*/*s5pv210*
 F:	drivers/memory/samsung/
 F:	drivers/soc/samsung/
 F:	drivers/tty/serial/samsung*
+F:	include/linux/platform_data/*s3c*
+F:	include/linux/serial_s3c.h
 F:	include/linux/soc/samsung/
 N:	exynos
 N:	s3c2410
-- 
2.25.1

