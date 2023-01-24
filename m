Return-Path: <SRS0=Qc4v=5V=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9F9C54EB4
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 11:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26E5DC433EF; Tue, 24 Jan 2023 11:02:33 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD56AC433D2;
	Tue, 24 Jan 2023 11:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD56AC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558151; x=1706094151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xz/vRD3dolKFyEebpOql6jJYuQ0Wvwmw1Ox1BdnhLHg=;
  b=UTypz2EjvFUn+LUp26ZBF8F175eh1wHCMxuECbfKPN2c3eE6IkrkWi36
   8dMwYtkfFGXlP2B8b9Vm4FcN7aX9gwF0zHUn7eux6wazwjl57YWra1eyS
   QYjOTbJ74gVbVBwSRHqNk0KIFqUfTJL8tpTC96e13ipKqMBoxyezRviJZ
   3Z0WzX1NjmzoflOddhOuLVz+Ubv2p5RQcct+S27o7oBNQ8ZntSO4Foxes
   9JovAT1g5Y3Zq6Jxa8ecdupwMoTodvv4KulmvyLwkAIf8JRjDJFGiSuHa
   zAIqNN39njW0Hx5Asm+zetqC7aF0l2tExKyCqqNwMf3KpJmX45mLFff+/
   g==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616635"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Jan 2023 12:02:20 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 24 Jan 2023 12:02:20 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 24 Jan 2023 12:02:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558140; x=1706094140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xz/vRD3dolKFyEebpOql6jJYuQ0Wvwmw1Ox1BdnhLHg=;
  b=eMup3qfn4lFtLO7j8ckfrOw8PImobHyBd9qVInP+6ZzxcKCVJ58dqHWo
   4fy7SAcrHB0aiLY7NIf7chdhBivtGxL5ZnGIsKSr5CFNEfSQCJqXMOzC4
   BmGU2mEESNDkqVCXaECiiWAkiamjebSWY/RLQjY6paHaACda0VrMAhbvH
   7NYR+59jk87bYGmBTXuP82kxgSP62HItuvEp+BljBXsQNSv16yHMXg0QH
   Ib66RmGgg96G8lQbxnILTNoeVvWdOp1vqzqC+w54APXaiMf6ZBsoa9ILu
   iME9haXJJNrvaT+zNCwgnFeC5nlGdHn8nvPgqzGCkGNorbQrgVoCwbw+B
   A==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616633"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:19 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8AA25280073;
	Tue, 24 Jan 2023 12:02:19 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
List-Id: <soc.lore.kernel.org>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kbuild@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 10/10] ARM: add multi_v7_lpae_defconfig
Date: Tue, 24 Jan 2023 12:02:13 +0100
Message-Id: <20230124110213.3221264-11-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
References: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

The only missing configuration option preventing us from using
multi_v7_defconfig with the Raspberry Pi 4 is ARM_LPAE. It's needed as
the PCIe controller found on the SoC depends on 64bit addressing, yet
can't be included as not all v7 boards support LPAE.

Introduce multi_v7_lpae_defconfig, built off multi_v7_defconfig, which will
avoid us having to duplicate and maintain multiple similar configurations.

Needless to say the Raspberry Pi 4 is not the only platform that can
benefit from this new configuration.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* As per Arnd's suggestion add CONFIG_VMSPLIT_2G to lpae.config fragment
* List multi_v7_lpae_defconfig target in 'make help' as well

Unfortunately the list of defconfigs is autogenerated, so this new
(explicit) target doesn't fit into this list. Therefore it's added to
'archhelp' instead.

 arch/arm/Makefile            | 6 ++++++
 arch/arm/configs/lpae.config | 2 ++
 2 files changed, 8 insertions(+)
 create mode 100644 arch/arm/configs/lpae.config

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a353b92641f36..485a439e22ca8 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -314,6 +314,10 @@ endif
 # My testing targets (bypasses dependencies)
 bp:;	$(Q)$(MAKE) $(build)=$(boot) $(boot)/bootpImage
 
+include $(srctree)/scripts/Makefile.defconf
+PHONY += multi_v7_lpae_defconfig
+multi_v7_lpae_defconfig:
+	$(call merge_into_defconfig,multi_v7_defconfig,lpae)
 
 define archhelp
   echo  '* zImage        - Compressed kernel image (arch/$(ARCH)/boot/zImage)'
@@ -329,4 +333,6 @@ define archhelp
   echo  '                  (distribution) /sbin/$(INSTALLKERNEL) or'
   echo  '                  install to $$(INSTALL_PATH) and run lilo'
   echo  '  vdso_install  - Install unstripped vdso.so to $$(INSTALL_MOD_PATH)/vdso'
+  echo
+  echo  '  multi_v7_lpae_defconfig     - multi_v7_defconfig with CONFIG_ARM_LPAE enabled'
 endef
diff --git a/arch/arm/configs/lpae.config b/arch/arm/configs/lpae.config
new file mode 100644
index 0000000000000..a6d6f7ab3c01a
--- /dev/null
+++ b/arch/arm/configs/lpae.config
@@ -0,0 +1,2 @@
+CONFIG_ARM_LPAE=y
+CONFIG_VMSPLIT_2G=y
-- 
2.34.1

