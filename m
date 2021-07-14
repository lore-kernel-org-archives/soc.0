Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C685C07E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 17:00:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268B961003
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 17:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 268B961003
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wk2O17XxRU7RiNvShYyCwpFCaRLXGozjdaTiv+Tfamw=; b=qC+Uhh1CVVqa1N
	6/YgDvcPgPTsEZdRl9FigEeGg9mIea8C01mAT45OD3Lah3DjH23cvpdogo7/D+NrP9w6PBHIC73wj
	IKlPHm11kS/vMEM4ZKLt6WVG8y+k2OTsEOeeSghaQXA1X61dd9in7Q34ahu3cPznWDwsn6ZtAS6jo
	wsQ+8MRxlojw23cwDJpZLrv/r26jcetIMaNnXUpkdBV3C8q/Qzh4ts1aNeTUhfHeFRIbb5PymUzay
	slzu2lSZ9M2ybBDIjJlrMHL6v1O9X4ZM9kWEcHhGohhx9p5N9CwYjmTn8X4cePRz5riItVi/vRz1Q
	KZnJdtmMrN69pAVxO4GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3iDY-00ECci-Fi; Wed, 14 Jul 2021 16:58:40 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3iDU-00ECbH-4z
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 16:58:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA985D6E;
 Wed, 14 Jul 2021 09:58:34 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C91C53F774;
 Wed, 14 Jul 2021 09:58:33 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: fixes for v5.14
Date: Wed, 14 Jul 2021 17:58:31 +0100
Message-ID: <20210714165831.2617437-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_095836_284107_3AE9CAED 
X-CRM114-Status: UNSURE (   7.81  )
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
Message-ID: <20210714165831.DTaoZnHSReRFZP_vs2blbHMWamLMhaiqVXi_7HBCm8Y@z>

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-5.14

for you to fetch changes up to bdb8742dc6f7c599c3d61959234fe4c23638727b:

  firmware: arm_scmi: Fix range check for the maximum number of pending messages (2021-07-13 11:42:20 +0100)

----------------------------------------------------------------
ARM SCMI fixes for v5.14

A small set of fixes:
- adding check for presence of probe while registering the driver to
  prevent NULL pointer access
- dropping the duplicate check as the driver core already takes care of it
- fix for possible scmi_linux_errmap buffer overflow
- fix to avoid sensor message structure padding
- fix the range check for the maximum number of pending SCMI messages
- fix for various kernel-doc warnings

----------------------------------------------------------------
Cristian Marussi (3):
      firmware: arm_scmi: Fix kernel doc warnings about return values
      firmware: arm_scmi: Avoid padding in sensor message structure
      firmware: arm_scmi: Fix range check for the maximum number of pending messages

Sudeep Holla (5):
      firmware: arm_scmi: Simplify device probe function on the bus
      firmware: arm_scmi: Ensure drivers provide a probe function
      firmware: arm_scmi: Fix possible scmi_linux_errmap buffer overflow
      firmware: arm_scmi: Fix kernel doc warnings
      firmware: arm_scpi: Fix kernel doc warnings

 drivers/firmware/arm_scmi/bus.c     |  8 +++-----
 drivers/firmware/arm_scmi/driver.c  | 14 +++++++++-----
 drivers/firmware/arm_scmi/notify.c  |  4 ++++
 drivers/firmware/arm_scmi/sensors.c |  6 ++++--
 include/linux/scmi_protocol.h       | 14 +++++++++-----
 include/linux/scpi_protocol.h       |  8 ++++++++
 6 files changed, 37 insertions(+), 17 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
