Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAACC433DB
	for <soc@archiver.kernel.org>; Tue, 23 Mar 2021 13:15:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1EE6B61994; Tue, 23 Mar 2021 13:15:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7001261984;
	Tue, 23 Mar 2021 13:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616505335;
	bh=mrlm0oDlOwv23D8hsr1CVyK/ZOFyC0hrwBy3dJk/ysA=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=JsUC3pbweaqN5nmQ9B8OzW219fmNpEX0iNg6qfe1CabmUAdrJob4ukggXwkvYiW1N
	 fGfMHsfeZ/giyVMlBN8/liYFvKOf1Q+vKgaweRaga3+NoIjykw3tw3750oJ4ZTcNp5
	 AzeYcSur8nRKEthFdA+Yugipke0zf8Gni6MpJZ+z19s5YcM/x8w14+rnehqDwXfgjB
	 QJXHBfUArmrY+snO8U6vyP/W4Fbf2rvLBEeJ5Ae/dahy2w28qGjligsR3wsYKUIcri
	 39X6XOjM8t0yFK9WWZ9/Ma2wkitkRdXcdbVfPEpiFYyCYTeUBH7AlMlI7BHPtpXDoh
	 rTpMIAQEb087A==
From: Arnd Bergmann <arnd@kernel.org>
To: Li Yang <leoyang.li@nxp.com>,
	Roy Pledge <roy.pledge@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Scott Wood <oss@buserror.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	YueHaibing <yuehaibing@huawei.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc/fsl: qbman: fix conflicting alignment attributes
Date: Tue, 23 Mar 2021 14:15:23 +0100
Message-Id: <20210323131530.2619900-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When building with W=1, gcc points out that the __packed attribute
on struct qm_eqcr_entry conflicts with the 8-byte alignment
attribute on struct qm_fd inside it:

drivers/soc/fsl/qbman/qman.c:189:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]

I assume that the alignment attribute is the correct one, and
that qm_eqcr_entry cannot actually be unaligned in memory,
so add the same alignment on the outer struct.

Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/fsl/qbman/qman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index a1b9be1d105a..fde4edd83c14 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -186,7 +186,7 @@ struct qm_eqcr_entry {
 	__be32 tag;
 	struct qm_fd fd;
 	u8 __reserved3[32];
-} __packed;
+} __packed __aligned(8);
 #define QM_EQCR_VERB_VBIT		0x80
 #define QM_EQCR_VERB_CMD_MASK		0x61	/* but only one value; */
 #define QM_EQCR_VERB_CMD_ENQUEUE	0x01
-- 
2.29.2

