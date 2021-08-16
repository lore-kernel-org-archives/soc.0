Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A185C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 06:50:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3348E61A6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 06:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3348E61A6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRuYoYcBRXMiNH1Yqn55jtpaC9k0W+tGO8QisSXqKoQ=; b=huvNI3hsI55pMb
	OIjoVhk393EMQ9VkTgniyHh3r4OEpXYaRjH5MAIq43IlQmzvrRxQdHjcLjtBmdQgUHl3nGbUbXTJW
	Aocn1CGpq38xsvCz2iK/gQg2jICvUm77zSm7Ulql2NmrgErfeOzDsymogcc6wZ+Z0LaS3+7lQuISR
	mpEs+ZiJhTjxFLkyoc88S/b5DlUKf62AUZjcULkf30l95a1CI2/ZRI25Kw2vmfJlh3VfnZqKLQO63
	CaJn+sYjx7fYaRLvEQ6Kq754cQZ/VGtBRaeVNHZjwpqzC+O392rR4mfsF35RuXA7kC+6xZfjkaMDt
	uzUiONQhJFESUB63xkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFWPU-00GGiU-6N; Mon, 16 Aug 2021 06:47:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFWOU-00GGON-9r
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 06:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629096405; x=1660632405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Z3xraYJn7692GEB/jLqBPc8LmMxKZXlwCBT3w0+7ps=;
 b=2Ct7RYUiBCYZcRLaPPQqxh99Yr5sBZRHCZufC3aZ6BWgm2DjmnlEMM80
 E+UNZg6DuxXqTbsb9UtF4zziWcMW6GxjxtZEqG7DGorrpocQCL3Yr9caB
 J5XpGH+7hSdYdAfE0++7ADBdAdSXggks0eB70pqVIPhx0tN4Vx6BLem1i
 oEmos+6ryOjT343ESS3DC9ThFNzOnTsdpiAaHJmYuDN5tPZHPwm20tuAR
 uq1wYL5MsPoa7+tk3BOVlTSzZQouesRrnZSEe4At/4CsC08Ld7w4E/nAf
 xJTtutvWnHf2nxCC1hZGK7s6o7sSYUoRnothSYkedbZ6ppkVbms+8dZUZ A==;
IronPort-SDR: zf9DVFLod6Y7SAxc450FpmHIpB25uulwjCARvsisoyxU1x0yJRqdW1pgSSTdFmXYF5NwiMzqx7
 77gjFjqn3WhOg7CwdRjFUY/qCW9C/iXv9xq7pVBXSPYvTIouOTgktonCt0Yne5y4YtoFNwENMB
 fEn4QKhxXBEszjKae0EdA0t00EuCjPG9qdO+LMgF9z7KKdzEK/PktDLi25HFQTdnQw3s5EOwK6
 YF7SVCwpRXRnc36GL6xlXo6abnoCsfsUIFiMk+hW2MM+o+0nVBN6SuMAjbKYU+qu4vE6wmH+2r
 lrKetvvnNGqjXJdTnY+dtQQs
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="125900538"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Aug 2021 23:46:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 15 Aug 2021 23:46:42 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 15 Aug 2021 23:46:38 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 5/7] dt-bindings: add vendor prefix for exegin
Date: Mon, 16 Aug 2021 09:44:14 +0300
Message-ID: <20210816064416.1630674-6-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
References: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_234646_437231_64C1CD6D 
X-CRM114-Status: UNSURE (   7.33  )
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
Message-ID: <20210816064414.bi-hCGg-x7cUKZjHC8wUmjNgiZzVEPX6qubUg8XtXM8@z>

Add vendor prefix for Exegin Technologies Limited.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 8cf2ed41537a..61fe4778498d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -393,6 +393,8 @@ patternProperties:
     description: Exar Corporation
   "^excito,.*":
     description: Excito
+  "^exegin,.*":
+    description: Exegin Technologies Limited
   "^ezchip,.*":
     description: EZchip Semiconductor
   "^facebook,.*":
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
