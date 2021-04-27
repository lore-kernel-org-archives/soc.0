Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716FCC43460
	for <soc@archiver.kernel.org>; Tue, 27 Apr 2021 21:01:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3FDB66100C; Tue, 27 Apr 2021 21:01:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBB3B61007;
	Tue, 27 Apr 2021 21:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619557302;
	bh=NibKqGfbz0ggVjPdtiJlKt4ooaw/9XutwuciM3Cur+A=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=gacBkO/OADbWS4U66IO9J2wRBtpwVLfuZ3RnzzOrFZ13XLfrzPO6C0mJpOTWgLHU9
	 Qsl4nMI2xONrI/PfZ6hfGyHE3+gyF9s1w0MJEo7ezB2jjWtPbI57tusNP307a5H+J/
	 WtX6K7hruZiCWYoZTfjbyN2o6NLcQc3LOZnWmjHGdKQOyN9UDrOK607V02fgry2kwX
	 FACuKdD9A72kqNr4Lt/BiDHxWpkAdtz3koenHvqc7pBuetQgMNYb/YhJ5gMo2nwsdX
	 bDFpDyFd0cY+NEQvQ1nPaLZGn/qnDdmalWObIE0LdXcfVuyFKse1B68A33CfYjSEZ3
	 wtz06W3DeRMbg==
From: Arnd Bergmann <arnd@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ryan Wu <Yz.Wu@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: nvmem: mediatek: remove duplicate mt8192 line
Date: Tue, 27 Apr 2021 23:01:08 +0200
Message-Id: <20210427210121.1080364-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The same patch was accidentally merged twice, resulting in a
duplicate line for the mt8192 SoC.

Fixes: f2674c0c7488 ("dt-bindings: nvmem: mediatek: add support for MediaTek mt8192 SoC")
Fixes: 2a1405a14c3a ("dt-bindings: nvmem: mediatek: add support for MediaTek mt8192 SoC")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
index d479ad977e24..2f2895b1f06d 100644
--- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
+++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
@@ -7,7 +7,6 @@ Required properties:
 	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
 	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
 	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
-	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
 	      "mediatek,mt8516-efuse", "mediatek,efuse": for MT8516
 	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
 - reg: Should contain registers location and length
-- 
2.29.2

