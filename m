Return-Path: <SRS0=Zi41=F7=bombadil.srs.infradead.org=BATV+4081a51caf94f36e8d3a+7359+infradead.org+hch@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C38CDB474
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 13:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DEE2CC433C9; Tue, 17 Oct 2023 13:59:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60125C433C7;
	Tue, 17 Oct 2023 13:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60125C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=OZYqVKF2BnfC7TrwYhJeul4vHW53Mw0roQsbMF/QnKo=; b=4a9tjl7JZvDPzI2TUKKicaYfR/
	YW5AstZwxhfD3O6siujR9Dn6BWZVkDIBurWy6FAtwMih5aE2ou0E8U3vnkg7xpAPAcJ2HXeZo2WUe
	zikBEAjIh6KpEbuSNw9xPJ50pcOkKVRxrK4w3Ig+JETmWwj5tRLb4Govl1Mmltb2YwNQ1U1hFqHIK
	x9PcZRvrz+hcFSYvExrg3VW+D0jxYIJfV+2R54ey1ylqLTwVwjYXc+uZQaENKt1JpvZI/vYExdW86
	/fmOK8wT3CEf8b5ElxEgNdxpgX6m/E8cuM5jImKYGgz96IAlBbogoPW/ilP/ek4b3qhFciuMrZszk
	50G2p/OA==;
Received: from 213-147-166-120.nat.highway.webapn.at ([213.147.166.120] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qskbk-00CTXE-18;
	Tue, 17 Oct 2023 13:59:41 +0000
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
	soc@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] riscv: only select DMA_DIRECT_REMAP from RISCV_ISA_ZICBOM
Date: Tue, 17 Oct 2023 15:59:25 +0200
Message-Id: <20231017135926.1240101-3-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017135926.1240101-1-hch@lst.de>
References: <20231017135926.1240101-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

RISCV_DMA_NONCOHERENT is also used for whacky non-standard
non-coherent ops that use different hooks in dma-direct.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0ac0b538379718..9c48fecc671918 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -273,7 +273,6 @@ config RISCV_DMA_NONCOHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB
-	select DMA_DIRECT_REMAP if MMU
 
 config RISCV_NONSTANDARD_CACHE_OPS
 	bool
@@ -549,6 +548,7 @@ config RISCV_ISA_ZICBOM
 	depends on RISCV_ALTERNATIVE
 	default y
 	select RISCV_DMA_NONCOHERENT
+	select DMA_DIRECT_REMAP
 	help
 	   Adds support to dynamically detect the presence of the ZICBOM
 	   extension (Cache Block Management Operations) and enable its
-- 
2.39.2

