Return-Path: <SRS0=60Ah=JN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0A7C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Apr 2021 14:42:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B992610CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Apr 2021 14:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B992610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NQxkLcxMhO2Uoy9jla/d/cTHmaiB7aTiNSY9/ej0s/I=; b=GcZCWQzSqEwWRShXITbKbkvoG
	CLZT+D0yRkjVolJh0IZhf/0FJ7yE5ONUK7LdL1bufAD5KDecVfrxrZcB4PrTKRzZ8zyloSu0IFsnl
	gYemdcTRmcYD53bI5sc0ZC9i9UxxrFG6+3zWxTO/gwNd9YcKXNQEFyzHaINQUgnTxIzUbTXFEo7YY
	QaUkCJ8VUZtFGUbSxHWGh1LVwapjqtvUijPKvHVySAg0alB/nE421zB7NYLCp56+5Qy9burfDCscZ
	7DNkVZwRo8hvJPxozjfUcQ4iGUNLnJWW6jfyy4DG4JSdNScTs2Ro6rthMapLwWo6TZPbP7GEbwyeM
	QfeQfbwbQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXPdk-002RLw-4D; Fri, 16 Apr 2021 14:40:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPdG-002RBk-9p; Fri, 16 Apr 2021 14:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:List-Id:
 From:Sender:Reply-To:Content-Type:Content-ID:Content-Description;
 bh=mwmo9RTaSPmXS8kJi+WCULDJlnKsElr57ksw3WFcngE=; b=HBH5cATlNayPZaFr87aLQQWTXy
 /jRK1bzxC/Jv+eBdiS9HOjnQTLWxNQYfB4DsM/gfyiZXdBnh4pa5PNHy5rq7SK8MCy9rCN8bwLWaR
 7AVurr/G2ppX+nVOggMGFo7TsNKgRz590xic/24I1xNyJkMS4jEQbkNAe/Vjb8L15zEwL8xg6Nlbg
 QOa+ywa2mLlfl2YJ7AfLQ8DkKI9BqTQMFWB/mMn2uob/eK1MUKp4hIB1t/E+/ThE2xxDx0pMoPy1+
 TgEFKnzcvKIDxEriSuxfGntasw2USZqfE6mUJo8CF19dxKVzaXQrQf+jW3ANa+0VXfZN2NQWPvLyt
 YSM3qRWg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPdD-009Scb-0w; Fri, 16 Apr 2021 14:39:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F938613B4;
 Fri, 16 Apr 2021 14:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618583978;
 bh=iR54IzMf1S6kuxyIla+yy1tc43W+FXsmvIuG/2BQeqI=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cwQBpC5q+qTkUAqpGv3l8e+mkhSp4zH53rc/2YUp+yJEVYyKZ0Hrba2IxG3MYG5Kn
 +apVvMR/cv/jJgSZz8zbOhlRLk+s/ZffuyPjYB+PK1TmN15x1YurjgSIdDlWggWS9+
 hf+mMipckFclqk9qukrS76JV9JSQAblGLcSON/27Tu3nAr6haJHr4jT+HeKUhi0CVO
 bbf/FGEiwCFXe8wUfkXFOilG0aaozsMj+Z9l/uf//vD5exQlGKkK7j3767cyjfYWi/
 dDGxr8rB59rHPww3r1Gat0VpAVCl/h7BjI/+VxiCDZjKZGgJUWHY1UFY/sWvznImlG
 cigyZCJGLojmw==
From: matthias.bgg@kernel.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mt8183: fix dtbs_check warning
Date: Fri, 16 Apr 2021 16:39:23 +0200
Message-ID: <20210416143923.23406-3-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210416143923.23406-1-matthias.bgg@kernel.org>
References: <20210416143923.23406-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_073939_103380_DCE6AF5D 
X-CRM114-Status: UNSURE (   9.93  )
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
Message-ID: <20210416143923.AwPzzzEgW1RFoxMWgeIVZh6n25w_h8XRXPZUFNVezhA@z>

From: Matthias Brugger <matthias.bgg@gmail.com>

Fix unit names to make dtbs_check happy.

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Link: https://lore.kernel.org/r/20210414144643.17435-2-matthias.bgg@kernel.org
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 0ff7b67a6806..c5e822b6b77a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -681,13 +681,13 @@ cpu_thermal: cpu_thermal {
 				sustainable-power = <5000>;
 
 				trips {
-					threshold: trip-point@0 {
+					threshold: trip-point0 {
 						temperature = <68000>;
 						hysteresis = <2000>;
 						type = "passive";
 					};
 
-					target: trip-point@1 {
+					target: trip-point1 {
 						temperature = <80000>;
 						hysteresis = <2000>;
 						type = "passive";
@@ -1103,7 +1103,7 @@ u2port0: usb-phy@0 {
 				status = "okay";
 			};
 
-			u3port0: usb-phy@0700 {
+			u3port0: usb-phy@700 {
 				reg = <0x0700 0x900>;
 				clocks = <&clk26m>;
 				clock-names = "ref";
-- 
2.30.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
