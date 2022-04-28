Return-Path: <SRS0=xrcm=VG=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC441C433F5
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 23:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E7D3C385B0; Thu, 28 Apr 2022 23:06:04 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9A85C385AD
	for <soc@kernel.org>; Thu, 28 Apr 2022 23:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D9A85C385AD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id q185so8550150ljb.5
        for <soc@kernel.org>; Thu, 28 Apr 2022 16:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=raSJrtH7MpsDAdE5AO3WGJ/c7mwc3EQHQ8mg3NCUrBk=;
        b=NiBaUhAzQqiYK1Q3XaX30Oe0YBbPcE+rAhkwZdy35MYX6XVzjMpQmGRL5AvKyJ/B8+
         J2r+E7jTuuSbge9scF98ynmrc4c0/k2Muu/5WKcHrgfOtuyi5VfAcrZCOU3DtHqeD6Cd
         knYcA4lmeL5yEE3ASKhoTBgci+f1RUDpVZGv/bSbmbsZ5+NHZvbcE4Bssu5L60QXG8MM
         FFu4mwEr27D+OhxWT2+9sFnmPVGepDih/mUF/k4uo6zK7Ck7MvjPvY7NQlMwRbA7JizU
         Cps3ZjhKdBtpd0zYv9BCzQtFsFpU0+qOyIt3PoJ62Tz7QuBU6XROU7R46sfD2nERDDRh
         1OZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=raSJrtH7MpsDAdE5AO3WGJ/c7mwc3EQHQ8mg3NCUrBk=;
        b=nGJwsDmGHB9IA95cVF6VqYrctWuPs6iFEic48OMXcWV9ZPlU980dwEgcdKfd5VQlS4
         DpM1oC6XDeIPO4FjFdbjKXV/aXXpKCPhkHNzmCwaEIfJ2hUrY5wxLP345TUNbE1LKrnd
         R+is24vDZIcDOEuSxiHp5l7qEz2TntyuZQG4G0l5xy2RC1KNMb5YN/2WgnOCWiPU3EIQ
         UBd3N5j/+hT8AWm+Xq8OFwe051lvTta08PWq2FVfHgrVXTMVpcPlVPj4yFe2jtaLkeNc
         uIFNGPXJsA/aNI0RNlUZeN1qqhio1MLSrydMd9OxTGAyGgMbkVg+6u1RC2DOeB7QMsJB
         mv8w==
X-Gm-Message-State: AOAM5300DdBhuVo6xokBYv41Xnlxa7TPIgnG7WnoiMmfZnef0hRMPJvQ
	HqVbrxzjSe5Uw3pm/rzp8e5Vig==
X-Google-Smtp-Source: ABdhPJxYALmTToWqWr2ZkA2LbqZ/LsgcRXV6YfPsZDm+3Bl8ZcqdF2KMw7DXejL0NDGd9VyLo0/irg==
X-Received: by 2002:a2e:9105:0:b0:24f:2558:8787 with SMTP id m5-20020a2e9105000000b0024f25588787mr9005078ljg.65.1651187161945;
        Thu, 28 Apr 2022 16:06:01 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id i15-20020ac25b4f000000b00472274142adsm104102lfp.200.2022.04.28.16.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 16:06:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Peng Wu <wupeng58@huawei.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: versatile: Add missing of_node_put in dcscb_init
Date: Fri, 29 Apr 2022 01:03:56 +0200
Message-Id: <20220428230356.69418-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peng Wu <wupeng58@huawei.com>

The device_node pointer is returned by of_find_compatible_node
with refcount incremented. We should use of_node_put() to avoid
the refcount leak.

Signed-off-by: Peng Wu <wupeng58@huawei.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi SoC folks, please apply this patch directly, I have
no other planned Versatile changes for v5.19.
---
 arch/arm/mach-versatile/dcscb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-versatile/dcscb.c b/arch/arm/mach-versatile/dcscb.c
index 866270e7f271..d8797350996d 100644
--- a/arch/arm/mach-versatile/dcscb.c
+++ b/arch/arm/mach-versatile/dcscb.c
@@ -144,6 +144,7 @@ static int __init dcscb_init(void)
 	if (!node)
 		return -ENODEV;
 	dcscb_base = of_iomap(node, 0);
+	of_node_put(node);
 	if (!dcscb_base)
 		return -EADDRNOTAVAIL;
 	cfg = readl_relaxed(dcscb_base + DCS_CFG_R);
-- 
2.35.1

