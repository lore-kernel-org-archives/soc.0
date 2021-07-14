Return-Path: <SRS0=m6+P=MG=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBC0C07E9A
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 16:58:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E63BF613C1; Wed, 14 Jul 2021 16:58:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 8D42261289;
	Wed, 14 Jul 2021 16:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D42261289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C216D6E;
	Wed, 14 Jul 2021 09:58:10 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 44FAD3F774;
	Wed, 14 Jul 2021 09:58:09 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: fixes for v5.14
Date: Wed, 14 Jul 2021 17:58:06 +0100
Message-Id: <20210714165806.2617325-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/arm-ffa-fixes-5.14

for you to fetch changes up to dd925db6f07556061c11ab1fbfa4a0145ae6b438:

  firmware: arm_ffa: Fix a possible ffa_linux_errmap buffer overflow (2021-07-12 14:20:08 +0100)

----------------------------------------------------------------
Arm FF-A fixes for v5.14

A small set of fixes:
- adding check for presence of probe while registering the driver to
  prevent NULL pointer access
- dropping the duplicate check as the driver core already takes care of it
- fixing possible ffa_linux_errmap buffer overflow and
- fixing kernel-doc warning for comment style

----------------------------------------------------------------
Sudeep Holla (2):
      firmware: arm_ffa: Fix the comment style
      firmware: arm_ffa: Fix a possible ffa_linux_errmap buffer overflow

Uwe Kleine-König (2):
      firmware: arm_ffa: Ensure drivers provide a probe function
      firmware: arm_ffa: Simplify probe function

 drivers/firmware/arm_ffa/bus.c    | 6 +++---
 drivers/firmware/arm_ffa/driver.c | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)
