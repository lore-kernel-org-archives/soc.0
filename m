Return-Path: <SRS0=rxLu=3C=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255B8C4332F
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 14:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E389DC43470; Wed,  2 Nov 2022 14:01:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 4A107C433D6;
	Wed,  2 Nov 2022 14:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A107C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D41231FB;
	Wed,  2 Nov 2022 07:01:53 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8D1033F534;
	Wed,  2 Nov 2022 07:01:46 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.1
Date: Wed,  2 Nov 2022 14:01:42 +0000
Message-Id: <20221102140142.2758107-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.1

for you to fetch changes up to 1eff6929aff594fba3182660f7b6213ec0ceda0c:

  firmware: arm_scmi: Fix deferred_tx_wq release on error paths (2022-11-01 11:36:20 +0000)

----------------------------------------------------------------
Arm SCMI fixes for v6.1

A bunch of fixes to handle:
1. A possible resource leak in scmi_remove(). The returned error
   value gets ignored by the driver core and can remove the device and
   free the devm-allocated resources. As a simple solution to be able to
   easily backport, the bind attributes in the driver is suppressed as
   there is no need to support it. Additionally the remove path is cleaned
   up by adding device links between the core and the protocol devices
   so that a proper and complete unbinding happens.
2. A possible spin-loop in the SCMI transmit path in case of misbehaving
   platform firmware. A timeout is added to the existing loop so that
   the SCMI stack can bailout aborting the transmission with warnings.
3. Optional Rx channel correctly by reporting any memory errors instead
   of ignoring the same with other allowed errors.
4. The use of proper device for all the device managed allocations in the
   virtio transport.
5. Incorrect deferred_tx_wq release on the error paths by using devres
   API(devm_add_action_or_reset) to manage the release in the error path.

----------------------------------------------------------------
Cristian Marussi (6):
      firmware: arm_scmi: Cleanup the core driver removal callback
      firmware: arm_scmi: Suppress the driver's bind attributes
      firmware: arm_scmi: Make tx_prepare time out eventually
      firmware: arm_scmi: Make Rx chan_setup fail on memory errors
      firmware: arm_scmi: Fix devres allocation device in virtio transport
      firmware: arm_scmi: Fix deferred_tx_wq release on error paths

 drivers/firmware/arm_scmi/bus.c     | 11 ++++++++++
 drivers/firmware/arm_scmi/common.h  |  5 ++++-
 drivers/firmware/arm_scmi/driver.c  | 41 ++++++++++++++++++++++++-------------
 drivers/firmware/arm_scmi/mailbox.c |  2 +-
 drivers/firmware/arm_scmi/optee.c   |  2 +-
 drivers/firmware/arm_scmi/shmem.c   | 31 ++++++++++++++++++++++++----
 drivers/firmware/arm_scmi/smc.c     |  2 +-
 drivers/firmware/arm_scmi/virtio.c  | 26 ++++++++++++++---------
 8 files changed, 88 insertions(+), 32 deletions(-)
