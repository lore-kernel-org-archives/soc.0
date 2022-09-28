Return-Path: <SRS0=lNGk=Z7=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761A5C07E9D
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 03:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2CEC6C433D7; Wed, 28 Sep 2022 03:00:37 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70397C433C1
	for <soc@kernel.org>; Wed, 28 Sep 2022 03:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70397C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id w20so10661409ply.12
        for <soc@kernel.org>; Tue, 27 Sep 2022 20:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date;
        bh=2+OhFM8rOECwwjmvJQULF0N9qmfnJ1tFlIPhyDZRvFs=;
        b=QZ0g8TS2qMxJJ/cAsJHCH0He8Xn+Iyd2su0lELl0k2vg9WZhRH+0fLWmZx5d6TpjYq
         yH+UWHKlnbITTUBl+TRPHjtvCxnEmCaOvQWTYHOaIjHuCPIe1diDlkM9GEDWTfgN4zQ6
         B3Fyr1Ct8PAk03uSbU7PrsTYrIWk9UEqUILlHP55UYi1nNBY+uB4Kpmd4Pl65WjbEXYE
         TrI48TLmtiWZmcdl+XIvI7QAMfhoj1XOKZwEvmdiS84atpbF3FzqkMIB8gOTWR9/iecu
         4nkAgCxHDDH10Kg67WpStNWU8q7qa+Nnz3lcK2XBpuSCTSraMhMTOOzMuvC749euvtH7
         Q7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date;
        bh=2+OhFM8rOECwwjmvJQULF0N9qmfnJ1tFlIPhyDZRvFs=;
        b=rw9i2Dlo2iD5mcixRZo2D/dzvma+Ocv0kTLg+XNlWnUp2LplanffuCe0ED1RWmblz3
         4+ZB8LkoC/e4R8qlm07gG5YuM/TbfGqPwhm5EV3zyGW06Nlqe4NxD3xssAIUUFghLZ96
         aVSDrwSTzDFXyJGTORbxDVf6bRO0376lWOJ6/zEsrqrcfYgcYP2S9PMrOpU67d4HFGxs
         ErMAqHCDo0k/wXTxalf/FhB2BD3FwoJqXSe0yHb3+MRcDpyv46XskvQIDX0ihVzb8ifq
         rQLP5+SCCs7CkaTu6/3H7pEEkhDoedBwt4K3k0EIEfhgbH7VD7otxBmTwcljSq/GjpUc
         tN/g==
X-Gm-Message-State: ACrzQf1fX9cECydpTST+tvHuIYST4L1UtSyMSi7RCj4ckPOSVHy2P0WA
	1gEYo89U+DmRn/OiToar2/8V/c89Erk=
X-Google-Smtp-Source: AMsMyM5afevpYG7qcBjeDyVOwFpCfuHRchThfK2azJsdbzhHPlAsMsb7vGlRWGvghQulEH3L71G7kw==
X-Received: by 2002:a17:90b:4c45:b0:202:6308:d9c4 with SMTP id np5-20020a17090b4c4500b002026308d9c4mr7993803pjb.40.1664334034044;
        Tue, 27 Sep 2022 20:00:34 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id u9-20020a170902e5c900b001769206a766sm2316129plf.307.2022.09.27.20.00.31
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 20:00:33 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] ARM: aspeed: Kconfig: Fix indentation
Date: Wed, 28 Sep 2022 12:29:26 +0930
Message-Id: <20220928025926.2592030-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Juerg Haefliger <juerg.haefliger@canonical.com>

The convention for indentation seems to be a single tab. Help text is
further indented by an additional two whitespaces. Fix the lines that
violate these rules.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
Acked-by: Andrew Jeffery <andrew@aj.id.au>
Link: https://lore.kernel.org/r/20220523060532.7864-1-juergh@canonical.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Hi soc maintainers, can you please apply this one. Thanks!

 arch/arm/mach-aspeed/Kconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index cd8a15be0724..080019aa6fcd 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -19,9 +19,9 @@ config MACH_ASPEED_G4
 	select PINCTRL_ASPEED_G4
 	select FTTMR010_TIMER
 	help
-	 Say yes if you intend to run on an Aspeed ast2400 or similar
-	 fourth generation BMCs, such as those used by OpenPower Power8
-	 systems.
+	  Say yes if you intend to run on an Aspeed ast2400 or similar
+	  fourth generation BMCs, such as those used by OpenPower Power8
+	  systems.
 
 config MACH_ASPEED_G5
 	bool "Aspeed SoC 5th Generation"
@@ -29,8 +29,8 @@ config MACH_ASPEED_G5
 	select PINCTRL_ASPEED_G5
 	select FTTMR010_TIMER
 	help
-	 Say yes if you intend to run on an Aspeed ast2500 or similar
-	 fifth generation Aspeed BMCs.
+	  Say yes if you intend to run on an Aspeed ast2500 or similar
+	  fifth generation Aspeed BMCs.
 
 config MACH_ASPEED_G6
 	bool "Aspeed SoC 6th Generation"
@@ -40,7 +40,7 @@ config MACH_ASPEED_G6
 	select ARM_GIC
 	select HAVE_ARM_ARCH_TIMER
 	help
-	 Say yes if you intend to run on an Aspeed ast2600 or similar
-	 sixth generation Aspeed BMCs.
+	  Say yes if you intend to run on an Aspeed ast2600 or similar
+	  sixth generation Aspeed BMCs.
 
 endif
-- 
2.35.1

