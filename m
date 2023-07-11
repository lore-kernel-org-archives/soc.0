Return-Path: <SRS0=td2K=C5=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38126EB64DC
	for <soc@archiver.kernel.org>; Tue, 11 Jul 2023 09:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04799C433CA; Tue, 11 Jul 2023 09:26:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id EFED6C433C7;
	Tue, 11 Jul 2023 09:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EFED6C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52DA12B;
	Tue, 11 Jul 2023 02:27:03 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0F4B83F67D;
	Tue, 11 Jul 2023 02:26:19 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	arnd@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: nspire: Fix arm primecell compatible string
Date: Tue, 11 Jul 2023 10:26:17 +0100
Message-ID: <20230711092617.1412815-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c44e0503e5fd ("docs: dt: fix documented Primecell compatible string")
removed the last occurrence of incorrect "arm,amba-primecell" compatible
string, but somehow one occurrence of the same is left in the nspire platform.

Fix the same by replacing it with the correct "arm,primecell" compatible.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm/boot/dts/nspire/nspire.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Hi Arnd,

Couldn't find any maintainer for these platforms, hence cc-ing soc@kernel.org

Regards,
Sudeep

diff --git a/arch/arm/boot/dts/nspire/nspire.dtsi b/arch/arm/boot/dts/nspire/nspire.dtsi
index bb240e6a3a6f..088bcc38589f 100644
--- a/arch/arm/boot/dts/nspire/nspire.dtsi
+++ b/arch/arm/boot/dts/nspire/nspire.dtsi
@@ -161,7 +161,7 @@ timer1: timer@900d0000 {
 			};
 
 			watchdog: watchdog@90060000 {
-				compatible = "arm,amba-primecell";
+				compatible = "arm,primecell";
 				reg = <0x90060000 0x1000>;
 				interrupts = <3>;
 			};
-- 
2.41.0

