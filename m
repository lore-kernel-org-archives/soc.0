Return-Path: <SRS0=wOK4=NP=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879D5C27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 06:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61935C4AF1A; Thu, 13 Jun 2024 06:46:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6750BC2BBFC
	for <soc@kernel.org>; Thu, 13 Jun 2024 06:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6750BC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-421798185f0so6405305e9.1
        for <soc@kernel.org>; Wed, 12 Jun 2024 23:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718261180; x=1718865980; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=waNyTEPgy/lTEeAKDYdYzjE9nxyt3V6KWTzJ9QI6IOw=;
        b=Qf0kAgMC0wQb4YzhJGTZ/1axC7fGOdkVZkaLpeurvkw3qSp8aC8eVd0XnaHpm1DzOX
         SGvm062fLmHv20B1giy21/92LBqNMnKOat0xIYxjceRIEpNBljHoExO/c1bGs1NR4YDm
         fYUPkV8EEcJSQSi2cqvMFiMqH74nPawGHY685LMsR+NI2y6VKhP2KL8peVRk6/Nu0AlB
         olBX9KPuO7eWqTB4BWF6MUaPDr7lFkCnkx1SqCkK+8ON4gDunbHbuxbDMbPBNxgqmVDL
         ZkHq72QG49L+9hQ4td9BOjK2LgkhclFw1TxBZ3KK8qHefHoDzIX7EdMPXUS8le53gmCW
         Z3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718261180; x=1718865980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=waNyTEPgy/lTEeAKDYdYzjE9nxyt3V6KWTzJ9QI6IOw=;
        b=QOSzZP1LaWbMRUIGZfb4bVcuAfM9zyopEo3dEcgCQp4iCrYdBK4gUqxpWZdl+agNgp
         5dorSLR/OSkqgX/kDh+8Rq1rK/QCp7QMEwRnAACtphqUNfmbvNZ7/OP4nGY5RoLZtdXv
         H3ErUHACCQbOgRfvHZ647qWAIR/sLWc3f+4GD40lDGu3PbHPqyKvOEv5ItYrOIGuiJXO
         Gbj1BU/on4VdJ7OnbLI9WBdx/gOMIqTGaEmThSJDti/Mip/P7DZW9ZcqAPHIi0tmWvy3
         nkrQYa48x0VtDx8WM2DbaENRKP2/sLFdNarYXmcWELvsAyuzl5pDbzOWiot9IT9wU/be
         Mn3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiZn1QcbfLDMyawrPoIiNTMktheoyph7uuhtRjeWjjGBXVcN9p1JezQZazgZhbDj+ZpnI4W6ituiBlBxYhhw==
X-Gm-Message-State: AOJu0YweBnQvhXZHmG5M3XyuZXhStRw3G5uhr/YU2zZiV7uC0jnshkC3
	+jGFsN1QPevO6/V1KTDqPCJGTXHPYNdyieUa85ApjT7nOxi/LUka4CT9ir9pAWO+XtD9Vd+zouc
	i
X-Google-Smtp-Source: AGHT+IEMTAQD2F6lU9xN06fCFvo2d2TgXP107tWu/Kg76ffJSk29u7VUOkWKWUaQrQZ8NZ7/0IvxJQ==
X-Received: by 2002:a05:600c:4f02:b0:421:65a2:d84d with SMTP id 5b1f17b1804b1-422866bdaddmr31850525e9.29.1718261179754;
        Wed, 12 Jun 2024 23:46:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42284b095bcsm32291065e9.0.2024.06.12.23.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 23:46:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] MAINTAINERS: ARM: vt8500: add Alexey and Krzysztof as maintainers
Date: Thu, 13 Jun 2024 08:46:12 +0200
Message-ID: <20240613064612.8589-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ARM VIA/WonderMedia VT8500 platform became orphaned in
commit 8f1b7ba55c61 ("MAINTAINERS: ARM/VT8500, remove defunct e-mail")
and clearly it is on the way out of the kernel.  However few folks send
patches to it and it is nice to actually take them, till the platform is
in the kernel.

Alexey Charkov still has VT8500 hardware and plans to work on upstream,
so add Alexey as the maintainer.  Krzysztof will collect patches.

Extend the maintainer entry to cover also VT8500 DTS.

Cc: Alexey Charkov <alchark@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2
1. Add Alexey.

Cc: linux-arm-kernel@lists.infradead.org
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a472f48656a5..fb32a2fe3a79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3126,9 +3126,12 @@ W:	http://www.armlinux.org.uk/
 F:	arch/arm/vfp/
 
 ARM/VT8500 ARM ARCHITECTURE
+M:	Alexey Charkov <alchark@gmail.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Orphan
+S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c
 F:	drivers/i2c/busses/i2c-viai2c-wmt.c
-- 
2.43.0

