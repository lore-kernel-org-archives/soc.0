Return-Path: <SRS0=ZThx=H2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852A7C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Feb 2021 10:54:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1126064ECF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Feb 2021 10:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1126064ECF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pascalroeleven.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yQ9yqI4jXgz5ILzJcEpoxhSMeSGblZOk2Vlfj0m/TNs=; b=eR7iCy613E6sOIXtaleB65/oP
	DXwWAQcTTWc+fKbbOMO622taNrWfjcwF2Mh2sZVQjRtasDCQ5UiXENdW6arEKWsTXAS/7LHqmbK53
	eoC1Vf73/w4UInwC2r0y0by+ZrqR7x4FGPMUZTd0Kn44Bb4C4NHX4dH+QWygCwjmpglvxsivMOK1Q
	tnrVkRN6TEra70GxFc3g+4FYyqpCgiqbgIC9PL9gKTAYVU8+TZCjGW8XCznvVu3xePzfmUJs3ZhTH
	2yTf/DTFajuqxTouztIb1famCThxQLkwmrMuocKtKV9raK/rL6I3MFjYhZyuHcyqwXa+9Cgf9CeYT
	YvdKFC1KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lErnK-0001ts-EN; Wed, 24 Feb 2021 10:53:26 +0000
Received: from pmg02-out3.zxcs.nl ([185.220.172.251])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lErnF-0001ri-F6
 for linux-arm-kernel@lists.infradead.org; Wed, 24 Feb 2021 10:53:22 +0000
Received: from pmg02.zxcs.nl (localhost.localdomain [127.0.0.1])
 by pmg02.zxcs.nl (ZXCS) with ESMTP id 285EE83B1F;
 Wed, 24 Feb 2021 11:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=pascalroeleven.nl; s=x; h=Content-Transfer-Encoding:MIME-Version:References
 :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5iH+f0B18ifcjxW9mghCrDKfJx2VEwYdRjMyyarrnlE=; b=OAMLsf6EsGYaPWvh77MF+kOiMq
 swTMcgC92IJ+vHNg6rUVTGbYypWoHMoCuWLbtBHaSJ3Wp96o+zK9N2Ml+QnVsVFyNYgrX+1hGl55u
 mjkEyBvqD5Za7HZQGe6LI4amXfQXY0Nouik+0CoeYaQpIyeVCoGZ5h55PJ5yLb0JS9OQxkALdf31y
 BTV0dqJrdjUFwdzZYffQT5DcAvXu9SJHXE/cKkTM++f6CED3k6Am/SmCmsKfnNh0TJNaxttOm8mwL
 TvunH+jUfHBYS3d0HLHFTPNyOVZ3FML+/uW5EMdTA0v57vCuCJdNGG4fovm7GhoctIv9tSmodQ22y
 mo30/jNA==;
From: Pascal Roeleven <dev@pascalroeleven.nl>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Icenowy Zheng <icenowy@aosc.io>, Martin Cerveny <m.cerveny@computer.org>,
 Corentin Labbe <clabbe@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: arm: Add Topwise A721
Date: Wed, 24 Feb 2021 11:52:39 +0100
Message-ID: <20210224105240.47754-2-dev@pascalroeleven.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224105240.47754-1-dev@pascalroeleven.nl>
References: <20210224105240.47754-1-dev@pascalroeleven.nl>
MIME-Version: 1.0
X-AuthUser: dev@pascalroeleven.nl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_055321_627392_F582779D 
X-CRM114-Status: GOOD (  10.76  )
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
Message-ID: <20210224105239.z0WaJecdircBm_73jn9-TD_DWKLaUbzNj7UqW0_3Wrk@z>

Add the bindings for Topwise A721 tablet

Signed-off-by: Pascal Roeleven <dev@pascalroeleven.nl>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 08607c7ec1..ac750025a2 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -802,6 +802,11 @@ properties:
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
