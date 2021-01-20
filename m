Return-Path: <SRS0=0ZpT=GX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90828C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 17:51:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CBDD223DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 17:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CBDD223DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jrsw4sG35i5D9HEtcbzLs7h0nAXzhOkyemV27cxw148=; b=qcRLbuuUyVZiNFegMLW1CEN3z2
	MS+wes5LbpHp+RHc08kaAdVx6njvkTAHZ6J/6H+n6U6j+/meQVjF2LKmu5N6pVeB0OxoKwzWGqXwZ
	ld9SLUX43frs/CyBzjFiY/ewHdS3yf4Y/b8e+QfwZ2YWWXTwF18YaXRscApesk6z7zvLnPdbAl6PX
	puyYwggCJbETbb3RqyuS2i+Ef/v0B58DoNNNpYR0lbWGpCG5bqmc6KMkvBJpdE8tM6FDRtIQ8Blty
	KxMzyz8Fx8tpwcms7UkTwM3eSM9vEiIcx1qCIHecigtJfBRvbv0s52N/xPp2Ytnvav2uf1F1wjHc+
	BFvCgISQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Hbr-0000Nt-Ui; Wed, 20 Jan 2021 17:49:36 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2HXP-0006OU-Po
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Jan 2021 17:45:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85EBB101E;
 Wed, 20 Jan 2021 09:44:22 -0800 (PST)
Received: from bogus (unknown [10.57.35.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEEA53F68F;
 Wed, 20 Jan 2021 09:44:02 -0800 (PST)
Date: Wed, 20 Jan 2021 17:43:56 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v5.12
Message-ID: <20210120174356.cnxopzjjpqo5e3ws@bogus>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_124459_940049_A51F8D8C 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: Olof Johansson <olof@lixom.net>, Sudeep Holla <sudeep.holla@arm.com>,
 Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210120174356.0exKc_0bz1oxHNWzQOhE0O-NwzUtN-6kYxdVAKpyaMU@z>

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-5.12

for you to fetch changes up to a90b6543bf062d65292b2c76f1630507d1c9d8ec:

  firmware: arm_scmi: Fix call site of scmi_notification_exit (2021-01-13 14:30:16 +0000)

----------------------------------------------------------------
ARM SCMI updates for v5.12

Addition of optional interrupt to signal completion of the request when
using SMC/HVC transport as on some platforms they can return before the
SCMI request is completed. Apart from that, we just have a minor fix in
scmi_remove which was found recently as we are now experimenting more on
SCMI as module. Finally, we are adding Cristian as official reviewer for
SCMI since he is more involved in active development of new features.

----------------------------------------------------------------
Cristian Marussi (1):
      firmware: arm_scmi: Fix call site of scmi_notification_exit

Jim Quinlan (2):
      dt-bindings: arm: Add optional interrupt to smc/hvc SCMI transport
      firmware: arm_scmi: Augment SMC/HVC to allow optional interrupt

Sudeep Holla (1):
      MAINTAINERS: Update ARM SCMI entry

 Documentation/devicetree/bindings/arm/arm,scmi.txt |  8 +++++
 MAINTAINERS                                        |  2 ++
 drivers/firmware/arm_scmi/driver.c                 |  4 +--
 drivers/firmware/arm_scmi/smc.c                    | 42 +++++++++++++++++++++-
 4 files changed, 53 insertions(+), 3 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
