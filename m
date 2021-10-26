Return-Path: <SRS0=Y/GB=PO=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6D7C433EF
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 14:15:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C3B5D6108B; Tue, 26 Oct 2021 14:15:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 5FE7160E8F;
	Tue, 26 Oct 2021 14:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FE7160E8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0F89D6E;
	Tue, 26 Oct 2021 07:15:41 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF2853F73D;
	Tue, 26 Oct 2021 07:15:40 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Updates for 5.16
Date: Tue, 26 Oct 2021 15:15:35 +0100
Message-Id: <20211026141535.1920602-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Sorry for the late pull request. It is not too big and has been in next
for a week now. I hope it can be still merged.

Please pull !

Regards,
Sudeep

-->8

The following changes since commit eb7b52e6db7c21400b9b2d539f9343fb6e94bd94:

  firmware: arm_ffa: Fix __ffa_devices_unregister (2021-10-05 10:39:47 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/arm-ffa-updates-5.16

for you to fetch changes up to 01537a078b86917c7bb69aa4b756b42b980c158b:

  firmware: arm_ffa: Remove unused 'compat_version' variable (2021-10-26 12:46:15 +0100)

----------------------------------------------------------------
Arm FF-A updates for v5.16

Just couple of minor updates:
- Adding support for MEMORY_LEND API
- Handling compatibility with different firmware versions(especially
  dealing with newer/higher versions than the one supported by the driver)

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: arm_ffa: Remove unused 'compat_version' variable

Marc Bonnici (1):
      firmware: arm_ffa: Add support for MEM_LEND

Sudeep Holla (1):
      firmware: arm_ffa: Handle compatibility with different firmware versions

 drivers/firmware/arm_ffa/driver.c | 53 +++++++++++++++++++++++++++++++++++----
 include/linux/arm_ffa.h           |  2 ++
 2 files changed, 50 insertions(+), 5 deletions(-)
