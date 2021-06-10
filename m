Return-Path: <SRS0=CGMp=LE=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1A4C47094
	for <soc@archiver.kernel.org>; Thu, 10 Jun 2021 04:53:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C5F93613C6; Thu, 10 Jun 2021 04:53:48 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03228613B3
	for <soc@kernel.org>; Thu, 10 Jun 2021 04:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03228613B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-pl1-f175.google.com with SMTP id e1so318823plh.8
        for <soc@kernel.org>; Wed, 09 Jun 2021 21:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/EVzBWdWsLalXKfuetjAlCv/NFhFJdcBJkrlzGHM19w=;
        b=Rt0cQIZFTi1qhu8Q6Xs77Qv7GHqtUdDeqe87w9cafIIHN3SD+REuqfri76urnNYdzv
         jy1k0nLgmY+rVd/dkngBgpS0+GEFAROxJmT+9Ehk5Yl3FO+rVBCF8+5roylx4zLoNUOL
         D57feujiKQOABYLu+LgGQT/vYFCnOTI9fzzNyr/DtXaLYU1K8sjWsjHKCWNHLVhk5HlR
         CzC5lUf+kX/8vI8bChnMLaE3cqCvzyJ1lOM36ZNkYAioYnUfpslwarYRzd/rk8u33sSd
         ufLSrmSqUZnHq0yXgDRYyaCi0cUaKcu+Js51Xrjqr0dcuKtfQRY+f7oTKzRJ1Qc4B+Hi
         jF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=/EVzBWdWsLalXKfuetjAlCv/NFhFJdcBJkrlzGHM19w=;
        b=WD6vdpHCsFtCTkQbL2w0Jd7YLWXcNdUhDyXqM5lahluejjKkV998LfzGYVHI9dCyzl
         kcevxPJC9Y00+6BTxOMwZbOII1HHNz+eE7bHWq7QOQ5PKQBMn6qHz9VdYhYNLw/ID8+q
         D2Nav29MPh1zrzNcgRBx7FFO8hYz292JWeXsf5+hLQgy0GLbhUf2ennqnhSGbMjkKE7t
         QtI35oy2N77lWGx4XCnIRyngILh/NEthxNDOz0YsGTFzoO9hss/EQ7vcJQR7FwRzrLVO
         r3TUmMaSVJIYQZsi3rODmDtxWuB8Nn5yAQhb06YeoGQKN+eWzhvLCnIvhuxHJnfR68Hg
         LTrA==
X-Gm-Message-State: AOAM531G1wZt0ryyi0KWcgw6fRSD3V1sQdhtNskv/qt0522MPJl21hEV
	16UW5VVBLROEqSOC6s9iiUVo6TykC2Q=
X-Google-Smtp-Source: ABdhPJxyIsb2wFwbQ3IMB0S1EP1ABjboiw6KkI1a9C02hpDpcoJQJdubbqWrzTe3i8eAU/+GtTlWtg==
X-Received: by 2002:a17:90a:df13:: with SMTP id gp19mr1377129pjb.11.1623300827001;
        Wed, 09 Jun 2021 21:53:47 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id w206sm1019728pff.1.2021.06.09.21.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 21:53:46 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] ARM: config: aspeed: Add DEBUG_FS and EXT4
Date: Thu, 10 Jun 2021 14:23:38 +0930
Message-Id: <20210610045338.99847-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DEBUG_FS was lost way back in v5.5, and EXT4 is used by ast2600 systems
that have MMC.

Fixes: 0e4a459f56c3 ("tracing: Remove unnecessary DEBUG_FS dependency")
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Link: https://lore.kernel.org/r/20210603040906.125109-1-joel@jms.id.au
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
This is a standalone patch for v5.14 (or even earlier if you feel like
it, as it's handy to have ext4 for doing CI)

 arch/arm/configs/aspeed_g4_defconfig | 1 +
 arch/arm/configs/aspeed_g5_defconfig | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 58d293b63581..a3ee647b1ebb 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -254,6 +254,7 @@ CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_GDB_SCRIPTS=y
 CONFIG_STRIP_ASM_SYMS=y
+CONFIG_DEBUG_FS=y
 CONFIG_SCHED_STACK_END_CHECK=y
 CONFIG_PANIC_ON_OOPS=y
 CONFIG_PANIC_TIMEOUT=-1
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 047975eccefb..2db48438c5d2 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -247,6 +247,7 @@ CONFIG_FSI_MASTER_ASPEED=y
 CONFIG_FSI_SCOM=y
 CONFIG_FSI_SBEFIFO=y
 CONFIG_FSI_OCC=y
+CONFIG_EXT4_FS=y
 CONFIG_FANOTIFY=y
 CONFIG_OVERLAY_FS=y
 CONFIG_TMPFS=y
@@ -276,6 +277,7 @@ CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_GDB_SCRIPTS=y
 CONFIG_STRIP_ASM_SYMS=y
+CONFIG_DEBUG_FS=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 # CONFIG_DETECT_HUNG_TASK is not set
 CONFIG_WQ_WATCHDOG=y
-- 
2.30.2

