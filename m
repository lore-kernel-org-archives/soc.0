Return-Path: <SRS0=klY5=FK=infradead.org=rdunlap@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6084E6FE31
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 00:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73A3AC433C9; Tue, 26 Sep 2023 00:35:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35712C433C8;
	Tue, 26 Sep 2023 00:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35712C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=0J8nTsTynSvtRpFuXVxSLl94WdD3f0MuLFh/eUmRVV0=; b=DlB5Q353F68F2fmcQ8R+0Ju7fA
	pt6pqnxYC2NjEgW3x5HCNlTVlhKXSta//DowPWwqlt0y0x30Uu3hX7ovZpwXYwRQcn+EE+t3rs9ZB
	pobZ5lho8uQqIZS8OjodGVwCGSwzwuILddPlZ8hHbZZ3LmGa6J7/dXd+q1PR4PVI7ISEQt57twQOV
	NAf0BdaAKEo1dmPwuHfkDfQk5wvhzrx2xF6kIWr/N0siAfywwUA/NhOooGnUsxXMD/zJtbZcZyuRK
	c38lXaiq9f8XeE4kvbEbKc+QVLE7cSFMSxYMZC2ykywL7jAHT+bmRbgRlYKFpTdsavrMnOEHrhzZp
	xX1ymeXQ==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qkw3J-00FIWV-1I;
	Tue, 26 Sep 2023 00:35:49 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	kernel test robot <lkp@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH] ARM: uniphier: fix cache kernel-doc warnings
Date: Mon, 25 Sep 2023 17:35:48 -0700
Message-ID: <20230926003548.22066-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix kernel-doc warning(s) as reported by lkp:

arch/arm/mm/cache-uniphier.c:72: warning: cannot understand function prototype: 'struct uniphier_cache_data '
cache-uniphier.c:82: warning: Function parameter or member 'way_ctrl_base' not described in 'uniphier_cache_data'

Fixes: e7ecbc057bc5 ("ARM: uniphier: add outer cache support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Link: lore.kernel.org/r/202309260130.Uvwh8ceE-lkp@intel.com # fixes only one item
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
---
 arch/arm/mm/cache-uniphier.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff -- a/arch/arm/mm/cache-uniphier.c b/arch/arm/mm/cache-uniphier.c
--- a/arch/arm/mm/cache-uniphier.c
+++ b/arch/arm/mm/cache-uniphier.c
@@ -58,11 +58,13 @@
 		((op & UNIPHIER_SSCOQM_S_MASK) == UNIPHIER_SSCOQM_S_RANGE)
 
 /**
- * uniphier_cache_data - UniPhier outer cache specific data
+ * struct uniphier_cache_data - UniPhier outer cache specific data
  *
  * @ctrl_base: virtual base address of control registers
  * @rev_base: virtual base address of revision registers
  * @op_base: virtual base address of operation registers
+ * @way_ctrl_base: virtual address of the way control registers for this
+ *	SoC revision
  * @way_mask: each bit specifies if the way is present
  * @nsets: number of associativity sets
  * @line_size: line size in bytes
