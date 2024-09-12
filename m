Return-Path: <SRS0=6lXu=QK=gmail.com=alexander.sverdlin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE44EED60E
	for <soc@archiver.kernel.org>; Thu, 12 Sep 2024 14:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 047C2C4CEC4; Thu, 12 Sep 2024 14:49:13 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21E0BC4CEC3
	for <soc@kernel.org>; Thu, 12 Sep 2024 14:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21E0BC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8d64b27c45so168166966b.3
        for <soc@kernel.org>; Thu, 12 Sep 2024 07:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726152550; x=1726757350; darn=kernel.org;
        h=user-agent:mime-version:message-id:cc:to:subject:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/mI+z55kCx1KndQZOmeZl0eyn7TLNxfxyGQZqGu0dOc=;
        b=mWybohKP31GEs0Zp3pgz3JNIqoG+WZxWWMsCfsTJBqIHJ7FuxLvmjPc2LqJjICbh9p
         /W9aU4RPt0U5NuguqLsWWV3r+E4mU/l/rRtFloYerK2k2gFXRYPhrsEgaEbAP/qYc1BM
         2KEOABhkVxZTfB+Svm8bRtujDbimcYdwukbE+/ZcyUZnO+29d91FcJBpRlanphSwFiiz
         0AKI8sK2PO/Qw37oJ3okhZLLz66a3r9QSrPM9xZFItEuW4H97XAUUOlnx95+ynKBCwJ2
         x8cJZf8KdCwq3CdiW9RZjbwF74DvgokR/nxYrEh8qjqvAaeVVx4z1/9HdoJnxwdAyOw2
         IvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726152550; x=1726757350;
        h=user-agent:mime-version:message-id:cc:to:subject:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/mI+z55kCx1KndQZOmeZl0eyn7TLNxfxyGQZqGu0dOc=;
        b=vfUOD2iQD64aHM1obWKHvbomXN3V+6UPJyL1FeMYEcfE51p584Q+BD+27hjwc0VwRN
         cqv7VrwCYAvjCtpLh+2C8xinUtwP2Hjco/Qdt/M73jQiIrBBNsCEEPOEIebClTMk/dVm
         pgGYDnOY1NOHdGEqqVhzRqF+JTjdOgpmgMlHGpjA3AIkMW+WYRqvqtZJV8lyarqSltsp
         w06Rm+xDa+WKUCoJxXyNBXdRi/CwlFhWZH3aeFa3eLnCQ9QVkLddkJ35AmghK6Ir9k9y
         3wvbl6FrZLpNjv3RyMZByTM5vmyvxzTjp9wlI6/lAFpVCDsM9Q+5qnsf/d8vJ7JRb8AE
         JMCg==
X-Gm-Message-State: AOJu0YwnowOCpa/2X0UI5+ZgRT1oxzKaOa6Ppuq1VL4IXkoaP+aKnPdK
	VMMixoSmBxo9M8szvLsWKUWNAjmViwvwiNi5lcR+QqV8Qd+CrHl6Av6ZDA==
X-Google-Smtp-Source: AGHT+IGK/2lzat1JNTjO/8CeM3ri3aHbpupfDnRkvW450uDgb5zbq2xDTjxNMVEw8WkibjYnDpvzeQ==
X-Received: by 2002:a17:907:f717:b0:a89:f5f6:395 with SMTP id a640c23a62f3a-a902940804dmr309955366b.1.1726152549769;
        Thu, 12 Sep 2024 07:49:09 -0700 (PDT)
Received: from giga-mm-1.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25833887sm757667966b.28.2024.09.12.07.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 07:49:09 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Thu, 12 Sep 2024 16:21:06 +0200
Subject: [PATCH] dmaengine: cirrus: use snprintf() to calm down gcc 13.3.0
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Nikita Shubin <nikita.shubin@maquefel.me>
Message-ID: <b1f03ac53b358c135516bec98e626c98aee9d867.camel@gmail.com>
MIME-Version: 1.0
User-Agent: Evolution 3.52.4 

Even though it's a false positive (highest channel number is "9"), refer to
"struct ep93xx_edma_data edma_m2p", we can avoid new warning by using
snprintf().

   drivers/dma/ep93xx_dma.c: In function 'ep93xx_dma_of_probe':
>> drivers/dma/ep93xx_dma.c:1365:51: warning: '%u' directive writing between 1 and 8 bytes into a region of size 2 [-Wformat-overflow=]
    1365 |                         sprintf(dma_clk_name, "m2p%u", i);
         |                                                   ^~
   drivers/dma/ep93xx_dma.c:1365:47: note: directive argument in the range [0, 16777216]
    1365 |                         sprintf(dma_clk_name, "m2p%u", i);
         |                                               ^~~~~~~
   drivers/dma/ep93xx_dma.c:1365:25: note: 'sprintf' output between 5 and 12 bytes into a destination of size 5
    1365 |                         sprintf(dma_clk_name, "m2p%u", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 4e8ad5ed845b ("dmaengine: cirrus: Convert to DT for Cirrus EP93xx")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409122133.NctarRoK-lkp@intel.com/
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/dma/ep93xx_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index d084bd123c1c..b18cfb60857b 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -1404,9 +1404,9 @@ static struct ep93xx_dma_engine *ep93xx_dma_of_probe(struct platform_device *pde
 		edmac->edma = edma;
 
 		if (edma->m2m)
-			sprintf(dma_clk_name, "m2m%u", i);
+			snprintf(dma_clk_name, sizeof(dma_clk_name), "m2m%u", i);
 		else
-			sprintf(dma_clk_name, "m2p%u", i);
+			snprintf(dma_clk_name, sizeof(dma_clk_name), "m2p%u", i);
 
 		edmac->clk = devm_clk_get(dev, dma_clk_name);
 		if (IS_ERR(edmac->clk)) {
-- 
2.46.0
