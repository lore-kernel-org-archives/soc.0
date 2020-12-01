Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80CDC64E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 21:16:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 692E1207FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 21:16:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vgDwcY1u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CB8p4MtQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 692E1207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xPA9cJ4DfZx+DgXIOMj+0zaXOmD4+dV9Z5DImTAJtYs=; b=vgDwcY1uYVoNj+tkUO9R0IaHl
	iWX6Yq2sjUNGRPfvhPiCXvlcCW8Og7gXqJZG2qZKNeZbdVac3cTOB7GQp9Lb2gryJZHzCYoYPrUVG
	PHuRxhHthDiBK9cOlILsR2BJSfsWwBJ8++A0blvu0v2zDWSHi1wgr3AzozGcNP0MkD2ayJCOc781o
	gQ2kTY0fzrcQ8H6JKAloNS4+S+sjLG98U9tEUhhLmIzTwDyAxHKK4vYhw0oeZXESt3m+Izc/42RYa
	XtPG8J4vsgj0IUzS29x8wYfrVj3w9W5Moy6qycfMZgf93KxhzgCXZZpkHq2qoMWXR9++jQsSPVI3d
	/xz+Ls2jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkCzu-0002tN-D5; Tue, 01 Dec 2020 21:15:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkCzs-0002sl-2o
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 21:15:41 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 918EA21741;
 Tue,  1 Dec 2020 21:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606857339;
 bh=QPtXSCXTRQaNs8AHJTnnRkJXv7nkPZcm6XmY97Dg3dg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CB8p4MtQ3yTvLzkBii3rB+Be7l4TdaNATRUzy8FPls5jglUJ3Rq9fwdadz9MSeUvn
 LQiQeSXFr39NTZoiuMzw9QrTzbM+itS7KoOXvwwTXgvGGGKnlvGva1VJwtYCXA7N6x
 0RfwLJnJwsAxsX6ZJjLNXxn3wCjwIK2j+WySMtGw=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFC 2/2] MAINTAINERS: add a limited ARM and ARM64 SoC entry
Date: Tue,  1 Dec 2020 23:15:16 +0200
Message-ID: <20201201211516.24921-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201211516.24921-1-krzk@kernel.org>
References: <20201201211516.24921-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_161540_228312_B834705A 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, arm@kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201211516.8qTyURP2BEBvlS9cWnzgEhDnDuxGAieuzOQPfasd_Kw@z>

It is expected for ARM and ARM64 SoC related code to go through
sub-architecture maintainers.  Their addresses were therefore not
documented to push patch traffic through sub-architecture maintainers.

However when patches touch generic code, e.g. multi_v7_defconfig, the
patch might not be picked up by them and instead should go to the SoC
maintainers - Arnd and Olof.

Add a minimal maintainer's entry for SoC covering only Makefile, so it
will not appear on most of submissions (except new devicetree boards).
It will though serve as a documentation and reference for cases when
submitter does not know where to send his SoC-related patches.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6149066a545e..f302983645bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1491,6 +1491,16 @@ F:	Documentation/devicetree/bindings/iommu/arm,smmu*
 F:	drivers/iommu/arm/
 F:	drivers/iommu/io-pgtable-arm*
 
+ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
+M:	Arnd Bergmann <arnd@arndb.de>
+M:	Olof Johansson <olof@lixom.net>
+M:	soc@kernel.org
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
+F:	arch/arm/boot/dts/Makefile
+F:	arch/arm64/boot/dts/Makefile
+
 ARM SUB-ARCHITECTURES
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
