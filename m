Return-Path: <SRS0=ZyEH=G7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D6EC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 14:46:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B407E64DEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 14:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B407E64DEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EF9k/eJXhqIiXWw/Rko0wKMUAuKVQvE0OirV9hzpNlk=; b=ArNIA9geUmELvFEm4W/ZFqZH6B
	8L0u28zUcdn3HjIt50//CtjqBY91bh1/YL7hOJCeJuRmzmVWx+k3bbSSVvwtEjnpUGZYStlVLcsQl
	kTUlNgBo4rqmLfbDp2BPDlZxy9jnKb4KE4ZUFVMRK8qYy4Oqv2JKHAlKNYbel6lGTDLW2ynYtNvWj
	wnNIa7H44fp3lSIx6lKGd4nUdzxGW0yIIx8GXCTomIWuKQ909adYf7pxB8obEd3NF1DzYM51rBqRc
	LQC16MV6YeWqS/auQzr4Zj1qeyX8BTYK1xUY1J+uAImqX8vitbn0/nTFie8l+DugfwACXGkgqge7o
	TCO3AH9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l58Xr-0008WK-MV; Thu, 28 Jan 2021 14:45:15 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l58Xo-0008VL-No
 for linux-arm-kernel@lists.infradead.org; Thu, 28 Jan 2021 14:45:13 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 6F24A80A9;
 Thu, 28 Jan 2021 14:45:13 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 1/2] SoC changes for omaps for v5.12
Date: Thu, 28 Jan 2021 16:45:01 +0200
Message-ID: <pull-1611845066-809577@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_094512_863522_FACC6802 
X-CRM114-Status: UNSURE (   7.29  )
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
Message-ID: <20210128144501.wZTZYvkp4u02xU2ugz3nJg6jDw9noJpsBJqgT-DaWt8@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/soc-signed

for you to fetch changes up to 320f6f90cbe4818cf0d0f9441772d23aa441c506:

  ARM: OMAP2+: fix spellint typo (2021-01-26 13:43:17 +0200)

----------------------------------------------------------------
SoC changes for omaps for v5.12 merge window

Update email address for Roger and fix a typo

----------------------------------------------------------------
Roger Quadros (1):
      MAINTAINERS: Update address for OMAP GPMC driver

Wang Qing (1):
      ARM: OMAP2+: fix spellint typo

 MAINTAINERS                       | 2 +-
 arch/arm/mach-omap2/clockdomain.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
