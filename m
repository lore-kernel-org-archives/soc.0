Return-Path: <SRS0=/QGC=FY=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88510CD80C1
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 12:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C21DC433CA; Tue, 10 Oct 2023 12:43:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 3EB1BC433C8;
	Tue, 10 Oct 2023 12:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3EB1BC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F5511FB;
	Tue, 10 Oct 2023 05:44:37 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F25813F7A6;
	Tue, 10 Oct 2023 05:43:55 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Updates for v6.7
Date: Tue, 10 Oct 2023 13:43:54 +0100
Message-ID: <20231010124354.1620064-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

There is a small change in KVM FF-A proxy implementation which is Acked
by Marc and agreed to take it as part of the other changes.

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 9dda1178479aa0a73fe0eaabfe2d9a1c603cfeed:

  firmware: arm_ffa: Don't set the memory region attributes for MEM_LEND (2023-09-25 19:43:49 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-updates-6.7

for you to fetch changes up to bcefd1bf63b1ec9bb08067021cf47f0fad96f395:

  firmware: arm_ffa: Upgrade the driver version to v1.1 (2023-10-08 21:18:48 +0100)

----------------------------------------------------------------
Arm FF-A updates for v6.7

The main addition is the initial support for the notifications and
memory transaction descriptor changes added in FF-A v1.1 specification.

The notification mechanism enables a requester/sender endpoint to notify
a service provider/receiver endpoint about an event with non-blocking
semantics. A notification is akin to the doorbell between two endpoints
in a communication protocol that is based upon the doorbell/mailbox
mechanism.

The framework is responsible for the delivery of the notification from
the ender to the receiver without blocking the sender. The receiver
endpoint relies on the OS scheduler for allocation of CPU cycles to
handle a notification.

OS is referred as the receiver’s scheduler in the context of notifications.
The framework is responsible for informing the receiver’s scheduler that
the receiver must be run since it has a pending notification.

The series also includes support for the new format of memory transaction
descriptors introduced in v1.1 specification.

Apart from the main additions, it includes minor fixes to re-enable FF-A
drivers usage of 32bit mode of messaging and kernel warning due to the
missing assignment of IDR allocation ID to the FFA device. It also adds
emitting 'modalias' to the base attribute of FF-A devices.

----------------------------------------------------------------
Sudeep Holla (20):
      firmware: arm_ffa: Assign the missing IDR allocation ID to the FFA device
      firmware: arm_ffa: Allow the FF-A drivers to use 32bit mode of messaging
      firmware: arm_ffa: Emit modalias for FF-A devices
      firmware: arm_ffa: Update the FF-A command list with v1.1 additions
      firmware: arm_ffa: Implement notification bitmap create and destroy interfaces
      firmware: arm_ffa: Implement the notification bind and unbind interface
      firmware: arm_ffa: Implement the FFA_RUN interface
      firmware: arm_ffa: Implement the FFA_NOTIFICATION_SET interface
      firmware: arm_ffa: Implement the FFA_NOTIFICATION_GET interface
      firmware: arm_ffa: Implement the NOTIFICATION_INFO_GET interface
      firmware: arm_ffa: Initial support for scheduler receiver interrupt
      firmware: arm_ffa: Add schedule receiver callback mechanism
      firmware: arm_ffa: Add interfaces to request notification callbacks
      firmware: arm_ffa: Add interface to send a notification to a given partition
      firmware: arm_ffa: Add notification handling mechanism
      firmware: arm_ffa: Simplify the computation of transmit and fragment length
      KVM: arm64: FFA: Remove access of endpoint memory access descriptor array
      firmware: arm_ffa: Switch to using ffa_mem_desc_offset() accessor
      firmware: arm_ffa: Update memory descriptor to support v1.1 format
      firmware: arm_ffa: Upgrade the driver version to v1.1

 arch/arm64/kvm/hyp/nvhe/ffa.c     |  10 +-
 drivers/firmware/arm_ffa/bus.c    |  16 +-
 drivers/firmware/arm_ffa/driver.c | 770 +++++++++++++++++++++++++++++++++++++-
 include/linux/arm_ffa.h           |  79 +++-
 4 files changed, 840 insertions(+), 35 deletions(-)
