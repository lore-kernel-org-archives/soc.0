Return-Path: <SRS0=zWj5=V7=gmail.com=alexander.sverdlin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF28C433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 05:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7489C34100; Mon, 23 May 2022 05:04:33 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 003F1C385AA
	for <soc@kernel.org>; Mon, 23 May 2022 05:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 003F1C385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id e28so18976652wra.10
        for <soc@kernel.org>; Sun, 22 May 2022 22:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/QrDltn3VD/pRasuIqMNlaCi5sUwUS1pW+U9YcPglL4=;
        b=V9frMvmgJEm+MyjbKmqBuItdLs3GXpG78tIqLFeeS8ERhFX16SZP3fpMALj7qjOVmj
         Xv81Cvlaw/JnyJvTXJITStGrhgF8otMbOmb9E5dBpKiKgigxNrQptj1Sy2qVPNIoNd1t
         P5xcMvcpvWNnXMmQPjnSMo7U0KofGO7+ndcQpmy+ypxpPb9zSYPuWB3AmY6pshiTdzT9
         y7OtUZc76kzT5g1WRGotOGNPXeEGkT6bDp1NncGSTCkRr3xOxvW9fdLz3L38Ty5FjVRk
         fPbXntbmX/XIWhYfe94NzPjxEQO8Wd992E8L/S46iZS226LWHM+oKyXWjxkcLLKCPMLa
         1JxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/QrDltn3VD/pRasuIqMNlaCi5sUwUS1pW+U9YcPglL4=;
        b=u6ZKpy8JwX0jSD6GOozI+wfcdAy8zRJli5lfkfGHKTDS6EI2Vh/Q1FE/fZkwt1i5IG
         w0RriuGONkxyWzT/QwHykA8X0atG+/S48TZlIVHY8nXiXn71AW/1TVXKceIwyCz/qPLT
         ayowvcs4C5F7BZF63PPiQU1pI0Y99SXDbeWgItA6RUgFZ3TBxDxeZUQg090BO7+K6AEd
         DQFpN4gPwMgx9vmlasQqC6125VcB7YBMOctHml5R+EdEbXSW+bxtD2Gcan5oQK2PNOJU
         h+zDMOCe+P06zijDKTelXQXiQkRav06tzaq1ZZshztmdXP5PRIqmMoFCOmfmmUtjddbB
         rk6w==
X-Gm-Message-State: AOAM531fHzQ4alhWDisqLRpUB0FZV6wal5XWZiEp4imgwuHVqe0dFbSj
	BII8DFIvyCBvtwwv7siagKWUgm8XK8gdng==
X-Google-Smtp-Source: ABdhPJwfoEOJNcRH/CDjafdDfmVqX62p5wTnzxAue5hfmoVe+2CCtpeqvO6VxDuoTj2L7I92JqvDoQ==
X-Received: by 2002:a05:6000:1542:b0:20c:5e30:88fb with SMTP id 2-20020a056000154200b0020c5e3088fbmr17113741wry.302.1653282271118;
        Sun, 22 May 2022 22:04:31 -0700 (PDT)
Received: from giga-mm.. ([195.245.17.24])
        by smtp.gmail.com with ESMTPSA id k41-20020a05600c1ca900b0039747cf8354sm3059882wms.39.2022.05.22.22.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 22:04:30 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Genjian Zhang <zhanggenjian123@gmail.com>,
	Genjian Zhang <zhanggenjian@kylinos.cn>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH] ARM: ep93xx: clock: Do not return the address of the freed memory
Date: Mon, 23 May 2022 07:04:21 +0200
Message-Id: <20220523050421.322555-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Genjian Zhang <zhanggenjian123@gmail.com>

Avoid return freed memory addresses. Modified to the actual error
return value of clk_register().

Fixes: 9645ccc7bd7a ("ep93xx: clock: convert in-place to COMMON_CLK")
Signed-off-by: Genjian Zhang <zhanggenjian@kylinos.cn>
[AS: Added "ARM:" prefix, punctuation]
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm/mach-ep93xx/clock.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-ep93xx/clock.c b/arch/arm/mach-ep93xx/clock.c
index 4fa6ea5461b7..85a496ddc619 100644
--- a/arch/arm/mach-ep93xx/clock.c
+++ b/arch/arm/mach-ep93xx/clock.c
@@ -345,9 +345,10 @@ static struct clk_hw *clk_hw_register_ddiv(const char *name,
 	psc->hw.init = &init;
 
 	clk = clk_register(NULL, &psc->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
 		kfree(psc);
-
+		return ERR_CAST(clk);
+	}
 	return &psc->hw;
 }
 
@@ -452,9 +453,10 @@ static struct clk_hw *clk_hw_register_div(const char *name,
 	psc->hw.init = &init;
 
 	clk = clk_register(NULL, &psc->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
 		kfree(psc);
-
+		return ERR_CAST(clk);
+	}
 	return &psc->hw;
 }
 
-- 
2.36.0

