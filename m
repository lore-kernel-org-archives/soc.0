Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1421EC07E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 04:56:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D845A6127C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 04:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D845A6127C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQoWFlzblmJqF1S4U0UYnV4FnIpbDpnxnkwhspSgsSg=; b=w0KK/cc2WwDVJq
	29H7cLBzVaNXDPGE7zKI41YqrFeuMvz7rHwBnpfw05ndY7azICCHbX8B40twWKciyQr4M8e/vx4Bo
	Nd5SnEVMhLHcYmxhGnC/6AY8Ih1cUpRhTrCqFc1EWzTZEx5tp9GN4b6UWZfmpKhs3fMfjagC6qM6S
	xKTfyvZVA/nwnoVrCQd99T55sd/tZKse581ZTKoVl2Ud6vfLXF8FFsC5a3kYHFc2dTqcu98fS03Mm
	7sl/qCOQ0Zqb+L0cfzphnzawzE8qWXkQKglo0q4vcbBHjSSPYitqUA5s6Y+Kaze71rfYgAAO7jkVp
	QzuF8npQeqA/wjeR0acA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Wv3-00CJY6-MF; Wed, 14 Jul 2021 04:54:49 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3Wub-00CJQg-0r
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 04:54:22 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1m3Wu8-0001DT-DG; Wed, 14 Jul 2021 06:53:52 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1m3Wu6-0002s5-JT; Wed, 14 Jul 2021 06:53:50 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, soc@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 2/4] dt-bindings: vendor-prefixes: Add an entry for SKOV A/S
Date: Wed, 14 Jul 2021 06:53:47 +0200
Message-ID: <20210714045349.10963-3-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714045349.10963-1-o.rempel@pengutronix.de>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_215421_099740_5CFD9120 
X-CRM114-Status: GOOD (  11.40  )
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
Message-ID: <20210714045347.SuprHDCm6TF-mlMPkEAliWIFysrQH892tQvPr0Ow_Kw@z>

Add "skov" entry for the SKOV A/S: https://www.skov.com/en/

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fa951ba1c738..8ac59bf849fe 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1060,6 +1060,8 @@ patternProperties:
     description: Silicon Integrated Systems Corp.
   "^sitronix,.*":
     description: Sitronix Technology Corporation
+  "^skov,.*":
+    description: SKOV A/S
   "^skyworks,.*":
     description: Skyworks Solutions, Inc.
   "^smartlabs,.*":
-- 
2.30.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
