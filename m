Return-Path: <SRS0=jpUF=QS=norik.com=andrej.picej@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEADDC433FE
	for <soc@archiver.kernel.org>; Wed,  1 Dec 2021 12:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E2A5C53FAD; Wed,  1 Dec 2021 12:53:40 +0000 (UTC)
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B8DCC53FCC;
	Wed,  1 Dec 2021 12:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B8DCC53FCC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=norik.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Q19agPjurI9/MfcQyw+8pqK2teR2OmX4WpJQds26Zes=; b=hHvKepOk5L1GgZt41+S7zF7Wh/
	a5LSfr7y9f0k/rraCON/Qi5yNWfTYE0fEJVj/qfs96p51EVa9Oq9bj+pRK35C1WDk7QP8F1TDo3nl
	N7V0CEsB5Eux7BradVmXPBlTOsfnjKndofaBUKPmxWmteSK08+m2nmRpbLwR0fCIfxrf8ToAM8D+Z
	hdMjcbYAz9zblW2N2av0DpSWaq/tKhahNPHu/DGt/f0zErQTwYvU73odKZyLf2gw7zJUpUHeeRw0B
	wxbVv26XrbKsyviUomQHNIc6+6qHzs0rvJ/Fz13vsLDm7rObB6x0afUZiH1G6B0r1VPFAtZQXDtm2
	H0PHf/Kg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37890 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1msP76-008Rde-6l; Wed, 01 Dec 2021 13:53:32 +0100
From: Andrej Picej <andrej.picej@norik.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Cc: robh+dt@kernel.org,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	leoyang.li@nxp.com,
	krzysztof.kozlowski@canonical.com,
	linux@rempel-privat.de,
	festevam@gmail.com,
	arnd@arndb.de,
	linux-imx@nxp.com,
	andrej.picej@norik.com,
	y.bas@phytec.de
Subject: [PATCH 1/4] dt-bindings: arm: fsl: add PHYTEC phyGATE Tauri i.MX6 ULL
Date: Wed,  1 Dec 2021 13:53:24 +0100
Message-Id: <20211201125327.3704500-2-andrej.picej@norik.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201125327.3704500-1-andrej.picej@norik.com>
References: <20211201125327.3704500-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add devicetree bindings for phyGATE Tauri board with phyCORE-i.MX6 ULL.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0b595b26061f..9c37f22b6c61 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -602,6 +602,15 @@ properties:
           - const: phytec,imx6ull-pcl063  # PHYTEC phyCORE-i.MX 6ULL
           - const: fsl,imx6ull
 
+      - description: i.MX6ULL PHYTEC phyGATE-Tauri
+        items:
+          - enum:
+              - phytec,imx6ull-phygate-tauri-emmc
+              - phytec,imx6ull-phygate-tauri-nand
+          - const: phytec,imx6ull-phygate-tauri # PHYTEC phyGATE-Tauri with i.MX6 ULL
+          - const: phytec,imx6ull-pcl063        # PHYTEC phyCORE-i.MX 6ULL
+          - const: fsl,imx6ull
+
       - description: i.MX6ULL Boards with Toradex Colibri iMX6ULL Modules
         items:
           - enum:
-- 
2.25.1

