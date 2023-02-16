Return-Path: <SRS0=BIW0=6M=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2699CC636CC
	for <soc@archiver.kernel.org>; Thu, 16 Feb 2023 13:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E20BCC4339B; Thu, 16 Feb 2023 13:16:16 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6651C433EF;
	Thu, 16 Feb 2023 13:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6651C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676553374; x=1708089374;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DL5Q1SD6gefZMi2w6bHvNhOIfkmdJdtrS+ULofmUJaM=;
  b=fck5Wi4/ojNeEzov67SZxYL1COiH4TKzPy0YRtOBa9MESkIxyH5gGTsE
   3/iyoehQt1nLKwpSPQY7NnFg58ZK3Y3aWPpPpQaRWErBr0znNlK9b4nf2
   G56jlFyVYA4lVaxGNgJZh0r5bIyKP10o2fNw/B5obwFa94lOWJsnaUxKE
   iXq2rQ3iqiCSrn0RmpFzzshRFFbK3vxalbF+bq3SE6pWYiyiF8gAiFcIL
   zbOwTRsiTonGXVbiTnosWfPaarFd/PtXt/t/OPhCA/Xk08f4JaKgS+6GC
   xwBq5N/vFYHvkOsrKzLpS6hoh/ETUvsJGtG55cQq8LWw48Mcu4HczZE1X
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,302,1669100400"; 
   d="scan'208";a="212326806"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Feb 2023 06:16:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 06:16:12 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Thu, 16 Feb 2023 06:16:11 -0700
From: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Conor Dooley <conor@kernel.org>, <soc@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v1] dt-bindings: riscv: correct starfive visionfive 2 compatibles
Date: Thu, 16 Feb 2023 13:15:12 +0000
Message-ID: <20230216131511.3327943-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Using "va" and "vb" doesn't match what's written on the board, or the
communications from StarFive.
Switching to using the silkscreened version number will ease confusion &
the risk of another spin of the board containing a "conflicting" version
identifier.
As the binding has not made it into mainline yet, take the opportunity
to "correct" things.

Suggested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Link: https://lore.kernel.org/linux-riscv/Y+4AxDSDLyL1WAqh@wendy/
Fixes: 97b7ed072784 ("dt-bindings: riscv: Add StarFive JH7110 SoC and VisionFive 2 board")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Arnd,

If this is okay with the dt folk, could you please send this to Linus
in the merge window?
The dts for this binding hasn't landed yet so this is a standalone
"fix" on top of my earlier dt for v6.3 PR.

Thanks,
Conor.
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 60c7c03fcdce..cc4d92f0a1bf 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -26,8 +26,8 @@ properties:
 
       - items:
           - enum:
-              - starfive,visionfive-2-va
-              - starfive,visionfive-2-vb
+              - starfive,visionfive-2-v1.2a
+              - starfive,visionfive-2-v1.3b
           - const: starfive,jh7110
 
 additionalProperties: true
-- 
2.39.0

