Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33C0C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 06:55:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 423D364E4B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 06:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 423D364E4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BMRVc4SZnwGDcX74j4unFt6FGKChjQKtQTjOmOvti9c=; b=TRLxyu7NWpmudyB8/yv1DmJqZl
	Z/TQuAEx9rGg536gjkbJmYv0rftXfXYqUuL43MYcqYNXu9PfPGpuvJjOuZzpddJ7da2t6ezvivr0p
	ajZKHOji2t6yTBY2sjygD38dbM+O4xBAw2iKPZtXeFmctWeKH2yXax5wxnsTqZS+/rKk3UGwr5xQF
	GFDIny0410yno143Awz9ZiTvrBtUG6meqStfN4/XwMuoDw95PEWCpvZ9Hy1HwC7WqVQJ/+9qtoTkd
	XTz5yPSwdGqdqHAnpd/TKuqR0u66SNjLc2vPuUXBooJtJERoGRUfJ/JTbHKnjJie9rs5tN2BsA1/6
	Mmdr/cKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7YX8-00020Q-8m; Thu, 04 Feb 2021 06:54:30 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7YX5-0001zp-DJ
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 06:54:28 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 0740780C5;
 Thu,  4 Feb 2021 06:54:34 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL] Defconfig changes for omaps for v5.12
Date: Thu,  4 Feb 2021 08:54:15 +0200
Message-ID: <pull-1612421637-483551@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_015427_539090_512F4FEA 
X-CRM114-Status: UNSURE (   7.24  )
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
Message-ID: <20210204065415.l_Lw0i9XlKiDg1OPGUtZvBwgFjHhZA97go5y1wbRAqU@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/defconfig-signed

for you to fetch changes up to 07bf01714f7f1db805ddaabba15251755e14b903:

  ARM: omap2plus_defconfig: Update for dropped options (2021-01-26 14:04:03 +0200)

----------------------------------------------------------------
Defconfig changes for omaps for v5.12 merge window

Update for moved and dropped options to make creating patches
against omap2plus_defconfig easier.

----------------------------------------------------------------
Tony Lindgren (2):
      ARM: omap2plus_defconfig: Update for moved options
      ARM: omap2plus_defconfig: Update for dropped options

 arch/arm/configs/omap2plus_defconfig | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
