Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50FAC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:42:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4153664DDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4153664DDD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4m8dk9rSHjXuYScabqlRURTIfzk6yaSzlHkIqdZX/wY=; b=bJwC9Jg7BPwd4o3KJYY2RJTOc
	adRiafWJJF9DSx4Sgs/S9q+S8Gkis+qtNKpb4l7vyFr8ohp2h5uIoLrOZUcNrx6GuKpI7V3ehGQru
	A70dC2t8FAT3/qM+bjpoU9+0U2W7jjQs8+g49AyrL1hi6Vxn16Jc7tYG4DtGhY/r4D0gqkWMy6Jhk
	Q/9KcwBngm4eeTQ77TBcAlb3rhcOU3q8J/FzKZi4m4yD/miUTLtHHYuOaxUZdXUOduZalxxRLSS7v
	kjIy5HawT4FkqJ5nFDNPDCEXdlJ81B02FRG55CHBEm+rn3PZ66ldgn8ldHTNp7+EF21beUlWPiZUQ
	f5uLwkicw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7lQR-0007s7-RE; Thu, 04 Feb 2021 20:40:27 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7lQL-0007qi-1L
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 20:40:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id DFF2F427D5;
 Thu,  4 Feb 2021 20:40:16 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: Hector Martin <marcan@marcan.st>,
	soc@kernel.org
Subject: [PATCH 03/18] dt-bindings: arm: AAPL: Add bindings for Apple ARM
 platforms
Date: Fri,  5 Feb 2021 05:39:36 +0900
Message-Id: <20210204203951.52105-4-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_154021_291223_28CCDC4C 
X-CRM114-Status: GOOD (  12.61  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This introduces bindings for all three 2020 Apple M1 devices:

* AAPL,j274 - Mac mini (M1, 2020)
* AAPL,j293 - MacBook Pro (13-inch, M1, 2020)
* AAPL,j313 - MacBook Air (M1, 2020)

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 .../devicetree/bindings/arm/AAPL.yaml         | 36 +++++++++++++++++++
 MAINTAINERS                                   | 10 ++++++
 2 files changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/AAPL.yaml

diff --git a/Documentation/devicetree/bindings/arm/AAPL.yaml b/Documentation/devicetree/bindings/arm/AAPL.yaml
new file mode 100644
index 000000000000..145b184e4a24
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/AAPL.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/AAPL.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple ARM Machine Device Tree Bindings
+
+maintainers:
+  - Hector Martin <marcan@marcan.st>
+
+description: |
+  Apple ARM ("Apple Silicon") platforms should contain compatible strings
+  in the following format:
+
+  - AAPL,j274 (board/device ID)
+  - AAPL,m1 (SoC name)
+  - AAPL,arm-platform (used for all Apple ARM devices)
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+      - description: Apple M1 SoC based platforms
+        items:
+          - enum:
+              - AAPL,j274 # Mac mini (M1, 2020)
+              - AAPL,j293 # MacBook Pro (13-inch, M1, 2020)
+              - AAPL,j313 # MacBook Air (M1, 2020)
+          - const: AAPL,m1
+          - const: AAPL,arm-platform
+
+additionalProperties: true
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index d3e847f7f3dc..91a7b33834ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1625,6 +1625,16 @@ F:	arch/arm/mach-alpine/
 F:	arch/arm64/boot/dts/amazon/
 F:	drivers/*/*alpine*
 
+ARM/APPLE MACHINE SUPPORT
+M:	Hector Martin <marcan@marcan.st>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+W:	https://asahilinux.org
+B:	https://github.com/AsahiLinux/linux/issues
+C:	irc://chat.freenode.net/asahi-dev
+T:	git https://github.com/AsahiLinux/linux.git
+F:	Documentation/devicetree/bindings/arm/AAPL.yaml
+
 ARM/ARTPEC MACHINE SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
 M:	Lars Persson <lars.persson@axis.com>
-- 
2.30.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
