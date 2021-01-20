Return-Path: <SRS0=HjUL=GX=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35880C433E6
	for <soc@archiver.kernel.org>; Wed, 20 Jan 2021 19:40:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DDC8B23440; Wed, 20 Jan 2021 19:40:48 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ABB5233FC;
	Wed, 20 Jan 2021 19:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ABB5233FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=michael@walle.cc
Received: from mwalle01.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 9D2F422F2E;
	Wed, 20 Jan 2021 20:40:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1611171646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TUNEdX1xsXS+xaqEvGcbFxFXSQhaIVG++G28Ywp3eJM=;
	b=FBuXTD1dmS90BuqPQyyFO2hpk8Ww6JjN1cuCvjA+UcmF0vesXkG74WtaD0WY7K6qaazNdt
	zBMnBfdGs7yZa2s6tnysQhpTe/4OpCuEozzlsgRvUJ0b/Tp2gavEz1xrey5NN8c+sgDR6a
	xNth+PTuSpquIZ0vYk7Y6U8CFXcHiSY=
From: Michael Walle <michael@walle.cc>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH 2/3] dt-bindings: arm: add Ebang EBAZ4205 board
Date: Wed, 20 Jan 2021 20:40:32 +0100
Message-Id: <20210120194033.26970-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210120194033.26970-1-michael@walle.cc>
References: <20210120194033.26970-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Ebang EBAZ4205 board to the Zynq-7000 board category.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 Documentation/devicetree/bindings/arm/xilinx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/xilinx.yaml b/Documentation/devicetree/bindings/arm/xilinx.yaml
index e0c6787f6e94..aaca69d0199f 100644
--- a/Documentation/devicetree/bindings/arm/xilinx.yaml
+++ b/Documentation/devicetree/bindings/arm/xilinx.yaml
@@ -22,6 +22,7 @@ properties:
               - adapteva,parallella
               - digilent,zynq-zybo
               - digilent,zynq-zybo-z7
+              - ebang,ebaz4205
               - xlnx,zynq-cc108
               - xlnx,zynq-zc702
               - xlnx,zynq-zc706
-- 
2.20.1

