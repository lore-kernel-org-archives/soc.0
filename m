Return-Path: <SRS0=NKgK=PY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C087C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Nov 2021 07:52:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0242F61250
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Nov 2021 07:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0242F61250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mSiPDXWK97qZD0yOlwRsnQOBkkJaTBxKzcRDvjc1rr0=; b=pJh0UK2TYcCMBp
	w7m6Yr4l33PoiOyeOHWPvBj9xGxpwkAZVkM4N5hE+CwFdx6Tx4+ssZD3IYrb679BQHR9GHyF6JFR5
	Y94EmPAfpO50fuJFmuiMQPJgFnJ9j7kLvKygK1xELGSF1fLTb30IUKgdOPBPm5I9x1lErRvDDz+GE
	K/M/2G5ylUZGxrx/CeHyaZ7pL+d59sgkJVapZjq5MFCiXvR8llaJa/O8liYlD94fCx9KvgpCI4f3r
	CRcn8SM54FXPY0aXK2I3lXmk5xJjNnY3NKtUSmB+4eQ2kJALrtiDJt08svgKQBbxnA80BwmJCyWHt
	SdVAuYlreS7SgYMKH0qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miu0W-00An72-FP; Fri, 05 Nov 2021 07:51:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miu0T-00An5f-0F
 for linux-arm-kernel@lists.infradead.org; Fri, 05 Nov 2021 07:51:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBBCE61268;
 Fri,  5 Nov 2021 07:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636098684;
 bh=HaTY8h6/UI5jRklWm6hYsLHpz5zWyNPGx6rHK+XN9Fc=;
 h=From:To:List-Id:Cc:Subject:Date:From;
 b=nXoNO5ujyX/IwT8Sv4JeJRpB/VwlcdGHAR1zd4hY2OfuHPO1lSdNPilRjFB1jQt0w
 WR+axcmWouH4P/j/ybOBY42FCVbi48xxS1+KXmrJnH4PDYG2o65isWg8mJEOpNKW3O
 e/mVtkOoyU24guYIvY8/UqWgytInqxg8LvXrdaGO6zTRfRadpLXI4nwI5KfTqcCMyD
 v/EhexFJyVIeDp8vyf+FAKK01u54jW6BfvbbKFvs8Xmxj9epm1euwEcYDUBXZFHUWp
 3ePFU5h/x07pqEgI2vLoz45Tr6O7Oml8wykYjXp8TLKb8twb5XdSmCwqOvxAvlQpVG
 QrPrF6TF0FLRQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Santosh Shilimkar <ssantosh@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Dave Gerlach <d-gerlach@ti.com>, Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Lee Jones <lee.jones@linaro.org>, Zhen Lei <thunder.leizhen@huawei.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: ti: fix wkup_m3_rproc_boot_thread return type
Date: Fri,  5 Nov 2021 08:51:12 +0100
Message-ID: <20211105075119.2327190-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_005125_092351_A21A6402 
X-CRM114-Status: GOOD (  14.60  )
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
Message-ID: <20211105075112.VmhIBhoiELbg8juNTvvzwIpC-bHkASZrPs99lER7vMI@z>

From: Arnd Bergmann <arnd@arndb.de>

The wkup_m3_rproc_boot_thread() function uses a nonstandard prototype,
which broke after Eric's recent cleanup:

drivers/soc/ti/wkup_m3_ipc.c: In function 'wkup_m3_rproc_boot_thread':
drivers/soc/ti/wkup_m3_ipc.c:429:16: error: 'return' with a value, in function returning void [-Werror=return-type]
  429 |         return 0;
      |                ^
drivers/soc/ti/wkup_m3_ipc.c:416:13: note: declared here
  416 | static void wkup_m3_rproc_boot_thread(struct wkup_m3_ipc *m3_ipc)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~

Change it to the normal prototype as it should have been from the
start.

Fixes: 111e70490d2a ("exit/kthread: Have kernel threads return instead of calling do_exit")
Fixes: cdd5de500b2c ("soc: ti: Add wkup_m3_ipc driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/ti/wkup_m3_ipc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index 0733443a2631..72386bd393fe 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -413,8 +413,9 @@ void wkup_m3_ipc_put(struct wkup_m3_ipc *m3_ipc)
 }
 EXPORT_SYMBOL_GPL(wkup_m3_ipc_put);
 
-static void wkup_m3_rproc_boot_thread(struct wkup_m3_ipc *m3_ipc)
+static int wkup_m3_rproc_boot_thread(void *arg)
 {
+	struct wkup_m3_ipc *m3_ipc = arg;
 	struct device *dev = m3_ipc->dev;
 	int ret;
 
@@ -500,7 +501,7 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 	 * can boot the wkup_m3 as soon as it's ready without holding
 	 * up kernel boot
 	 */
-	task = kthread_run((void *)wkup_m3_rproc_boot_thread, m3_ipc,
+	task = kthread_run(wkup_m3_rproc_boot_thread, m3_ipc,
 			   "wkup_m3_rproc_loader");
 
 	if (IS_ERR(task)) {
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
