Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B04C7619A
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C19CC433EF; Sat, 15 Apr 2023 10:43:27 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35A30C4339C
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35A30C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-94f109b1808so39544266b.1
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555404; x=1684147404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItnFwDfcwsqeS2QehC4MzuWbNu7xUa/nTNiku0cT6q8=;
        b=zeV7LuBrZkIjBK7n40U3u33EVUV8ktgLJgumBB/CXtFsUTLE98GXhp9rXGaDxxWW43
         2bNss8gDD2OxajnwJdmBav5Mu5b1XPqwgfZ5uWfKqjQitDidTummuAQkl6TXF8yJXraT
         HvWlNqhSfodkzfdRLg3dHpK8BRaBopDgLd5NqFCGfr51pA20dGUkWDzW0ON4wto5O1uR
         DVu/3yMRDhAheB6FUP546DdkOM5wG/Pv+zx8pt3s3UzPaHqLR79F4G1ChmT2tNw0ZLWL
         ke3sdlZBqJxrSu2VlZaaX1TBJOMqiuJ4jUxlE9pHJstvOpIcxy+1t2BAwxVZLW1qK2up
         7pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555404; x=1684147404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItnFwDfcwsqeS2QehC4MzuWbNu7xUa/nTNiku0cT6q8=;
        b=WNKallyaeRCcIGX8+WrDc+f3w+W0N0QImqfk3dNzUWYB+z+I2IOr/Vi+RGMjoAJd1v
         6bNnde1zh79YXIbsEVqGHq/uOgZZJkw2Ce0xyjey7cVEnk/rKoh7P1Ibnu2R21tpIAjj
         cK4vI1d8ztjN3wfcGK4ZUY1wB7e1vObK9AhHuM94+L3f+AnSK78BkwR7dfPMeATiFg7c
         BLxA352Vdr+TxwnWoFj4CH6BOmxaa6d+3anUzvjWtAub2OWFYx+uMXkGkis96tv+jzkl
         Hws1nQdRudznADulM9i/YRiqOfPUjJmosf0jKnwoxApSYiwSPD1aKqXX9YqoBpkuzUUG
         1Hxg==
X-Gm-Message-State: AAQBX9cITz9gkYUs/Ai5337c5ayOR8evpqkL+8HPTumoxl1Y8D8hn89P
	vpL7m7jrhgoHn1nYZe/7rZTO+Q==
X-Google-Smtp-Source: AKy350bPRbufNSuY7GUQjKnVdZFyy9yhi/blBYi5kJOs+vNjjp0jCuOVqYlC340a/TPCzmSIT5S1Yw==
X-Received: by 2002:a05:6402:1156:b0:506:8838:45cc with SMTP id g22-20020a056402115600b00506883845ccmr2817127edw.6.1681555404418;
        Sat, 15 Apr 2023 03:43:24 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/15] w1: ds2482: drop unnecessary header
Date: Sat, 15 Apr 2023 12:42:56 +0200
Message-Id: <20230415104304.104134-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linux/delay.h is already included, so drop asm header to also fix
checkpatch:

  WARNING: Use #include <linux/delay.h> instead of <asm/delay.h>

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/masters/ds2482.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
index 90c0a33747db..7e915b71045d 100644
--- a/drivers/w1/masters/ds2482.c
+++ b/drivers/w1/masters/ds2482.c
@@ -15,7 +15,6 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/delay.h>
-#include <asm/delay.h>
 
 #include <linux/w1.h>
 
-- 
2.34.1

