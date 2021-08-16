Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE53AC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 06:49:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C4CB61A59
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 06:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C4CB61A59
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NRgUhmLzWHe+nOBKOP1t5Gj2v+PBPwPBISFj4DtpGA=; b=A0VWQgC2H9JPpc
	7i4xTEucBHnC048HNBtnbkdTgyviNb/9esM4/dX83CFoBzlS/TEbYOg5wijFKclg4nxZeUH44PJDC
	tIYTyhl4HC7eu70e3Y1ne9VL9YMQwko+3i50219tH9WC2Fsi1q9bAPqwI+il/GM/mm95WjdszDZ98
	zEOK9r5ktyaKr6iqTYH8RqZRQTR0wjE/B+nLAW0kvB7YJ2Th4R7KWOji2vlczIx3gXfi3Jg0TJUsb
	v3Rtro+ZHJ/HcL5A4ctDobQprBDlLg2eHL7u1Lr5yVpS9lTs9e9AD26j91pqaTyIcecdH6SUBzsiM
	lRD5DkCGlG+5rffflHUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFWOm-00GGSo-Mk; Mon, 16 Aug 2021 06:47:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFWOJ-00GGNC-Ug
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 06:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629096395; x=1660632395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yFsxGY63YCvB8utk9S62cEz1WklCguNPzTa34XrLuwU=;
 b=JJNQmcQr6U21FXIdxpbmU8RctCQn2TRGos0NnaYKL91EvgzFKzzPfuPZ
 UbyaJz1S8NQy9TTbAoGb8ArErPR8pMVCPmv1TbxZbUQa7HNiQKlH97HUF
 oLZBn2lUSrxtG/ZokGOwWfLTXir0xrq1x/AHVE8vpQjczUbpPd2IbHQsD
 cP9w4gF2UHWWSCL3bikJfvYrkc7xu3U+AQsbAkUG4FoMxucX39ZEYhp0h
 fRPGqgwYz1xCCZxTzZews/cAkrwQxYoNtnZa2ou3/H0BijjTSoKMSs2qx
 OAHcSHuVFLcggcGfIBc60yibf+t78QFDK6jmuxKNCm0zwpRwLA68BmsCb g==;
IronPort-SDR: JtoqbsWL+cJ7sK1DWD+NVxqcGWDmvX5HBgdasW+7e7hbO3dnZF322w4dR8FBXvTi57TRTskreg
 NhTXd4Ab/hOqfsMSLDPHuLAA8z+7XBZ88xC37R5u07+lr8rt+rpDwMIq75dvcCdKCH+pjpxKFp
 O/eE820EhP6d8SAzOydSc+8evPO6uy+HH/9CjgK5YDo/Wg4Zz7Q9ZvkjSHrHE5ZxVQNFhsjrFr
 TPCaODGrzWavm1gsCNis0xlJvOn4QN693fdZVAYTNfDUCyol4dZWXRdQaje2415qLaXXm5zm+f
 4deng9hlAArZExfPtKmewfOW
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="140220940"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Aug 2021 23:46:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 15 Aug 2021 23:46:34 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 15 Aug 2021 23:46:31 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 3/7] dt-bindings: ARM: at91: document CalAmp LMU5000 board
Date: Mon, 16 Aug 2021 09:44:12 +0300
Message-ID: <20210816064416.1630674-4-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
References: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_234636_042580_BFAC34D8 
X-CRM114-Status: UNSURE (   5.96  )
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
Message-ID: <20210816064412.LzHAiZCwrOwaO1T54MBhqx0iescphCE5BDnsvjLaZ1c@z>

Document CalAmp LMU5000.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index fba071b9af1d..a9ab18510fef 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -126,6 +126,12 @@ properties:
           - const: atmel,sama5d3
           - const: atmel,sama5
 
+      - description: CalAmp LMU5000 board
+        items:
+          - const: calamp,lmu5000
+          - const: atmel,at91sam9g20
+          - const: atmel,at91sam9
+
       - items:
           - enum:
               - atmel,sama5d31
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
