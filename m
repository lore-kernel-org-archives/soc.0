Return-Path: <SRS0=8GTC=VF=aurel32.net=aurelien@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E80CC433EF
	for <soc@archiver.kernel.org>; Wed, 27 Apr 2022 23:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 236BBC385B0; Wed, 27 Apr 2022 23:36:33 +0000 (UTC)
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E1AAC385A9;
	Wed, 27 Apr 2022 23:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E1AAC385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=mcZNMidGbI3QR8Qt+O+V4KAmj1ZTFMV4YJOKIvJrc/o=; b=uqT/3MFkZUPeR3Qs4qBxKqyiOg
	aUXNrRn+Im8GqeQ1L3IItVBItxz4twbQl9NAzElSthGHnzk5m5osuEEiYBefel5O8Q0nVVSXHtm3c
	fa38+wL18hK/yLOH9mGR3fzmIuLTFSWouEit/reb1QPm2LGg1U3+4A5Dbi/ib3ZflnKNLjRrlnSdn
	4+xLsT+CiRS7MKdr43dh1Uh4iVVIZTW0edkgFE2iuo/MpCUm6xZwSsfPh5jOtVbofkb6xcQuu8241
	zSK1U9TcQBHyVZmm1LBj0w2zGBCVcTLmB9XSAmKpKipfY8uvF8Y0oEAgdeNnspKakp8KX2aIP/L6j
	SGfuey6w==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1njrCe-006YNT-DN; Thu, 28 Apr 2022 01:36:12 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.95)
	(envelope-from <aurelien@aurel32.net>)
	id 1njrCd-0058nF-37;
	Thu, 28 Apr 2022 01:36:11 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com
List-Id: <soc.lore.kernel.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	soc@kernel.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH RESEND 1/2] arm64: dts: broadcom: Enable device-tree overlay support for RPi devices
Date: Thu, 28 Apr 2022 01:36:06 +0200
Message-Id: <20220427233607.1225419-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427233607.1225419-1-aurelien@aurel32.net>
References: <20220427233607.1225419-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the '-@' DTC option for the Raspberry Pi devices. This option
populates the '__symbols__' node that contains all the necessary symbols
for supporting device-tree overlays (for instance from the firmware or
the bootloader) on these devices.

The Rasbperry Pi devices are well known for their GPIO header, that
allow various "HATs" or other modules do be connected and this enables
users to create out-of-tree device-tree overlays for these modules.

Please note that this change does increase the size of the resulting DTB
by ~40%. For example, with v5.17 increase in size is as follows:

  bcm2711-rpi-400.dtb       26481 -> 36830 bytes
  bcm2711-rpi-4-b.dtb       26537 -> 36886 bytes
  bcm2711-rpi-cm4-io.dtb    26426 -> 36945 bytes
  bcm2837-rpi-3-a-plus.dtb  14133 -> 19740 bytes
  bcm2837-rpi-3-b.dtb       14310 -> 20006 bytes
  bcm2837-rpi-3-b-plus.dtb  14670 -> 20474 bytes
  bcm2837-rpi-cm3-io3.dtb   13680 -> 19266 bytes

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/arm64/boot/dts/broadcom/Makefile | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 5082fcd1fea5..0aa8ee2afdd5 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -1,4 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
+
+# Enables support for device-tree overlays
+DTC_FLAGS_bcm2711-rpi-400 := -@
+DTC_FLAGS_bcm2711-rpi-4-b := -@
+DTC_FLAGS_bcm2711-rpi-cm4-io := -@
+DTC_FLAGS_bcm2837-rpi-3-a-plus := -@
+DTC_FLAGS_bcm2837-rpi-3-b := -@
+DTC_FLAGS_bcm2837-rpi-3-b-plus := -@
+DTC_FLAGS_bcm2837-rpi-cm3-io3 := -@
+DTC_FLAGS_bcm2837-rpi-zero-2-w := -@
+
 dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
-- 
2.35.1

