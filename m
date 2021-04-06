Return-Path: <SRS0=1rdH=JD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,SUBJ_ALL_CAPS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF20C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 10:12:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3F8661279
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 10:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3F8661279
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1rosC17mrjqj6B8Wi6zTaBoRnYjU2iRzSuLNOu6N3sg=; b=mGwVvWks1qmonIy0p+znx7deV
	wjWcVhRL6+o+LXYXKrowpS76rWJArbT65F78P0vqvzbqzu/TFDh9EV5BQSrFMgkXCQquAfppOyJLA
	g8eC+gUMfmowEp465r8b+Qsixcl3i6OwwpJW+DhTy/0XLFbPt1dZFyfzqKIZvQYdD+RzSzCRD6z6n
	CWqw3gY2xMAm33VMpNG/986vbi3zj9Q8a+L9pC78uIuH6qlvdghwcSWN1/8GXWy6EhlznJIQ/r55B
	Bakkim/ygxR8J6xaN9ydJ0efBpvPqJUFvH+VbGCUktW4Dpkuii6zDnqnPwm0flNRplc/8Mbyqlbzi
	1xxPQ0w9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTig9-0027rg-5f; Tue, 06 Apr 2021 10:11:25 +0000
Received: from muru.com ([72.249.23.125])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lTift-0027q4-39
 for linux-arm-kernel@lists.infradead.org; Tue, 06 Apr 2021 10:11:11 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 2EBC88128;
 Tue,  6 Apr 2021 10:12:17 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] 
Date: Tue,  6 Apr 2021 13:11:00 +0300
Message-ID: <pull-1617703816-65652@atomide.com-3>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <pull-1617703816-65652@atomide.com>
References: <pull-1617703816-65652@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_111109_920957_762DC5DA 
X-CRM114-Status: UNSURE (   7.50  )
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
Message-ID: <20210406101100.9pFOd2qXpCpEd4b7sIAZ3cT2QGHZv_6yY_oSCkpnTdI@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/defconfig-signed

for you to fetch changes up to f6a7ea04ad2044e8f05b55f3bdd3133f468f60d1:

  ARM: omap2plus_defconfig: Add AT25 EEPROM module (2021-03-24 13:46:55 +0200)

----------------------------------------------------------------
Defconfig changes for omaps for v5.13

Update defconfig to have nefilter available as loadable modules
to make the defconfig more usable for networked devices. And we now
select SIMPLE_PM_BUS so it can be dropped. And some devices use
EEPROM_AT25 so let's add it as a loadable module.

----------------------------------------------------------------
Adam Ford (1):
      ARM: omap2plus_defconfig: Add AT25 EEPROM module

Ivan Jelincic (2):
      ARM: omap2plus_defconfig: Update for dropped simple-pm-bus
      ARM: omap2plus_defconfig: Enable Netfilter components as modules

 arch/arm/configs/omap2plus_defconfig | 151 ++++++++++++++++++++++++++++++++++-
 1 file changed, 150 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
