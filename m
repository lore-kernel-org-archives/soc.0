Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF80502B1
	for <soc@lists.linux.dev>; Fri, 20 Sep 2024 22:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726872745; cv=none; b=YJ0T4UfvqZpU2wS52rQfugDzl8qcnSax/BE6j0JZe6rjX7+hM9K3J+FhGv0z1ySoC7WWLnEcrGZ7FIdYKt7d7RkNu8EkpFE2+gLg7hs/tR4+L6x+fYjsoDyNHIMcVIwcraQFLPBT92TBZTbhX/8QV8ShPLE819i9VRBEczw47iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726872745; c=relaxed/simple;
	bh=zEQ4Uj+eDwZLcFetv57v4JszIJTyMN/yfKxiYeQlqgI=;
	h=From:Date:Subject:Cc:To:Message-ID:MIME-Version; b=N9ThVsTYQ5PmtV8lLkBpNGXt1tFGv3lW+6ODniVh/mdsWWMp0LtLfhqu86PLMXZIVrYsA0cFlDrYfqOyciuHASBGdBLdjMszPMuc8DzzR03eoEHwN5bq688gltxlRVisR1d5tXg1yIAnBi+fNQ5NKHFLns21bECy6077VuIYsvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpV9fcTD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpV9fcTD"
Received: by smtp.kernel.org (Postfix)
	id 8B1C0C4CECD; Fri, 20 Sep 2024 22:52:24 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5876C4CEC3
	for <soc@kernel.org>; Fri, 20 Sep 2024 22:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5876C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d13b83511so283907566b.2
        for <soc@kernel.org>; Fri, 20 Sep 2024 15:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726872742; x=1727477542; darn=kernel.org;
        h=user-agent:mime-version:message-id:to:cc:subject:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZvG3WLRkFz4rfmxmBvXQ2CC67V0apvwIHvcWPzpTXLU=;
        b=PpV9fcTDsyOUyVVSQPPQQj627753DHX2m/uRNMg73y4SnkobkiFxgZjSU8Af++6Xnp
         1hNbYH9KdCVWYoexKI1s1vlJYylj8DKbHuKXr1W8TuI/Bp5fnO29CUvFcwoHsUjwrRyU
         AKwzG4jpeJ0orY+4MaOkuE7G0S23hbF8PZpoWtVpHpms66LzF9NV4bFQik49m623GDam
         5lSjeoVQz3rq47FrAb7MUHvW7JGniWX4ggykQmz9r8imgOq1eX9Up54oROmzw8Wirule
         aSi7wmpmV34MoIz3H5aGqHUA8P3sZNzX/k8wPvGDpMlbu/o4Y2AQdPIW6Phe/CFlzWJj
         Vh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726872742; x=1727477542;
        h=user-agent:mime-version:message-id:to:cc:subject:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvG3WLRkFz4rfmxmBvXQ2CC67V0apvwIHvcWPzpTXLU=;
        b=WlPqUDwvv1eOtBZRt6ZbYNxtUe3UTghDVY1DjLsmdZSw9l3HdOk6AzjP0iea0uIW3i
         KGhFruQNA2BIdXajyk49KGDJ3GZqAJAl+CWDD/5/XlnTdVUzRK/PWn+Bij7wg76ti/RD
         BzUcnP06nGSVgBS+QmGqx6Yg2t5nzVD/R3gBEfIgwY+ontXTmqK4tO4PF8aUgguZeyvP
         yJBmmFRe8/eMM8ySIIicueVhD4n9yE7vjYOo/CzCo7nbogftAaS4GYF4ChViFJVt1ABW
         eoMsRYp6gz1dwOBm8zV12lz6emIkyLvQu5LgM2Rf+1uItuAv+CivFCzllamsoZj71e6Q
         G1OA==
X-Gm-Message-State: AOJu0Yw9/P/M+OgxFsmwJ2fb9/prAasVN7bjpKTTGL2K/+eiR6WJkbeR
	3SLYhdGHtyPmoBXV+Q3LNCkkKkqVz3A4U+zwQhYMelPbBA1dM273ZAQsyQ==
X-Google-Smtp-Source: AGHT+IE+GFxSIQc8ruZ7Ambh8A7924wUHNaJftm9agi6LfpLNhWlNktKFed+JNnJsC2Mj6c27pUPCQ==
X-Received: by 2002:a17:907:86a2:b0:a8d:4b70:b09a with SMTP id a640c23a62f3a-a90d56dcab6mr320117166b.20.1726872741867;
        Fri, 20 Sep 2024 15:52:21 -0700 (PDT)
Received: from giga-mm-1.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f43c7sm905328666b.62.2024.09.20.15.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 15:52:21 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sat, 21 Sep 2024 00:39:49 +0200
Subject: [PATCH] dmaengine: cirrus: ERR_CAST() ioremap error
Cc: Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>
To: soc@kernel.org
Message-ID: <d4b542f1d678796fbf094ebcc77295af3617bca0.camel@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Evolution 3.52.4 

ep93xx_dma.c:1354:37: sparse: sparse: incorrect type in return expression
				      (different address spaces)
ep93xx_dma.c:1354:37: sparse:     expected struct ep93xx_dma_engine *
ep93xx_dma.c:1354:37: sparse:     got void [noderef] __iomem *regs

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409202250.fPlN2Erd-lkp@intel.com/
Fixes: 4e8ad5ed845b ("dmaengine: cirrus: Convert to DT for Cirrus EP93xx")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/dma/ep93xx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index 995427afe077..7989bc3db209 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -1395,7 +1395,7 @@ static struct ep93xx_dma_engine *ep93xx_dma_of_probe(struct platform_device *pde
 		edmac->chan.device = dma_dev;
 		edmac->regs = devm_platform_ioremap_resource(pdev, i);
 		if (IS_ERR(edmac->regs))
-			return edmac->regs;
+			return ERR_CAST(edmac->regs);
 
 		edmac->irq = fwnode_irq_get(dev_fwnode(dev), i);
 		if (edmac->irq < 0)
-- 
2.46.0
