Return-Path: <SRS0=eyM4=HY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577DFC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Feb 2021 10:10:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E96176148E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Feb 2021 10:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E96176148E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pascalroeleven.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=83jcCYk1+cpjVTA6X1rkt357ek5Fq7Cp7yjk+al02FA=; b=hiW6RVRt69/vq1Yjkf8yMImGw
	KEMQpebCATmCtm1+1EcwoOCc/xcLkvRyW02pLsunvN9trhiTsQbMrp7QUyR2xq3/qNjhtGdL6iJx2
	+2t7eb1X38FfEtgKRfPm23WSvSI4sOuIlBMT5MURdt/XmbBHjMqxi7UfsZkL0Cr5KW8hjyuwHEr4j
	7v1ljfogp1EHlOwmDAh+2CXIidk0/h87KTI3oslb3co/s6rp9vTzJoYSLIp9lFxAbKfriGg7oj0r0
	muJsx74NGz4JXFqtWaS+GOYSrsMQUkLIiXK7oD8yEZ5NzesH//W4ud10P0rdk8IRT4ZKAcRCeUEkB
	AzKHOA9NQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE89F-0004wt-TS; Mon, 22 Feb 2021 10:09:01 +0000
Received: from pmg02-out1.zxcs.nl ([185.104.30.241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE89A-0004uq-Iu
 for linux-arm-kernel@lists.infradead.org; Mon, 22 Feb 2021 10:08:58 +0000
Received: from pmg02.zxcs.nl (localhost.localdomain [127.0.0.1])
 by pmg02.zxcs.nl (ZXCS) with ESMTP id AB0D2837C9;
 Mon, 22 Feb 2021 11:08:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=pascalroeleven.nl; s=x; h=Content-Transfer-Encoding:MIME-Version:References
 :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WNwlUaMzO0voeQD0k+em6Iu2mD8MNkshIay47M4C/oU=; b=wMySf5cPZwdXB/A+RW6tV+YoGY
 ySKUAw7o+/ewvd1ITzCmb4JTPCp+L9eySYOh2/dQ5FkfKgEsdFOyOHDVikPBaiJYZWllpCeJWhxee
 fk0IdL0uIf3rkqBbP46HlBOvYvzRtWO2pfoHxzIS+IYJ8VfhkMAyTPYojCpmvB5mULNP/daC0gETw
 F0F8VMcrXCYgJRXk9AJX9zIQEvOOx3v0884550KF9LcgHhhvFpb+1hvIn28qd6XB9ZwcZ18Ahsbjh
 uUZlKPKfRbq71yq/8hoiGyKALTJNvR8JpoN+zq73NEA0xVwD7t7NrTUMPR87qMyWFsh8/467ob0/A
 vhNhZBGg==;
From: Pascal Roeleven <dev@pascalroeleven.nl>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Icenowy Zheng <icenowy@aosc.io>, Corentin Labbe <clabbe@baylibre.com>,
 Martin Cerveny <m.cerveny@computer.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: arm: Add Topwise A721
Date: Mon, 22 Feb 2021 11:08:25 +0100
Message-ID: <20210222100826.12478-2-dev@pascalroeleven.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210222100826.12478-1-dev@pascalroeleven.nl>
References: <20210222100826.12478-1-dev@pascalroeleven.nl>
MIME-Version: 1.0
X-AuthUser: dev@pascalroeleven.nl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_050856_789878_D326104A 
X-CRM114-Status: GOOD (  10.86  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, linux-sunxi@googlegroups.com,
 Pascal Roeleven <dev@pascalroeleven.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210222100825.jdGfymbVWUO_8pZjufgGT0yPyVML9rjZ0ABYOtGrZJo@z>

Add the bindings for Topwise A721 tablet

Signed-off-by: Pascal Roeleven <dev@pascalroeleven.nl>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 6db32fbf81..8833a9c925 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -787,6 +787,11 @@ properties:
           - const: tbs-biometrics,a711
           - const: allwinner,sun8i-a83t
 
+      - description: Topwise A721 Tablet
+        items:
+          - const: topwise,a721
+          - const: allwinner,sun4i-a10
+
       - description: Utoo P66
         items:
           - const: utoo,p66
-- 
2.27.0



_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
