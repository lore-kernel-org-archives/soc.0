Return-Path: <SRS0=k/QS=CV=inventec.com=Chen.PJ@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D98FC001B3
	for <soc@archiver.kernel.org>; Mon,  3 Jul 2023 06:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2EAD6C433C7; Mon,  3 Jul 2023 06:02:36 +0000 (UTC)
Received: from mail.inventec.com (mail.inventec.com [61.220.76.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E882C433C9;
	Mon,  3 Jul 2023 06:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E882C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=inventec.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=inventec.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
    s=sEx04; d=inventec.com;
    h=from:to:cc:subject:date:message-id:mime-version:content-type;
    bh=dcvSYvSNU+uro1iISYrrd705f26G2TyH8iwSt1QWGqw=;
    b=F1xPnoJHvZqlIreIR6YNJPq+bwax2spNTD7mELdYYf+LL4KqyVSzYRNa8pLsw9
      HqViQNcAUSYXLqvjCa/AorI4BgAvpaw+IYtz+uup/ljw/YuPZV//BZFLeACo/G
      W2LWo1rL+f8WhwaOiv9HyhtNizBciMlUd7YNE/Ui3HK4dAI=
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 3 Jul 2023 14:02:24 +0800
Received: from TAO-MailRelay-1.iec.inventec (10.6.254.133) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 3 Jul 2023 14:02:24 +0800
Received: from charon ([10.6.141.37]) by TAO-MailRelay-1.iec.inventec with Microsoft SMTPSVC(8.0.9200.16384);
	 Mon, 3 Jul 2023 14:02:23 +0800
From: PJ Chen <chen.pj@inventec.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>
CC: <ye.vic@inventec.com>, <Huang.Alang@inventec.com>, Chen PJ
	<Chen.pj@inventec.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: add Inventec starscream-bmc
Date: Mon, 3 Jul 2023 14:02:21 +0800
Message-ID: <20230703060222.24263-1-chen.pj@inventec.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2023 06:02:24.0048 (UTC) FILETIME=[EFD1AB00:01D9AD73]
Content-Type: text/plain
X-TM-SNTS-SMTP: 3E1DF7C11C547A2FC99E3D2474257FEF65628B9BCDE1CD7826B620155397CAE42000:8

From: Chen PJ <Chen.pj@inventec.com>

Document the new compatibles used on Inventec starscream-bmc

Signed-off-by: Chen PJ <Chen.pj@inventec.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 1b585e554791..fb4ce5df2fa0 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -82,6 +82,7 @@ properties:
               - ibm,everest-bmc
               - ibm,rainier-bmc
               - ibm,tacoma-bmc
+              - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
               - nuvia,dc-scm-bmc
-- 
2.25.1

