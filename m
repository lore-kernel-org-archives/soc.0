Return-Path: <SRS0=nqc+=GA=bombadil.srs.infradead.org=BATV+19490d9e8063348c9c2f+7360+infradead.org+hch@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C70CDB47E
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 05:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 164B0C433C8; Wed, 18 Oct 2023 05:27:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70F26C433C7;
	Wed, 18 Oct 2023 05:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70F26C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=+MvGJJXhH4hDoZHgxYXrLlkhJ9bNdcq3APvPvNhBj6I=; b=0JBDloiYtUQvG0nqd+zYT2kuDH
	7Q2zBuf2fePZHWtRIg+1RXcMXeSJofqfQZXA5tGHKbp9C3CT+TyQl6A7j4XvfhMMOeGxx5QoJ1OTw
	jOT6LgvA3Sta5xFE34SwDvGhhkPyDT4MvAYjDL0K3nY1/YHmglr/XO+yIAgped5c62zAfReAvNM3z
	NtME5/MmCesFUasl/wFoKGYlWnx79CDM8tYOY60VzyBMBqLobqTvV2kgBwfUMMRxtmve6icZ5uC09
	dk0BbuSAKMdrNcPdEU+dqdz3dEN9Gxla5W/+DvQ6QJ5OwqBNeQaxg194fFQ1Zg8pagqtE+fRcMHtL
	7QhT7R7w==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qsz57-00Dp2u-0t;
	Wed, 18 Oct 2023 05:26:57 +0000
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
	soc@kernel.org
Subject: fix a few RISC-V / renesas Kconfig dependencies v2
Date: Wed, 18 Oct 2023 07:26:51 +0200
Message-Id: <20231018052654.50074-1-hch@lst.de>
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

Changes since v1:
 - select DMA_DIRECT_REMAP from ERRATA_THEAD_CMO
