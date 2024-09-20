Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BBA1C693
	for <soc@lists.linux.dev>; Fri, 20 Sep 2024 23:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726875153; cv=none; b=aGEaKrD0kxYxEWyBtCYiv8T+EGlVRaPMa+Yg2lHnr/nBVkrr+XNNXlzlpLQckU/pn3hH6jX7PfMYE9Ely+l0biy/JOSBGxiZthPpzYUZCAT13HOUQWSHsA9cY7SmQR3HN1MCPay9vdgIFlqvrqCNCWAPfnsZuHDLn13D7pjHnkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726875153; c=relaxed/simple;
	bh=oMnOHJs+RjOIqjFvMm6Sf0NUSlF7wR10WvQpMHgBD74=;
	h=From:Date:Subject:Cc:To:Message-ID:MIME-Version; b=AIk/pI5Vd/qvsh/E8s7o2p211MQ5sPgwZcW8qAe2T7ypb1mJGc+/sXX4WkW2cSJjCzWkIfi3eqSFh5ge+qOa2+AtqBtB4eo8+yqYGV7Rav4xMqQAxSQAffUzwVMp7EVrbPNf5Wsa+puHk+542KNYhqC6+pgo6s9/xO8TppTSS74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/l1K88s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/l1K88s"
Received: by smtp.kernel.org (Postfix)
	id 4ABC4C4CECD; Fri, 20 Sep 2024 23:32:33 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5ACD6C4CEC3
	for <soc@kernel.org>; Fri, 20 Sep 2024 23:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5ACD6C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so615634766b.0
        for <soc@kernel.org>; Fri, 20 Sep 2024 16:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726875150; x=1727479950; darn=kernel.org;
        h=user-agent:mime-version:message-id:to:cc:subject:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ivwEYHI1WBsMol3q7qg7yVR0Ecl1UCe1dLlN4b8bYT8=;
        b=d/l1K88sMKxGJGjunKPsUyYT6KvprLe4a6Db1BEdwxa1MLE6sVGaq2xd0PaEa5yEEW
         YOJPzmMNyEqvOPF2e84LDdqFtLeo+GRkOVsIWKu+Lhg0/czkmvezUqJYC4QmeOJZCnQW
         fegECw5ABiF260iea2qZ7tQObMSg0ovxzg/SdNBs35A9luLxOjLaXpqE62xg1zq9Wm1D
         dfx9ypeLNuz9xKMD5yKxULjriAWCt0XXFHf8sKo+OLkL0Qn14MkodfTxibwryrtNH6UE
         v7PUXOYNe0AnTfhAP0inZlUUFVSeuknOmJb5iIUjHSdz7VHUO32wjmfcQ3zeKjnz/1qV
         7E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726875150; x=1727479950;
        h=user-agent:mime-version:message-id:to:cc:subject:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivwEYHI1WBsMol3q7qg7yVR0Ecl1UCe1dLlN4b8bYT8=;
        b=o1lO/WWIWrUVIAhJJyiSF+zxBdKrBuGa8072PIJHA6GxIsKDENYyQDY6DM4VveVjKw
         fjcZ7rMGnaY5Hxp5EP+C9ixdTFFoXNA0uN4Js3RE9AFoc+6zt72a6P08EloR+HgHBEWw
         9TjoM8JkoFKU3EYIVWi8EvLhWEZyr+ABD04bXTGR38WOi6wgfFEdMKNE2IhtK8ruz4Yh
         UDrU1VKQSwNIh7WeA1j8ePC+KnANSMdXs3++G69olwQr0hf56tjKi1wY9O29d4wmDLm5
         vPINEev4CT3WWXpDhGiZd38yerAFuQLZx9tU6t7uvnHMtgcBMiSxyWNZwsTfV4mwkCZF
         Y24A==
X-Gm-Message-State: AOJu0YxReCx4Ii12WSmBFrl7AgC0ABHq9JEiKx4+jxukivzgcenOpt0l
	aMpDSL98m1cfYqMu9R0Zbc5W4OGNb5YIF80B9SCQqgvCoibSnBQJjP9CDA==
X-Google-Smtp-Source: AGHT+IGFN6JeCCw2boltdHps+Y/102yrGgi+BN6g9RrNuU+uae8UyN1q/U8f6aEp3rn6CN59DeyU1w==
X-Received: by 2002:a17:907:94d2:b0:a72:7b17:5d68 with SMTP id a640c23a62f3a-a90d3492f35mr479564466b.3.1726875150464;
        Fri, 20 Sep 2024 16:32:30 -0700 (PDT)
Received: from giga-mm-1.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3fcesm909130866b.133.2024.09.20.16.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 16:32:30 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sat, 21 Sep 2024 01:21:55 +0200
Subject: [PATCH] dmaengine: cirrus: check that output may be truncated
Cc: Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>
To: soc@kernel.org
Message-ID: <2bf9c37aad8f085839f9c63104f7275742f51945.camel@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Evolution 3.52.4 

ep93xx_dma.c: In function 'ep93xx_dma_of_probe':
ep93xx_dma.c:1409:74: warning: '%u' directive output may be truncated
			       writing between 1 and 8 bytes into a region
			       of size 2 [-Wformat-truncation=]
		snprintf(dma_clk_name, sizeof(dma_clk_name), "m2p%u", i);
		                                                 ^~

Fixes: d7333f9d3377 ("dmaengine: cirrus: use snprintf() to calm down gcc 13.3.0")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409172024.pU8U5beA-lkp@intel.com/
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/dma/ep93xx_dma.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index 7989bc3db209..6b98a23e3332 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -1391,6 +1391,7 @@ static struct ep93xx_dma_engine *ep93xx_dma_of_probe(struct platform_device *pde
 	INIT_LIST_HEAD(&dma_dev->channels);
 	for (i = 0; i < edma->num_channels; i++) {
 		struct ep93xx_dma_chan *edmac = &edma->channels[i];
+		int len;
 
 		edmac->chan.device = dma_dev;
 		edmac->regs = devm_platform_ioremap_resource(pdev, i);
@@ -1404,9 +1405,11 @@ static struct ep93xx_dma_engine *ep93xx_dma_of_probe(struct platform_device *pde
 		edmac->edma = edma;
 
 		if (edma->m2m)
-			snprintf(dma_clk_name, sizeof(dma_clk_name), "m2m%u", i);
+			len = snprintf(dma_clk_name, sizeof(dma_clk_name), "m2m%u", i);
 		else
-			snprintf(dma_clk_name, sizeof(dma_clk_name), "m2p%u", i);
+			len = snprintf(dma_clk_name, sizeof(dma_clk_name), "m2p%u", i);
+		if (len >= sizeof(dma_clk_name))
+			return ERR_PTR(-ENOBUFS);
 
 		edmac->clk = devm_clk_get(dev, dma_clk_name);
 		if (IS_ERR(edmac->clk)) {
-- 
2.46.0
