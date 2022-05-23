Return-Path: <SRS0=zWj5=V7=gmail.com=alexander.sverdlin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDA6C433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 06:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9FD00C34115; Mon, 23 May 2022 06:56:25 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A9B1C385A9
	for <soc@kernel.org>; Mon, 23 May 2022 06:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A9B1C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id k30so19858175wrd.5
        for <soc@kernel.org>; Sun, 22 May 2022 23:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LKnNzGCx87x63I8h/gwYuHzFIrPdoxH6GKC0KDIqEo8=;
        b=K1Qbu4LN4uTSgtI2f+EwwHTK17ZwUKdpUB+44EazVoGCE3gAwf4WcSamCf+z//ik71
         VjU+ape8fK6TZy57aLcVjEW/OJIVyeWkauRLHhOLpymMxmoTE1sRdEGTu1VnwJRymeON
         GwCbJMw76qSYvQSDrpaXCnj0taljv1ZFbOA3CMzlEv5tdZbvPAwBKF0vntRCUvZVpqAU
         o9v3sB5mEWuIwXAb5g8OcT+MzlzNf7NRVtb0CLp+T5nf/VUTSvGky3Gl11CtTJbq2bPR
         MUdlmgCP4Z95Nrb8mPDeBjll7zo679+3VY14PFJf6S3sJo0+0HuFIYLrRWoRY2MDOQR1
         h2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LKnNzGCx87x63I8h/gwYuHzFIrPdoxH6GKC0KDIqEo8=;
        b=0qFR6lDbsj6KtaHxErdRHleaQFzTAJDcBqi9HdkmLVwW/bttlF784Eivm7SseQWsCf
         VGXWj0LJE1UnzojSyqXQJ1tK4H6lSngd3FR58j0SKHSAhLyGMoyAPYIny0jDY2jBczoC
         wXbzcMzVq1XpiEiTtsekEDvxzwO53D3/wqZcElL59ZDw9HCPYsIK83ahcknMBt/QCFnn
         a+yIlglqRPR/3WnPcABsTQKlLnGW6TgCQ6ngmbeIXjzKxW8CXYAqVzuRUfEcftjlaE30
         HwmQi58FAnGdrM9OmEJJPphYNDaGsGyTMfkjDUTy+iWX/k3tHCK/MD1cabMMgSyFINre
         zbpA==
X-Gm-Message-State: AOAM533MW4IuzhKA/SDwxY8x6ga/t2i+bWkNw2aXiRbdOBS0agEV3SZ5
	pe4ZcrHrPS2G8FGVqBW9qmhJVVhJk1dJVQ==
X-Google-Smtp-Source: ABdhPJzxVVJfQdTIdKqAqKFnD0HZqlbRwAPf9YDWKBc83FR8g+9DH/H3FcukagCoRtRevHtOOSh5ig==
X-Received: by 2002:a5d:64e9:0:b0:20f:dcf7:2173 with SMTP id g9-20020a5d64e9000000b0020fdcf72173mr3225598wri.332.1653288983444;
        Sun, 22 May 2022 23:56:23 -0700 (PDT)
Received: from giga-mm.. ([195.245.17.24])
        by smtp.gmail.com with ESMTPSA id l6-20020adfa386000000b0020c6a524fd5sm10690243wrb.99.2022.05.22.23.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 23:56:22 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Lukasz Majewski <lukma@denx.de>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ARM: ep93xx: Make ts72xx_register_flash() static
Date: Mon, 23 May 2022 08:56:16 +0200
Message-Id: <20220523065616.325052-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... and fix the warning/error:

arch/arm/mach-ep93xx/ts72xx.c:154:13: error: no previous prototype for function 'ts72xx_register_flash' [-Werror,-Wmissing-prototypes]
void __init ts72xx_register_flash(struct mtd_partition *parts, int n,
            ^
arch/arm/mach-ep93xx/ts72xx.c:154:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
void __init ts72xx_register_flash(struct mtd_partition *parts, int n,
^
static

Link: https://lore.kernel.org/lkml/202202140141.HRZ3WZwi-lkp@intel.com/T/
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm/mach-ep93xx/ts72xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx.c
index e70bac011407..d3de7283ecb3 100644
--- a/arch/arm/mach-ep93xx/ts72xx.c
+++ b/arch/arm/mach-ep93xx/ts72xx.c
@@ -150,7 +150,7 @@ static struct platform_device ts72xx_nand_flash = {
 	.num_resources		= ARRAY_SIZE(ts72xx_nand_resource),
 };
 
-void __init ts72xx_register_flash(struct mtd_partition *parts, int n,
+static void __init ts72xx_register_flash(struct mtd_partition *parts, int n,
 				  resource_size_t start)
 {
 	/*
-- 
2.36.0

