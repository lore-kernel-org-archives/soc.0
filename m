Return-Path: <SRS0=aJU7=IV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD77C433C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Mar 2021 13:17:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8915619BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Mar 2021 13:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8915619BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZuU+3WpYJdUDnLuhxt8vaDKDVElbtWvpM4kIEL/D/I4=; b=GQMB8f6/oHdJVUr6sJVPBDvf54
	+XbCs5R5rO4tQ4UBkwjAdAHGHZkmdavHRwKotjamZTSOYp0eDvJTZJU4aUr/aOFhuH5VbQJmhoVmF
	jW5GdfLuHUzCacGwqfBu+LllClkGnwVPLVHwD5/DgbneA/ABNiNk/V1PBPZeEYWlnvQj7KA1EG3Ze
	NTWmrLXEkF++qAA1NFYNAphLWOuTE5IBDP22Of71fVwid3lX28779M6nuWJLh8qot3CXnPzu8n52s
	0S+PynK/iPqAfI2gh0lpq5Fe1x9pY7pH/ZXBc4cXbFPLODBqG0hFfHYN+G7QlbwF93oB89dJERUoT
	knxMqXpQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOgsm-00F1WJ-A4; Tue, 23 Mar 2021 13:15:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOgsi-00F1Vh-FU
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Mar 2021 13:15:38 +0000
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
To: Li Yang <leoyang.li@nxp.com>, Roy Pledge <roy.pledge@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Scott Wood <oss@buserror.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc/fsl: qbman: fix conflicting alignment attributes
Date: Tue, 23 Mar 2021 14:15:23 +0100
Message-ID: <20210323131530.2619900-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_131536_728714_56D8499D 
X-CRM114-Status: GOOD (  11.36  )
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
Message-ID: <20210323131523.evnynCxNMljMZZAudDZLvk9YlXq-5Qw_xMpsMI3BvKY@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
