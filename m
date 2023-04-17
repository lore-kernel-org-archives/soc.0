Return-Path: <SRS0=SF3S=AI=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521BBC77B76
	for <soc@archiver.kernel.org>; Mon, 17 Apr 2023 14:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 157B0C4339C; Mon, 17 Apr 2023 14:57:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id E01CEC433EF;
	Mon, 17 Apr 2023 14:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E01CEC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 204A9168F;
	Mon, 17 Apr 2023 07:58:36 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6CBA23F6C4;
	Mon, 17 Apr 2023 07:57:51 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.4
Date: Mon, 17 Apr 2023 15:57:43 +0100
Message-Id: <20230417145743.1904318-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit d617808e3b8324eacebabefec49dc75536ee39cc:

  firmware: arm_scmi: Use the bitmap API to allocate bitmaps (2023-03-08 15:24:15 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.4

for you to fetch changes up to 9f68ff79ec2cb303f360a35eef5dd8f1f0f817e1:

  firmware: arm_scmi: Add support for unidirectional mailbox channels (2023-04-05 09:39:18 +0100)

----------------------------------------------------------------
Arm SCMI updates for v6.4

The main and only new addition this time around is the support for
unidirectional mailbox channels. SCMI communicates between the agent
and the platform using one bidirectional 'a2p' channel used by the agent
to send SCMI commands and synchronously receive the related replies, and
an optional 'p2a' unidirectional channel used to asynchronously receive
delayed responses and notifications emitted from the platform.

In order to support platforms that support only unidirectional mailbox
hardware channels, the existing bindings are extended to support the
same. Both bidirectional and unidirectional channels support for the
SCMI mailbox can coexist. The correct and effective combination of
defined 'mboxes' and 'shmem' descriptors determines the type of the
mailbox channel.

This also contains a fix for the transfers allocation on Rx channel
especially when the base protocol doesn't use Rx channel while some
of the protocols can have dedicated Rx channels.

----------------------------------------------------------------
Cristian Marussi (3):
      firmware: arm_scmi: Fix xfers allocation on Rx channel
      dt-bindings: firmware: arm,scmi: Support mailboxes unidirectional channels
      firmware: arm_scmi: Add support for unidirectional mailbox channels

 .../devicetree/bindings/firmware/arm,scmi.yaml     | 48 ++++++++---
 drivers/firmware/arm_scmi/driver.c                 |  2 +-
 drivers/firmware/arm_scmi/mailbox.c                | 95 +++++++++++++++++++---
 3 files changed, 123 insertions(+), 22 deletions(-)
