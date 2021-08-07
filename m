Return-Path: <SRS0=9c91=M6=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2793C4338F
	for <soc@archiver.kernel.org>; Sat,  7 Aug 2021 23:02:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A12D661050; Sat,  7 Aug 2021 23:02:20 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CAC660F6D
	for <soc@kernel.org>; Sat,  7 Aug 2021 23:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CAC660F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id n17so669331lft.13
        for <soc@kernel.org>; Sat, 07 Aug 2021 16:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jlAaQFyXghmyzPJGW+GcQ9q9eakvQgsmdsfCvHm6fzw=;
        b=Wf6blrWiOJQpM23q0ZXVW/fSQGdONjouqHmvjtMIErDceCRB7geeaP+28xljiz7VU5
         r10LpZVmvWx+eV6AlSLSak4koy6GP9rJNwcJt6tIXjMqlnkKCnmZSiFRTpDzpSI40xf+
         7MRW/hbjPqkiutQmJgAxLgxdE2W/r6TKF9AVWPuceIbwrncZQqLwrRUjnlaoyVL0Gxsk
         XZrp5kn3RLjba/sRM5IpnVQ2pVP2GbCkdIcRMbdvx5Ugps4vq8Khf/eG8oXZVHqJWhwY
         FgKeeeTlWAk5UbNdBf2niv9AzOwGk4GbDdwKfgRF2jrazf8k7xv0+v9ELEZAp6LO07Rn
         BW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jlAaQFyXghmyzPJGW+GcQ9q9eakvQgsmdsfCvHm6fzw=;
        b=pI/JpEngi7otrPuxJKkBNOIPA7XHp60mG8WPhmTwfxnedR0XREuBft6nAzVZ9Q0lRT
         +QmuytyyFg3WTxk8PBH5gwAzGr8hJQhG9M7m6rGyDx0XEjuLYYZSDF/76R9hLgkUSDa3
         3gl2ezr5gjF0/1+RROu7pC4IHU7BOqaQlNyowQD/LuxwnuPXo3A8XZre189Z7kuf9lHN
         lbNQT2npEBSTHpY2O9c2IdwxNMapZG7IK4kaTdydQ7B74KKQv9KTtNg0iscgAIj1kHUM
         60sw8SolcRNqzTCNWNYfCTNaepSMPKvXQnZdZ/waX49z16bPolxLVV+VuqsmxTfWgT54
         59mg==
X-Gm-Message-State: AOAM532ndDjfluPTE/0gWW4n7bcmiBv3tXbzkMp2RugK8FKBcgn0QW3L
	q0w4bv58MJfNAFYaH1LGlKNTjg==
X-Google-Smtp-Source: ABdhPJyz10pFQqbxKs6fdRlk9g46fPS0tET1pzRZJeXmO2SDOoUq8WI3p22O7YQLRffCwH0LPA6xWQ==
X-Received: by 2002:a05:6512:239e:: with SMTP id c30mr10204798lfv.417.1628377338778;
        Sat, 07 Aug 2021 16:02:18 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id w6sm1100906ljw.8.2021.08.07.16.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 16:02:18 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] bus: ixp4xx: return on error in ixp4xx_exp_probe()
Date: Sun,  8 Aug 2021 01:00:16 +0200
Message-Id: <20210807230016.3607666-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dan Carpenter <dan.carpenter@oracle.com>

This code was intended to return an error code if regmap_read() fails
but the return statement was missing.

Fixes: 1c953bda90ca ("bus: ixp4xx: Add a driver for IXP4xx expansion bus")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please apply this to the same branch where the
bus changes in the pull request "ixp4xx-drivers-arm-soc-v5.15-1"
was pulled in.
---
 drivers/bus/intel-ixp4xx-eb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/intel-ixp4xx-eb.c b/drivers/bus/intel-ixp4xx-eb.c
index 9acd00da413c..a4388440aca7 100644
--- a/drivers/bus/intel-ixp4xx-eb.c
+++ b/drivers/bus/intel-ixp4xx-eb.c
@@ -369,7 +369,7 @@ static int ixp4xx_exp_probe(struct platform_device *pdev)
 	/* We check that the regmap work only on first read */
 	ret = regmap_read(eb->rmap, IXP4XX_EXP_CNFG0, &val);
 	if (ret)
-		dev_err_probe(dev, ret, "cannot read regmap\n");
+		return dev_err_probe(dev, ret, "cannot read regmap\n");
 	if (val & IXP4XX_EXP_CNFG0_MEM_MAP)
 		eb->bus_base = IXP4XX_EXP_BOOT_BASE;
 	else
-- 
2.31.1

