Return-Path: <SRS0=/KAC=J7=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E52C43461
	for <soc@archiver.kernel.org>; Tue,  4 May 2021 19:35:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 21883613DC; Tue,  4 May 2021 19:35:08 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 470D3613C7
	for <soc@kernel.org>; Tue,  4 May 2021 19:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 470D3613C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id x5so10604593wrv.13
        for <soc@kernel.org>; Tue, 04 May 2021 12:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vGH4gKVqMFGwtn6qnf+9iZ3a3vefAvfwW/d/3Z1krdI=;
        b=zASfNWHRz1uXc+PDQtDVcFqPtvHY5VdiDHD/4G2VJOJAPRo4NbTO1z2H6LfZ4AzkSr
         tphH6TDrILepJSikB4SgPkvbuFbZu7dFWjLRTLZ4HPfKs89CWxWKKSDFB1DO6wbLQ5ay
         BICt9cqWGaNawYQVMPuxbo8RLfm1F7ph8A3Q1m/tP6w4icJDhN4inbGN93/Ofq//2CVu
         j7QIOi+VHU3ssXB64KWr2dTVK5VjMvtli+jFOwXFt1DWDCFL+bktD+2NWsTCfcoYkOJT
         QGgVVIYVl5kzZfyNxxnWsTyeRAelRQKpaSjFRJ+exqbjhav+RgiiOwJwQxRfR36JVrKT
         pVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vGH4gKVqMFGwtn6qnf+9iZ3a3vefAvfwW/d/3Z1krdI=;
        b=rGnoJ6P0BbS4pu6SyV0oS/Xg+iPyvjVJX+39Ze434pw8T0de6eH06Fbp409XvtbCBl
         cs5Msq6jZMhhxOCXSwdiYoIkDpTBNYF6oFTfFp0BSQKx9nCfP2P1ZsiUKXPxU3jr4Ktk
         oFGfuEWwhFWKblbjlhdj/cusFEPqUBc/4sswRTJJYr/rnv5wJplBIkdGFI8Rth/sEWuU
         teAaNk3kahwcIKY0H4wrzJUmuIlH3RtgKgrBMfoZPyeb85zaEDBgaEknV3odk1vGa8bK
         h4JR3ynHFv1/kXcHpS7Op0SRE0wNwKIitiwXS8vt4/T4TSMtc8evE2za2cZdAnDsLThj
         WhHA==
X-Gm-Message-State: AOAM532g/zNO8dnU1zBLzH3iv3Y3VZ9ve7RIaN+jvl0DF0qswHxBE6ky
	EFqyg+bHPLZXLkEmZUzTCEbBvrdxKL9muVw5
X-Google-Smtp-Source: ABdhPJyQHKfnAbPYhTTf6e5lMTFkW5CZeYWMhTWodx6MLel4EJC4lf+P/tfcTkGYStfLwQ/drNfktA==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr33567229wrs.264.1620156905644;
        Tue, 04 May 2021 12:35:05 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id x8sm17072136wru.70.2021.05.04.12.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 12:35:05 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	kaloz@openwrt.org,
	khalasa@piap.pl,
	linusw@kernel.org,
	linux@armlinux.org.uk,
	olof@lixom.net,
	robh+dt@kernel.org,
	soc@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/5] ARM: ixp4xx_defconfig: add MTD_PHYSMAP
Date: Tue,  4 May 2021 19:34:54 +0000
Message-Id: <20210504193457.4008384-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504193457.4008384-1-clabbe@baylibre.com>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without MTD_PHYSMAP/MTD_PHYSMAP_OF the flash partitions of my welltech,epbx100
are not detected.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/configs/ixp4xx_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/ixp4xx_defconfig b/arch/arm/configs/ixp4xx_defconfig
index e3bcf2bed25c..9a7667383df9 100644
--- a/arch/arm/configs/ixp4xx_defconfig
+++ b/arch/arm/configs/ixp4xx_defconfig
@@ -109,6 +109,8 @@ CONFIG_MTD_REDBOOT_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_COMPLEX_MAPPINGS=y
 CONFIG_MTD_IXP4XX=y
 CONFIG_MTD_RAW_NAND=m
-- 
2.26.3

