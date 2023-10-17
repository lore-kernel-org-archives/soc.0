Return-Path: <SRS0=Zi41=F7=bombadil.srs.infradead.org=BATV+4081a51caf94f36e8d3a+7359+infradead.org+hch@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B14DCDB474
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 13:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A865C433C7; Tue, 17 Oct 2023 13:59:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02191C433C8;
	Tue, 17 Oct 2023 13:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02191C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=m96cL5ijSpQsuieIaiYXP7bFvbIGAJf7RX0A75YE944=; b=q84ISQwQm0u2TmDb443jW9Z9II
	CKdsgxK59BOKYODsMdscZgn+LE5O6s/dLLGKzclFAx6YqkN8/rjkoMyhagyG9Fjtbx8kAf/MbvOSU
	o2E3t1IWgnh+encep32oQu1f5aLTA3TNq2II2/MbK7gqGrUtTd+1qL1gWOL3mJN9I3D7D1LujM4r5
	+x8d87QfoKW8WuFhJPsJOh7J6zsM25gu73qMYqaHAz7+iBWf4zzVSyxtiqApDLEpD63BpfmMcazkf
	VwVF5ACw8OeM5rap0aTeegPzwDJwEP5OgmnMcCzl7bIonGiKWJBMWUXZGNsvU/X8EemUBgKuf8bIX
	Tk+0G9Ew==;
Received: from 213-147-166-120.nat.highway.webapn.at ([213.147.166.120] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qskbb-00CTWK-0I;
	Tue, 17 Oct 2023 13:59:32 +0000
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
	soc@kernel.org
Subject: fix a few RISC-V / renesas Kconfig dependencies
Date: Tue, 17 Oct 2023 15:59:23 +0200
Message-Id: <20231017135926.1240101-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

this small series sorts out a few Kconfig dependency issue for the
rich set of RISC-V non-coherent DMA support.

Geert suggested for it to go into the soc tree, which is fine with me
if I get a stable branch for it as it is required for further dma-mapping
work.
