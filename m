Return-Path: <SRS0=+cAE=PB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8D6C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 14:40:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5C9A610E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 14:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5C9A610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oo/YJJbN74Z3nmUPjzw2GMTSj+xoMfL25P+2P+FIgk=; b=vbcP/DjKiWD/an
	upW55Eho85I+Fh1SeiT6bRwMEqqFbMW+r9M1MOkbNKV4xt9r87ngkG1Pt+0lHk7jRCkKirHgGpFy7
	4YDFx/9r/e+Pd19BHMCAPhnMWo8zbs5m16ZL6Cly9vLeZWhtx/W986KGkyYdv0fXzmLromMYI+N8R
	GA8Suq5+4pZ8Zr698IEvAjVoUXs6B6Woz8jxVOjAonlYLp55eFXDlDVkr4Ody23mlcB2N22xravYX
	9TCL4R4KAylX3g+Qx2KvDKESh97MsN+e/yy1TM/YbaB6HpCP4K0heCoXkqhNcmOq5oCb0x7+KXz2r
	Id9tW2qu09QkndBYJ18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mafOq-00HBn9-P8; Wed, 13 Oct 2021 14:38:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mafOm-00HBmL-Vn
 for linux-arm-kernel@lists.infradead.org; Wed, 13 Oct 2021 14:38:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3F83610A2;
 Wed, 13 Oct 2021 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634135908;
 bh=pKAOnpyNJuH6mLdV9073fxUIwetuDafsmOfvDdIRucA=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=iFmzELGTJbaYDy5hDE3CkewtspqSh3XDRou4fSHcLaMqPPxF3GbQ24FihxnjvlN/2
 LPte7I6suCAMCGzOnotci6srObn+QnEisraz3Q42Te22NEjw+I9QLb6lmmZCvdAxGr
 o3u3EWV6p8vkKL30SyQjpDrR7beKu7q7XcsbBFmhZT/vyUMS2orMKx5ac1u2AtFYDa
 mA2+TRo6YYGWrIGlkMcCHQyShqimvFIKit1bmmLSfrvxHT6C763MTRJz+57y0qyZUr
 Cuy8V3CgT6Gz7eY7O5Baxas7CHjm7CvCG6upGrE5dUpte+jOoALJNJmfVwBiJVHcx9
 Y/FyJACtGRC7g==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chanho Park <chanho61.park@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: exynos: fix cpu unit name warnings
Date: Wed, 13 Oct 2021 16:37:44 +0200
Message-ID: <20211013143810.2101838-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211013143810.2101838-1-arnd@kernel.org>
References: <20211013143810.2101838-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_073829_060107_213A31A4 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20211013143744.caxMt32pqbKFMbKd_XpISelcE6Zu7zxKLuHeNLAs2e0@z>

From: Arnd Bergmann <arnd@arndb.de>

dtc started warning about some of the CPU addresses:

arch/arm64/boot/dts/exynos/exynosautov9.dtsi:78.20-83.5: Warning (unit_address_format): /cpus/cpu@000000: unit name should not have leading 0s
arch/arm64/boot/dts/exynos/exynosautov9.dtsi:85.20-90.5: Warning (unit_address_format): /cpus/cpu@000100: unit name should not have leading 0s
arch/arm64/boot/dts/exynos/exynosautov9.dtsi:92.20-97.5: Warning (unit_address_format): /cpus/cpu@000200: unit name should not have leading 0s
arch/arm64/boot/dts/exynos/exynosautov9.dtsi:99.20-104.5: Warning (unit_address_format): /cpus/cpu@000300: unit name should not have leading 0s

Remove the leading zeroes.

Fixes: f695b3f4c45d ("arm64: dts: exynos: add initial support for exynosautov9 SoC")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 1dd1d73a52b8..284a7adb474a 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -75,28 +75,28 @@ core3 {
 			};
 		};
 
-		cpu0: cpu@000000 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0>;
 			enable-method = "psci";
 		};
 
-		cpu1: cpu@000100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x100>;
 			enable-method = "psci";
 		};
 
-		cpu2: cpu@000200 {
+		cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x200>;
 			enable-method = "psci";
 		};
 
-		cpu3: cpu@000300 {
+		cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x300>;
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
