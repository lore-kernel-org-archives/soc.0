Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CA8C48BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 22:14:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB86E613CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 22:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB86E613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XF5E2QYDZgyVfWcTJgaC/VEm+4H3kx2J8oF4N3Ekhv4=; b=MVd+xBbpgJ4JHL
	fOEqXyM38kAGXq+pWLCDo5cffI29H+QLaI+AWbmeGLf/K7EE5nM1oWciGZWhwSxTRk8ZqfqVwhx9n
	AuF6h3dFHOrKGEsY18WBp77ZhdU9QuR7MQRte07rf+Lkq06Um4ntk8f3smt6Kmg0nnj+8Q3SO49kb
	jOcgc0tBeAp+K2Yxl8phzwXgHrlcHJUVaTJtcZKJ5R5F1rnbyggrHrPEl1Sn4HCiY3enRVUlD3y+Y
	Uu5gBmTZa+600m8RQpobteKRhjVd4wvnw6IYLAR5hSt2Jvy38J38kbcIlTS6gcVkp5a3OQ3g6e7v7
	07STP7+4L94JpS2v5VdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrpM5-007H6Y-5J; Fri, 11 Jun 2021 22:10:21 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrpM1-007Gu2-OW
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 22:10:19 +0000
Received: by mail-lf1-f48.google.com with SMTP id m21so10637046lfg.13
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Jun 2021 15:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v+CJ5jUjZTJX38svdKnOCuqWhdmCpbOqqtQIHkEjacI=;
 b=fqbyauwdHI6UcTK9bXEswNQ7KAH9to9Xs7Wn5DEYI5uuvw/F7tZJIsx787g3/IBxMX
 A4JUp48EUg+Wuny2KPcz+Zyh1pI+jYgwyjQA0Qmd0ksGdmwX9fHAdrkACgJbQnqAVE59
 I05mI9zYPhWxfR+PfYhs1cP7zJ5pCAF4H4I1MfjC7+q+8RI5cFWUskYd2Kf83zH3Qi+N
 74UatAJqWpoxkNifFMzvX65/MjxD1QjPFZL1FBugGMeE3S3YhBI/PmfmKqMIIEEJJ8LA
 7Y8mUlLfBNSrx8MzPAdbtFnohj9cRQu6Hp98kybbYyFtInIVPPK/tJFagBM7ZXIRflF9
 zMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v+CJ5jUjZTJX38svdKnOCuqWhdmCpbOqqtQIHkEjacI=;
 b=FmckvX4fM97SQJYBvuSC+ZdB9ano0AhDY03nzWFfDAc3FqkakB3t2rM/Vh+Tq3f0q3
 v3k1r6PI7S4puDkdhQETt9nrw9DTfT6jXUW5gETdCkvgjZZuxtw2Ka86+AXP2HyPHGHM
 BYr+VWuwS0L84upEATyr7AiJoGlHF3wSuyorAb/BWxD229bfDPQEHAltlaB8R0d2S05u
 3G9Ox1Li5y+C6THe4CnOPckn+faVPnIsjpyw4iejb+i5bT8K7KpT2NhCnNCknBDtn9HU
 gey2ho595kuCV8EgV0B+tn42hK8+bffMHdCKbRsoTcE5nXO+ZjdyEFIWnT+w5BzwGWpz
 o5UA==
X-Gm-Message-State: AOAM531Rh1ZPTnLNn9oGoowV+uZjr3Z0Ujb4rORG2qx8TRkXzN5DW2df
 NFvZzdD0vUulQhcwGbVrfqw6tw==
X-Google-Smtp-Source: ABdhPJy0xiGIQY6+yzGWZvlXFN+IXa8zqzzs+65ulnk5JrYeG26hyq3t0ogjcFc9r1kkY3pJnGSL2Q==
X-Received: by 2002:a05:6512:31c5:: with SMTP id
 j5mr3902549lfe.116.1623449234293; 
 Fri, 11 Jun 2021 15:07:14 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id u25sm705454lfm.308.2021.06.11.15.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 15:07:14 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Corentin Labbe <clabbe@baylibre.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: gemini: add crypto node
Date: Sat, 12 Jun 2021 00:05:01 +0200
Message-ID: <20210611220501.684997-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_151017_855821_D45A60BC 
X-CRM114-Status: GOOD (  13.07  )
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
Message-ID: <20210611220501.fgk_6KJrUQ-pu8fnekCTd4_JMPwNUPMNd5gfhM7e9Fc@z>

From: Corentin Labbe <clabbe@baylibre.com>

The SL3516 SoC has a crypto offloader IP.
This patch adds it on the gemini SoC Device-tree.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi SoC people, the crypto driver for Gemini made it in
to this merge window as well so please merge this DTS
snippet into the same branch as the other Gemini DTS
changes for this merge window.
---
 arch/arm/boot/dts/gemini.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/gemini.dtsi b/arch/arm/boot/dts/gemini.dtsi
index e5c15fe71a35..cc053af3c347 100644
--- a/arch/arm/boot/dts/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini.dtsi
@@ -357,6 +357,14 @@ gmac1: ethernet-port@1 {
 			};
 		};
 
+		crypto: crypto@62000000 {
+			compatible = "cortina,sl3516-crypto";
+			reg = <0x62000000 0x10000>;
+			interrupts = <7 IRQ_TYPE_EDGE_RISING>;
+			resets = <&syscon GEMINI_RESET_SECURITY>;
+			clocks = <&syscon GEMINI_CLK_GATE_SECURITY>;
+		};
+
 		ide@63000000 {
 			compatible = "cortina,gemini-pata", "faraday,ftide010";
 			reg = <0x63000000 0x1000>;
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
