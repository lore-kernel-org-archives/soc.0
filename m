Return-Path: <SRS0=dP6n=XD=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43868C43334
	for <soc@archiver.kernel.org>; Tue, 28 Jun 2022 13:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00F58C3411D; Tue, 28 Jun 2022 13:33:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id DC1E2C341CB;
	Tue, 28 Jun 2022 13:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DC1E2C341CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D776152B;
	Tue, 28 Jun 2022 06:33:20 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 43B0D3F5A1;
	Tue, 28 Jun 2022 06:33:19 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v5.19(Round 2)
Date: Tue, 28 Jun 2022 14:33:15 +0100
Message-Id: <20220628133315.699803-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

We pushed several extra conformance checks in the SCMI driver and quite a few
firmware bugs have been discovered with that. Due to absence of formal
conformace test suite for SCMI, we have to workaround them in the kernel for
now :(.

Regards,
Sudeep

-->8

The following changes since commit 44dbdf3bb3f44bf08897ed5f22eb262edcf3d926:

  firmware: arm_scmi: Fix incorrect error propagation in scmi_voltage_descriptors_get (2022-06-12 19:59:55 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-5.19-2

for you to fetch changes up to 4ce7e51dc712f8a006ce6abcc49f788c79287c03:

  firmware: arm_scmi: Remove usage of the deprecated ida_simple_xxx API (2022-06-27 16:58:14 +0100)

----------------------------------------------------------------
Arm SCMI firmware driver fixes for v5.19

Few more fixes to address:
1. Issue reported on Juno with HDLCD clock which turned out to be yet
   another firmware issue. The firmware is not conformant to the spec and
   we now have to workaround as this may be copied to other platforms as
   well. The spec expects to return size of 3 for a range clock rate
   description while the firmware returns 1. We have other ways to validate
   all the 3 entries the driver reads are polpulated and we use the same
   to workaround this firmware bug.

2. Optee transport not setting the correct reponse length which is similar
   to the one reported earlier on Rockchip platform.

3. Drop the usage of the deprecated ida_simple_{get,remove} and migrate to the
   ida_{alloc,free}

----------------------------------------------------------------
Bo Liu (1):
      firmware: arm_scmi: Remove usage of the deprecated ida_simple_xxx API

Cristian Marussi (1):
      firmware: arm_scmi: Relax CLOCK_DESCRIBE_RATES out-of-spec checks

Vincent Guittot (1):
      firmware: arm_scmi: Fix response size warning for OPTEE transport

 drivers/firmware/arm_scmi/bus.c       |  6 +++---
 drivers/firmware/arm_scmi/clock.c     | 26 +++++++++++++++++++++++++-
 drivers/firmware/arm_scmi/driver.c    |  1 +
 drivers/firmware/arm_scmi/optee.c     |  7 ++++++-
 drivers/firmware/arm_scmi/protocols.h |  3 +++
 5 files changed, 38 insertions(+), 5 deletions(-)
