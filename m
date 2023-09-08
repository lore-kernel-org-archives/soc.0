Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBC9EEB56E
	for <soc@archiver.kernel.org>; Fri,  8 Sep 2023 22:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7D4EC433B7; Fri,  8 Sep 2023 22:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF66BC433CD;
	Fri,  8 Sep 2023 22:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694213274;
	bh=7Y8dZf5xVpJXjcJju5EPHf+3OBCt4K7nM2BzCZ1E7Tw=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=Yz26P3b3d6c0w5mBFpB6+hAr3xQEA3ODkAPAEj3pp0InLeaK7QFVwVW/bYBB6EY52
	 VQqV/AmDM8RfKUkqfVrAJ5CGxlANZMau29PIrxhfhKxa+P8hmId5mkdJj04JXrbQas
	 g8ICuh06DkM16PKxwwScCmzqL6ut+AMl29NggkKQlWed0rhKeLnY23/Nw/WsqMT7yK
	 emwFf6q4MtmZMY60jS/P6uTqJ1HADdAxm1zys2ZfkzQmpT1zJFN5rRuejDkkNebDRL
	 WTzOLXWy2Jps1BgCVoebU3SbRZhy2OOKdfqak4fzqNWyVEsjcFifCbZV6ft+J2uaoa
	 Oye4XA+uL/0Hw==
From: Sasha Levin <sashal@kernel.org>
To: stable-commits@vger.kernel.org,
	robh@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Patch "ARM: dts: Add .dts files missing from the build" has been added to the 6.1-stable tree
Date: Fri,  8 Sep 2023 18:47:51 -0400
Message-Id: <20230908224751.3533194-1-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

This is a note to let you know that I've just added the patch titled

    ARM: dts: Add .dts files missing from the build

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-dts-add-.dts-files-missing-from-the-build.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.



commit 6a1fd94e112628e21887ece8bac525e5ca260e34
Author: Rob Herring <robh@kernel.org>
Date:   Tue May 2 12:25:29 2023 -0500

    ARM: dts: Add .dts files missing from the build
    
    [ Upstream commit 86684c2481b6e6a46c2282acee13554e34e66071 ]
    
    Comparing .dts files to built .dtb files yielded a few .dts files which
    are never built. Add them to the build.
    
    Signed-off-by: Rob Herring <robh@kernel.org>
    Stable-dep-of: 92632115fb57 ("samples/bpf: fix bio latency check with tracepoint")
    Signed-off-by: Sasha Levin <sashal@kernel.org>

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6aa7dc4db2fc8..df6d905eeb877 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -331,6 +331,7 @@ dtb-$(CONFIG_MACH_KIRKWOOD) += \
 	kirkwood-iconnect.dtb \
 	kirkwood-iomega_ix2_200.dtb \
 	kirkwood-is2.dtb \
+	kirkwood-km_fixedeth.dtb \
 	kirkwood-km_kirkwood.dtb \
 	kirkwood-l-50.dtb \
 	kirkwood-laplug.dtb \
@@ -861,7 +862,10 @@ dtb-$(CONFIG_ARCH_OMAP3) += \
 	am3517-craneboard.dtb \
 	am3517-evm.dtb \
 	am3517_mt_ventoux.dtb \
+	logicpd-torpedo-35xx-devkit.dtb \
 	logicpd-torpedo-37xx-devkit.dtb \
+	logicpd-torpedo-37xx-devkit-28.dtb \
+	logicpd-som-lv-35xx-devkit.dtb \
 	logicpd-som-lv-37xx-devkit.dtb \
 	omap3430-sdp.dtb \
 	omap3-beagle.dtb \
@@ -1527,6 +1531,8 @@ dtb-$(CONFIG_MACH_ARMADA_38X) += \
 	armada-388-helios4.dtb \
 	armada-388-rd.dtb
 dtb-$(CONFIG_MACH_ARMADA_39X) += \
+	armada-390-db.dtb \
+	armada-395-gp.dtb \
 	armada-398-db.dtb
 dtb-$(CONFIG_MACH_ARMADA_XP) += \
 	armada-xp-axpwifiap.dtb \
@@ -1556,6 +1562,7 @@ dtb-$(CONFIG_MACH_DOVE) += \
 dtb-$(CONFIG_ARCH_MEDIATEK) += \
 	mt2701-evb.dtb \
 	mt6580-evbp1.dtb \
+	mt6582-prestigio-pmt5008-3g.dtb \
 	mt6589-aquaris5.dtb \
 	mt6589-fairphone-fp1.dtb \
 	mt6592-evb.dtb \
@@ -1608,6 +1615,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
 	aspeed-bmc-inspur-nf5280m6.dtb \
+	aspeed-bmc-inspur-on5263m5.dtb \
 	aspeed-bmc-lenovo-hr630.dtb \
 	aspeed-bmc-lenovo-hr855xg2.dtb \
 	aspeed-bmc-microsoft-olympus.dtb \
