Return-Path: <SRS0=nqc+=GA=bombadil.srs.infradead.org=BATV+19490d9e8063348c9c2f+7360+infradead.org+hch@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72241CDB483
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 05:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5820BC433C8; Wed, 18 Oct 2023 05:27:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DA68C433C9;
	Wed, 18 Oct 2023 05:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5DA68C433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=G1q5kjKCly+YP8ujUn6bFejuAy7IU52U7erNsqEL50A=; b=AJt060LlpGen+lRt6knsoShqCI
	O1W/l3v+OgIWq/dNaMJb68oogx+fY6vgqblyV4Y1KRKaOyksT1vqfK5muDYgdHc5Rt+HToKaa46RU
	t938WpSxFTPYLhNAaHW2h2vNOlNXM8BRefy0BJpwFtZ/6G+WXtWM2RhmY5fbLy622gLDJ7Ph9yQTE
	Gnax+zzBMMmlmtocynwK7oZGEL447qHcAs+mnIseEMeDcR9l7Zv2/Yni4fvt6AKzm6sLEP0PoSSAD
	0pzr0tRkfqAeY38dz9SjP3tFzKzLdPYoWtprOPaiZnR2FCRoZXEHI/f923zQ3/ytp/9gXMXW+Y2A6
	xt4V1l9g==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qsz5E-00Dp3w-1i;
	Wed, 18 Oct 2023 05:27:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	soc@kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 3/3] soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM
Date: Wed, 18 Oct 2023 07:26:54 +0200
Message-Id: <20231018052654.50074-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231018052654.50074-1-hch@lst.de>
References: <20231018052654.50074-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

ARCH_R9A07G043 has its own non-standard global pool based DMA coherent
allocator, which conflicts with the remap based RISCV_ISA_ZICBOM version.
Add a proper dependency.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 335251ff6e8214..624185e09c967b 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -341,6 +341,7 @@ config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	depends on NONPORTABLE
 	depends on RISCV_ALTERNATIVE
+	depends on !RISCV_ISA_ZICBOM
 	depends on RISCV_SBI
 	select ARCH_RZG2L
 	select AX45MP_L2_CACHE
-- 
2.39.2

