Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C79C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:43:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB52964F44
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB52964F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hkbn4DnvwifCPko1YY/IHHS2p0scwbK9uh4DoHnps60=; b=SYkd+tgZHE/jM1RDLXxpQmpSf
	mWwcQYpbpPdvd+BWqAEeb+b2MrVlQ+O6KdeDspyELUGeNNbdQs+MbrHm8uR5yh1Sgckn07haZp1iP
	u5VVTRmqYiAtsplKhSu2JJfcnFsLdUHYv3A+JHnM1HB0bzfurmD0l3Fpl8zcMiFtDH4vsZ9rO79tW
	lvnryWuWc5ihwdkp57GPf+tlaRwFQgKKZDd1R4E0W1EhNMeArVzvP7ihbTsx1z8uGxVX5KOsnq41L
	+/FuN9EPepxAZMaTR7DoostMtwlOenFZqSZN24A8oifn31BCPOvdr6gGOiRr05Am+S/sR2tXWoaV7
	0TdoXTt9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7lSE-0000Br-Hy; Thu, 04 Feb 2021 20:42:18 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7lR4-00086K-Re
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 20:41:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 6805A42867;
 Thu,  4 Feb 2021 20:41:02 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: Hector Martin <marcan@marcan.st>,
	soc@kernel.org
Subject: [PATCH 17/18] dt-bindings: display: add AAPL,simple-framebuffer
Date: Fri,  5 Feb 2021 05:39:50 +0900
Message-ID: <20210204203951.52105-18-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_154107_588354_2A85E615 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210204203950.CwUywF1Z_HhFzBFNdnSwJiNW9r4lYM_2_HvZ9HYq-1o@z>

Apple SoCs run firmware that sets up a simplefb-compatible framebuffer
for us. Add a compatible for it, and two missing supported formats.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index eaf8c54fcf50..941c10f40ae5 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -54,6 +54,7 @@ properties:
   compatible:
     items:
       - enum:
+          - AAPL,simple-framebuffer
           - allwinner,simple-framebuffer
           - amlogic,simple-framebuffer
       - const: simple-framebuffer
@@ -84,9 +85,13 @@ properties:
       Format of the framebuffer:
         * `a8b8g8r8` - 32-bit pixels, d[31:24]=a, d[23:16]=b, d[15:8]=g, d[7:0]=r
         * `r5g6b5` - 16-bit pixels, d[15:11]=r, d[10:5]=g, d[4:0]=b
+        * `x8r8g8b8` - 32-bit pixels, d[23:16]=r, d[15:8]=g, d[7:0]=b
+        * `x2r10g10b10` - 32-bit pixels, d[29:20]=r, d[19:10]=g, d[9:0]=b
     enum:
       - a8b8g8r8
       - r5g6b5
+      - x8r8g8b8
+      - x2r10g10b10
 
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.30.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
