Return-Path: <SRS0=97xB=JY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C58C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Apr 2021 21:03:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29C0C61073
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Apr 2021 21:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29C0C61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ywCkuThPI3OHvjLuFnmhoYFnUMm6DwsIrQ92bAezfEE=; b=eIHLG4P0wxhepvTcb6S4c7PbnE
	He7YLiaVTZcUuULJmSW+9XIr6b8hcq1YgB3YOmW4WlF+mBTzfGu7dunZc7+yqudG1smMx6P6ORGKm
	a9EjVX3xd3lhbG79M59sR5uYj1vPu3UowwDYPOzKwFFzpvc2Zv2lu1cie49tJ3T2MGFflkgfb0NW8
	Wqayc9JSpXz9JoTrCIBfKRZtzdvD7eosdu00i+9Cfp70rhs5AIXfl2ur3/iWkR/HG19JrpCu3L7gb
	cKmrlCj9KzPK6LjdYNP/QQUTz8Zl4z4N3eDoYJ4A4nCISeITqGjvzf2fVVdkYTo7wEyBAw6QU7L9j
	1zYEN0Fw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbUq4-002G0j-3T; Tue, 27 Apr 2021 21:01:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbUq1-002G0a-Vs; Tue, 27 Apr 2021 21:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:List-Id:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:In-Reply-To:References;
 bh=UZPJ+ss5XIjpYSN0k+GId1TVtOc2wLjVqBC24dS9fKs=; b=hlOgKXGom4iV3XfCkzYNQvCEuB
 ecWxCeSUX4u67SbSQWGnHZUaVlhf8Mx1NV9phXTRQ+xeRH4vG2Bg6DfYBWlP6ffXk+21QdvhEOJow
 fnZ2avTJ7Zh7wTf8H7+h7Z1L1/h/k8IZzDXZbVc87/V0IGGf6Bn+/xpapFmjDH0pHGY66YbdHjMof
 6fJ4KMG41ipLZyFlYo3IZxtNEX02zIpW7/2wL2OHG3N/+dymJCOlITit1tf4eMe+kU7L9XvI1WryP
 erH437D7pGOPn4gyRMRmIPNgP7pZOoAKFq9vGOcCKP6lQsF7kgDPdphy6yHp+bsK7X/2+IiCApMYv
 /OsWJi1A==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbUpz-00H0bI-Hy; Tue, 27 Apr 2021 21:01:44 +0000
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
 Matthias Brugger <matthias.bgg@gmail.com>, Ryan Wu <Yz.Wu@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: nvmem: mediatek: remove duplicate mt8192 line
Date: Tue, 27 Apr 2021 23:01:08 +0200
Message-ID: <20210427210121.1080364-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_140143_654385_DA7F0B97 
X-CRM114-Status: UNSURE (   8.96  )
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
Message-ID: <20210427210108.uFLqJvmTCbIXb8hiVuA7LlowztmJ7xchSkf-IVdvVvs@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
