Return-Path: <SRS0=A+th=GX=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FC4C433E0
	for <soc@archiver.kernel.org>; Wed, 20 Jan 2021 17:44:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E476C23122; Wed, 20 Jan 2021 17:44:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 41A742070A;
	Wed, 20 Jan 2021 17:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41A742070A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=sudeep.holla@arm.com
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
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v5.12
Message-ID: <20210120174356.cnxopzjjpqo5e3ws@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215

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
