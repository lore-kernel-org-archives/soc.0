Return-Path: <SRS0=f/o2=FP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C845FC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Dec 2020 08:39:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 791BF23CD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Dec 2020 08:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 791BF23CD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PguTXIjMpeWGAywSWEZsOuushkrzXgVE72sQPII3ahk=; b=RBO0mdF1n1Sxep87QpJ90yzdC
	TKfpIh5RZKPzF6OagaT3QgBf8qRnuEV085/7g3uuIRZ2SnySXCSWDCFFrnSHbCzSbEiJNrVMWhtzA
	1YlnSEFpXjg6phYpYvmoDGlwc0as620vFpSUVhxlw842PRSThnsHqUmH3gTzfUrJEsM/EmO8mDWta
	SFPIb08IIkd7ZMnaxNrU5ahHy43achWHRQ4YmgVfNlIQ+xdUQz9HW6SEYde7EVeYOjUxYxtA5ZcYu
	6X/rZSgBL7oN9zwRphYP7MuzBXcNxBASVnRmO8+uDLAi8urhsonS8jiaAA0DW81Uo9L7nv+rC+Q3o
	a/gNF3/SQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kndw3-0002rH-Q6; Fri, 11 Dec 2020 08:37:55 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kndw0-0002q3-0C
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Dec 2020 08:37:52 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 1696980EB;
 Fri, 11 Dec 2020 08:37:59 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 2/2] Late defconfig changes for omaps for v5.11
Date: Fri, 11 Dec 2020 10:37:42 +0200
Message-ID: <pull-1607675790-251347@atomide.com-2>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1607675790-251347@atomide.com>
References: <pull-1607675790-251347@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_033752_143665_900B839A 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 arm@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201211083742.mng8T-sQdbW_PWm3DRJdXB1kHzXMEWcJqsaxtccV0Xk@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit eaf7697b6febe2b086503f525f070d8e3ca1ea0f:

  ARM: omap2plus_defconfig: Enable TI eQEP counter driver (2020-11-24 11:04:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/defconfig-late-signed

for you to fetch changes up to 2f6fc9e08bf79f11516edef855283c6212bbe78f:

  ARM: omap2plus_defconfig: enable SPI GPIO (2020-12-07 15:59:41 +0200)

----------------------------------------------------------------
Late defconfig changes for omaps for v5.11 merge window

Drop drop unused POWER_AVS option, and enable CONFIG_SPI_GPIO as
a loadable module so gta04 needs it for controlling the td028ttec1
panel.

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: omap2plus_defconfig: enable SPI GPIO

Andrey Zhizhikin (1):
      ARM: omap2plus_defconfig: drop unused POWER_AVS option

 arch/arm/configs/omap2plus_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
