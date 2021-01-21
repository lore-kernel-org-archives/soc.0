Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49043C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 06:18:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF993238EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 06:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF993238EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uUhZ0Hf8xZDblnfx5HTpGTWbZrJeZgZk9FGvoiMBvuc=; b=LNBUMu1WUHxoTLH1aUT3qwuQW3
	vG21489WJkdBRH3+IKOFoQLxqpYWMTfdrFjuDBZUlXHWYVlUtGFfq3fuSxX4L1yxqSLBjfeN3ndVT
	Et7iBfOXqNv8/kqIx7xKJN2LcFSDtBTTZUgAsrr01HV4DYkPhMJYPL1bjTCrQXoIQGMojQwxCMRnR
	tuBajenxsQ13NLZjORxS4B//h9rIHUVC4JTDAyp3sH7gh2hEPhvdcDT6W+PspIFfaobvEm/PANEqX
	wCDF6PUu3lGWxlZmkyne/ipgV6uJwLIY6ASA/N40hviHedG3CE9g/ZWiTb0tJGMSk7+QNX05ipHJv
	3LHuklJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2TFT-0000u6-Pl; Thu, 21 Jan 2021 06:15:15 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2TFN-0000q2-96
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 06:15:13 +0000
Received: by mail-pl1-x634.google.com with SMTP id x18so699290pln.6
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 20 Jan 2021 22:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mWNPq5tM5lqX5/zedEBYeld5UMgLH1ZRvHHInCrsJks=;
 b=W2hKOdGMnelumlsRqeBsS8X/SVWWRS1ZiLqcN46tn6qmVeUClcJlai63N/hWswgpFM
 +sNmeMOpA4cMhPv4HN5VNvmsRQ72Dp9o1rI//zT+JGuKUWGKlW5ieC4Ad2Eeq2KmRuSd
 R+GM6dQ8DRKI6XOhNskpzozRbg61BgubFjiJsrb+tcDsndOCAODBel0cwb/1TwKZNnWP
 +WByqsWrP41cWzlj/VRPxfYtBxAbJ+l0mYlnnl2HTIOPMno/FhCSVe9E5WEUpZtkorrg
 pNjU7+x84vZKezKKccHikPiKnvO4Hoc6Ii/thkmn/gAWeJo/XoQtRFFLCxuIpxXG7gr+
 nlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mWNPq5tM5lqX5/zedEBYeld5UMgLH1ZRvHHInCrsJks=;
 b=hlPD9DN8gomTfe/Lx4kFZWIrmgrnuPJdhnxE9kNTxeSEILRIB9sOerP5q6rWRdA1Nz
 oQokmRgQxKt9nHm0/MqvZRYAL0CRuR2ApfpWpB5lG3CBzCJ5+94nEPwpSHEe90S6BEvT
 6CRMXSkWanTTXtdQrMeK6/wRtqd+MplFK29HbS6PJyb8oxA3EBV57Et+Rud69oaMtofN
 ixpO3NXG5IHkbSw91nt1XQImOQQaADRaJklqDdLZ265RLoT8L+6VEGou1BSaKxQLeXQe
 5mexOTdxdYbjXm6Ay8iNiBoAk292P19SzYyZn6VN5oz+kUhTkiNTmuJKZKmCrR+Qe5X3
 tz/g==
X-Gm-Message-State: AOAM531LGzh/mgmzykt8uEgOaP+Ty+V79Iu7cSz0ymLfFhmTLQYEPj8k
 kWHhPDyY4whHCvYoukPSqjsV
X-Google-Smtp-Source: ABdhPJz8Nb3Y9k8FnhjUO5mjSJ8WHQ77xlEw+6vTBZvVxmjSrxutQwemyWmViMqt9OoIxS8B2QiQVQ==
X-Received: by 2002:a17:903:22cc:b029:de:191c:1bdb with SMTP id
 y12-20020a17090322ccb02900de191c1bdbmr13737843plg.14.1611209698718; 
 Wed, 20 Jan 2021 22:14:58 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6182:23c4:4d5:e6d9:fc7e:c8e2])
 by smtp.gmail.com with ESMTPSA id h12sm4415759pgk.70.2021.01.20.22.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 22:14:58 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: <soc.lore.kernel.org>
To: linux@armlinux.org.uk,
	soc@kernel.org
Subject: [PATCH] ARM: multi_v7_defconfig: Enable Actions Semi platform and
 drivers
Date: Thu, 21 Jan 2021 11:44:47 +0530
Message-ID: <20210121061447.26517-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_011510_675742_0A9E5B8D 
X-CRM114-Status: GOOD (  10.88  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: arnd@arndb.de, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, cristian.ciocaltea@gmail.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, afaerber@suse.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121061447.5dVUgSgvWW2kluy_y5dWTFG1eS4JO3_3Rh-5Y_-FIDU@z>

The support for Actions Semi ARM32 platform has matured enough in the
mainline. So let's enable it in multi_v7_defconfig along with the
relevant drivers. The platform can now boot a distro from eMMC or uSD
without any out of tree patch.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c5f25710fedc..99f8815ef753 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -6,6 +6,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 CONFIG_ARCH_VIRT=y
+CONFIG_ARCH_ACTIONS=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_ARTPEC=y
 CONFIG_MACH_ARTPEC6=y
@@ -377,6 +378,8 @@ CONFIG_SERIAL_ST_ASC=y
 CONFIG_SERIAL_ST_ASC_CONSOLE=y
 CONFIG_SERIAL_STM32=y
 CONFIG_SERIAL_STM32_CONSOLE=y
+CONFIG_SERIAL_OWL=y
+CONFIG_SERIAL_OWL_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_ASPEED_KCS_IPMI_BMC=m
@@ -401,6 +404,7 @@ CONFIG_I2C_EMEV2=m
 CONFIG_I2C_IMX=y
 CONFIG_I2C_MESON=y
 CONFIG_I2C_MV64XXX=y
+CONFIG_I2C_OWL=y
 CONFIG_I2C_RIIC=y
 CONFIG_I2C_RK3X=y
 CONFIG_I2C_S3C2410=y
@@ -449,6 +453,8 @@ CONFIG_PINCTRL_AS3722=y
 CONFIG_PINCTRL_RZA2=y
 CONFIG_PINCTRL_STMFX=y
 CONFIG_PINCTRL_PALMAS=y
+CONFIG_PINCTRL_OWL=y
+CONFIG_PINCTRL_S500=y
 CONFIG_PINCTRL_APQ8064=y
 CONFIG_PINCTRL_APQ8084=y
 CONFIG_PINCTRL_IPQ8064=y
@@ -878,6 +884,7 @@ CONFIG_MMC_SH_MMCIF=y
 CONFIG_MMC_SUNXI=y
 CONFIG_MMC_BCM2835=y
 CONFIG_MMC_SDHCI_OMAP=y
+CONFIG_MMC_OWL=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_FLASH=m
@@ -947,6 +954,7 @@ CONFIG_IMX_DMA=y
 CONFIG_IMX_SDMA=y
 CONFIG_MV_XOR=y
 CONFIG_MXS_DMA=y
+CONFIG_OWL_DMA=y
 CONFIG_PL330_DMA=y
 CONFIG_SIRF_DMA=y
 CONFIG_STE_DMA40=y
@@ -977,6 +985,8 @@ CONFIG_COMMON_CLK_MAX77686=y
 CONFIG_COMMON_CLK_RK808=m
 CONFIG_COMMON_CLK_SCMI=y
 CONFIG_COMMON_CLK_S2MPS11=m
+CONFIG_CLK_ACTIONS=y
+CONFIG_CLK_OWL_S500=y
 CONFIG_CLK_RASPBERRYPI=y
 CONFIG_COMMON_CLK_QCOM=y
 CONFIG_QCOM_CLK_RPM=y
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
