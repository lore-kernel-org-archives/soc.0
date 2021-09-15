Return-Path: <SRS0=mgYX=OF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BEEC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Sep 2021 12:16:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DCB661209
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Sep 2021 12:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DCB661209
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CjWn2GzPd2IF8rQkeQoYiiUmuaSaWM+3kxTvBMpJPCg=; b=MZdAwL6LuBJG+w
	JZaH+qPhU/XEu+89ft9tElLFeMeczij85jl5e7kCCMQOfBNZbQE9I/LUdBNz4fdvlgzQZp0UG1b0h
	Nu95Cs/MeMu0v96lvX540ngMDtiDRuWLM9IxU3tnCKNxRLXa1EY5n/Q2CaQANngVqd5UNqoQz8563
	wQ2+8i3j8uCSbk/57jrHUmMoRYeTCKOzVw2ENci9zDtGw/nGuXgknXEptI3NDkEqlfNLXRykga/5e
	9E2n5NZAvB8cIqpMGFO6TKnrDvTqWOYTXUrfia9RZcM/DCYTHQkglyMbRI2IxWfAeVqT/NJlkuH/d
	Blm6AOr9IoGoBiLvnRUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQToB-008yEs-Ul; Wed, 15 Sep 2021 12:14:36 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQTo7-008yEV-L0
 for linux-arm-kernel@lists.infradead.org; Wed, 15 Sep 2021 12:14:33 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18FCEPvl070268;
 Wed, 15 Sep 2021 07:14:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1631708065;
 bh=lvzYtyNJkMB3akJY5gtdKxadl4HY0hIQuy4gkmH6BTk=;
 h=From:To:CC:Subject:Date;
 b=IwDY2+fC+/RuCi3wxH5MQkiwsrIGvgSTqyi5kJl+Qq+xrVNP0RS9lU0fiy30c/qex
 JVRuH36ksLGsXSaX77mgGG0EZqGyXm6bOWKgFmZUyCR1jaCLwYdw3LLgO4BM/BQl9M
 wEBoBtHGngZvjkCmiqPx2dVeQHyT9nsrL24hlr0U=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18FCEP62080919
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 15 Sep 2021 07:14:25 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 15
 Sep 2021 07:13:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 15 Sep 2021 07:13:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18FCDLgr092069;
 Wed, 15 Sep 2021 07:13:22 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <soc@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Nishanth Menon <nm@ti.com>
Subject: [PATCH] MAINTAINERS: Add Vignesh to TI K3 platform maintainership
Date: Wed, 15 Sep 2021 07:13:08 -0500
Message-ID: <20210915121308.26795-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_051431_808480_219FF8A0 
X-CRM114-Status: UNSURE (   9.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210915121308.a4JNjymUeWHPuzQhavfT6FP2qQuoFRz6r1Cu-dJmpxA@z>

Add Vignesh to TI K3 platform maintainership. We will rotate roles for
each kernel version to help spread the work load a little better.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..21d44498674e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2712,6 +2712,7 @@ F:	drivers/power/reset/keystone-reset.c
 
 ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE
 M:	Nishanth Menon <nm@ti.com>
+M:	Vignesh Raghavendra <vigneshr@ti.com>
 M:	Tero Kristo <kristo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
-- 
2.32.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
