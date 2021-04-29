Return-Path: <SRS0=ailJ=J2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F014C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Apr 2021 01:28:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A19BE6143E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Apr 2021 01:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A19BE6143E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WXg8sZW/9sYSPS/v8ZXxfoJsaQeSjWokimCaIX6Uje4=; b=MIgjSglDweGuzQiyuxISkoovj+
	6htpIYHAHUD5pBmnm8zxGWjshDuOb4L95gV1lg7uQJaLNL6VtfBwrduxg+5Kl8wNrmEYufcrXVyyv
	UZ0rvsR8463B0OigIaVKxwOhGG7+Ms1KqV4RvE4qvEJzEvF1qS0WuxShiMa3mcL/LZDdf/bKtfifA
	KQ1CrvCpnAanORFagAh8clikERGJ7g6Pw1pc/6qiEbzPBlEUkE9wXlGO9CIh+B/QF1CCAAZSo6I7S
	Y/WRj5v0a613skmaB2WXZEAj2AEHwiAoquc25x2aQsWKLTb+ogg+RjqqiA+4NNwne9k5vdaqABQ6q
	+GkpWjoA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbvSL-004cZ4-J1; Thu, 29 Apr 2021 01:27:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbvSF-004cYe-VQ
 for linux-arm-kernel@desiato.infradead.org; Thu, 29 Apr 2021 01:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=LXSKBzivzWOdSwPprsj/GKgD3gZYnaIltJm5deDMcxg=; b=EcAmPjibzi/grnlw3sCLMKLKhC
 n6zXf7Fv+SnG39sR5JKxK6UFCbmYThDB2+XVHe1EHrOI+/JpVEO765zw0WhDDf+0E3mEdmuTj+zny
 kiElCSaQ7VTS+vSkCkh4rU94q/CjBbGlo/agffipJRG0N8OcLxHfVUDzJ1p9lZDL2GXlpE4lbPrDc
 yZz1Tfu38zxIQj9WLj2ahr8Q4diyilHq3cDbA23jmJJ+G+jCn52M77EAt9aHf99DBBNXJ8az7KHN+
 /SWtdEXoG1F7fvAZziuecbUQDDf2I0vaQTFBwkdOqlR6pHLKErkIMmt80lEV35jMQFE/Lul0uvs4H
 a0suRZiQ==;
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbvSD-000JGW-3w
 for linux-arm-kernel@lists.infradead.org; Thu, 29 Apr 2021 01:26:58 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R901e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UX7837P_1619659609; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UX7837P_1619659609) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 29 Apr 2021 09:26:51 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: lorenzo.pieralisi@arm.com
List-Id: <soc.lore.kernel.org>
Cc: mark.rutland@arm.com, sudeep.holla@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 arm@kernel.org, soc@kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH v2] psci: Remove unneeded semicolon
Date: Thu, 29 Apr 2021 09:26:29 +0800
Message-ID: <1619659589-4775-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_182657_358809_1FD5A28D 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210429012629.lF8jjtea88SXj31WbJr085i-uzA9V3P09sX2FoV0X6Q@z>

Eliminate the following coccicheck warning:
./drivers/firmware/psci/psci.c:141:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
---

Change in v2:
--subject should read "psci: Remove unneeded semicolon"

 drivers/firmware/psci/psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 64344e8..6e7bac6 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -138,7 +138,7 @@ static int psci_to_linux_errno(int errno)
 		return -EINVAL;
 	case PSCI_RET_DENIED:
 		return -EPERM;
-	};
+	}
 
 	return -EINVAL;
 }
-- 
1.8.3.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
