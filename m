Return-Path: <SRS0=rvNc=5Q=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33998C00A5A
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 14:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FA19C43396; Thu, 19 Jan 2023 14:43:01 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FDF4C433F1;
	Thu, 19 Jan 2023 14:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FDF4C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674139379; x=1705675379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z5BOX24eWOopSXeN2xDF09qwu6cHJYzrrndKi7ZS7C8=;
  b=f+wSezIUTAD4NrLorulUhx++vIZOnZXOhKiSnXT1EHn9+ZBRFEMVJnNK
   22q7ThPMGHvRoQtlVjKfJKYSZcbWEjRHVD8heGcgE1SdZsbxvB3VZX0u+
   J/RF5cUyXXE07z+DKYVPmxFZtOyEbpfTM+hAH6fJy0W9+psvrBfwGwqvZ
   MhZtr/SahEauz+nV3g8MPz3XdY16/kpG1aLb/Sd0nxmT//WHIV/N8brv0
   zuzNB5IvZ8plX75LbjDHAHgq4zXgodmofehRTHWFA61AuSlk4E/G17e02
   AtIQkDlkAuKLpBQs/CNV25UdbpjMmiyWzW15711hpd/eZWqkwaTln/NuE
   g==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669071600"; 
   d="scan'208";a="28537321"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Jan 2023 15:42:45 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 19 Jan 2023 15:42:45 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 19 Jan 2023 15:42:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674139365; x=1705675365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z5BOX24eWOopSXeN2xDF09qwu6cHJYzrrndKi7ZS7C8=;
  b=F/GOiNDV1vM6UCF7p6tHvKYh/aAJutlVLtXZhJ5EiN8ZKoJrxbLrwJP3
   ADIRGe8SaulRupDbCDr76BdIB/kXXXHqGlplVK/ioqM6yPlzU5TYuIqO+
   zuY5ufLMGxQXqbG20l7vELHeFIiX4xK7YCISChnhi95omBM6P5cle51B9
   krU13bvF8jQY+hpsV1t3NHgsfeoYPdCdZN2g4QF/4VYU8/oB88Nan4u79
   N9LGqCvPQwJ6tWdFKmierBI7bdZ2fsSheWzKXiKSjj3HNwcvnfDZP1O8y
   D58uRsVRMk7M7/QRUZ5XqxDD7RXgLE58M/9MjlCbm6P60H93AsMQY0pgU
   A==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669071600"; 
   d="scan'208";a="28537319"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Jan 2023 15:42:45 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E78C6280056;
	Thu, 19 Jan 2023 15:42:44 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
List-Id: <soc.lore.kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 9/9] [DNI] ARM: multi_v7_defconfig: Enable CONFIG_ARM_LPAE for multi_v7_config
Date: Thu, 19 Jan 2023 15:42:36 +0100
Message-Id: <20230119144236.3541751-10-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is necessary to support PCIe on LS1021A.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 441a449172368..f0757f05ec2c2 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -105,6 +105,7 @@ CONFIG_ARCH_VEXPRESS=y
 CONFIG_ARCH_VEXPRESS_TC2_PM=y
 CONFIG_ARCH_WM8850=y
 CONFIG_ARCH_ZYNQ=y
+CONFIG_ARM_LPAE=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=16
 CONFIG_ARM_APPENDED_DTB=y
-- 
2.34.1

