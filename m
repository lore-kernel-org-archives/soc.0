Return-Path: <SRS0=79U8=MF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C58FC07E95
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jul 2021 13:42:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3499B611C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jul 2021 13:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3499B611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t/nNUTFK56sZ68m5zSguvz3zzh4YQ7tcCA0gnZBk9fI=; b=khMBAh4FgDkGlX
	Cd/kDq84MYDxnk7ypjqKS04h5LUudgG0i260xXr0+5uBrsBGyYPxH57P776LiJZ37cl81RLV3RYNb
	FniosXknpfhMvkbpqZEgojEreieV6oNFwD3gKA5WJzqIzZ9rHf8S+eJHFUSl2sTebdYx6HHN9ZUfo
	NJm3f/g355a3l6BICf2ulUNPW8OVlEYShvJNu+WyCK2/2krvTHRmzndYFhLFPxxa9uR6P6FB3ntHK
	6X6RS8BYA7j/qTRHUPu3ZAGoavJadX5Dng8WDUDYV68dO8yYvcQ1tBm/kMQPQKYtOFYtuVC37C52G
	snzJAS67olXodagvLAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3IdJ-00AZdb-HW; Tue, 13 Jul 2021 13:39:35 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3Id4-00AZcT-F8
 for linux-arm-kernel@lists.infradead.org; Tue, 13 Jul 2021 13:39:20 +0000
Received: by mail-lf1-x129.google.com with SMTP id a18so50296581lfs.10
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 13 Jul 2021 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m1L1P03apuxbxHANuK71pE0bOd+7UHICDo55L4pBuMM=;
 b=VdSN2mzmfMLxkfg4yhldr7SGkYwkzR1ZTFVVCWs20f/smV/6I9k+QaoRD4R8X5WGo/
 EUEuSJUidq6HKaA074NHD5wG33d80rOLIBgC6P4nBNHYdDIG9QCg1NIQ7S0mOA2gU1fW
 lt+1olKCDcbvbQO/xgs+gkGfajTqhILAMkIVTIDBkpxfAZ26wRJf0slRDpeYQAd1rg9X
 7IK31kf24iy0KIqVIzV5U3gx69Ud1fD7UK65zoESPyFEf8VaebIwmTP+1vL7riRUEUBV
 ugcCTbqXMQ2hY0PHu1Obi5LTENAjvCfjM344auLYenYHNubsJUczVFM8t5Ma/Ofu/126
 NlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m1L1P03apuxbxHANuK71pE0bOd+7UHICDo55L4pBuMM=;
 b=HD1AMmKOhK2hJ2g00K2vfdLU/LMoRCgWReVMjJ4DDbrWvwPkT73ZqD78330LmjLMAj
 RftZ0q9CjH+NavuywjQLmk7wP3ZbWED2kDq1suhOATfH6nRl4YL7uNv7ZnqKhLwiE2ho
 1hllC9kVD1G1oki4CmxHi3jVatp/ItpQR/laMHvkVK8jzKL6n1WudBlfavP2l8cZk710
 B2EBB/4wXdNZkmbB4c5TF9TuPqS5ht5HQRxhxyjDia9Cvr1np8gHpXxZKTz03jptbWaw
 i1OKcqIgk8UXM4rPCWvBArGVbzwExeYPISzpsTxuRy4hTz72PtSFpCO/GiotuTTjn4lW
 pyhA==
X-Gm-Message-State: AOAM531I9ocTCzfNOpnCK9jGeSOPHLmKUxN8noeipoAyzMJoo8HLUKP2
 mLwChAEJtBxrJymuUgWfa5sO3wpaLaz4mg==
X-Google-Smtp-Source: ABdhPJwpQtrzQUw085pQpGCvEWBKcCNRgspiugoHDYp/xnWmkQG6vAKtLkA8a+eKHsqQhNUh3tX35Q==
X-Received: by 2002:ac2:58e8:: with SMTP id v8mr3550223lfo.14.1626183555274;
 Tue, 13 Jul 2021 06:39:15 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id y12sm1925068ljh.19.2021.07.13.06.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:39:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Kees Cook <keescook@chromium.org>, Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] ARM: configs: Update Vexpress defconfig
Date: Tue, 13 Jul 2021 15:37:08 +0200
Message-ID: <20210713133708.94397-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_063918_574478_09C16A9B 
X-CRM114-Status: GOOD (  12.31  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210713133708.NNPub2_hRqVIEefbAF-fzZej_twbjiKgRAGqUAWBluw@z>

This updates the Versatile Express defconfig for the changes
in the v5.14-rc1 kernel:

- The Framebuffer CONFIG_FB needs to be explicitly selected
  or we don't get any framebuffer anymore. DRM has stopped to
  select FB because of circular dependency.
- CONFIG_CMA options were moved around.
- CONFIG_MODULES options were moved around.
- CONFIG_CRYPTO_HW was moved around.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Cc: Kees Cook <keescook@chromium.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly for v5.14 if Sudeep is
OK with the patch.
---
 arch/arm/configs/vexpress_defconfig | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/arm/configs/vexpress_defconfig b/arch/arm/configs/vexpress_defconfig
index 4479369540f2..b5e246dd23f4 100644
--- a/arch/arm/configs/vexpress_defconfig
+++ b/arch/arm/configs/vexpress_defconfig
@@ -11,9 +11,6 @@ CONFIG_CPUSETS=y
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
 CONFIG_ARCH_VEXPRESS=y
 CONFIG_ARCH_VEXPRESS_DCSCB=y
 CONFIG_ARCH_VEXPRESS_TC2_PM=y
@@ -23,14 +20,17 @@ CONFIG_MCPM=y
 CONFIG_VMSPLIT_2G=y
 CONFIG_NR_CPUS=8
 CONFIG_ARM_PSCI=y
-CONFIG_CMA=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_CMDLINE="console=ttyAMA0"
 CONFIG_CPU_IDLE=y
 CONFIG_VFP=y
 CONFIG_NEON=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -43,7 +43,6 @@ CONFIG_IP_PNP_BOOTP=y
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
 CONFIG_DEVTMPFS=y
-CONFIG_DMA_CMA=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
@@ -59,7 +58,6 @@ CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_VIRTIO=y
 CONFIG_ATA=y
-# CONFIG_SATA_PMP is not set
 CONFIG_NETDEVICES=y
 CONFIG_VIRTIO_NET=y
 CONFIG_SMC91X=y
@@ -81,11 +79,9 @@ CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_SII902X=y
 CONFIG_DRM_PL111=y
-CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
 # CONFIG_SND_DRIVERS is not set
@@ -136,10 +132,11 @@ CONFIG_ROOT_NFS=y
 CONFIG_9P_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
+# CONFIG_CRYPTO_HW is not set
+CONFIG_DMA_CMA=y
 CONFIG_DEBUG_INFO=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DETECT_HUNG_TASK=y
 # CONFIG_SCHED_DEBUG is not set
 CONFIG_DEBUG_USER=y
-# CONFIG_CRYPTO_HW is not set
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
