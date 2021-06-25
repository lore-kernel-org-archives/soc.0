Return-Path: <SRS0=YsBk=LT=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A685C2B9F4
	for <soc@archiver.kernel.org>; Fri, 25 Jun 2021 10:28:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4F67D61441; Fri, 25 Jun 2021 10:28:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id C686F6143E;
	Fri, 25 Jun 2021 10:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C686F6143E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43279ED1;
	Fri, 25 Jun 2021 03:28:11 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51E713F719;
	Fri, 25 Jun 2021 03:28:10 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Updates for v5.14(part 2)
Date: Fri, 25 Jun 2021 11:28:07 +0100
Message-Id: <20210625102807.206112-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit cc2195fe536c28e192df5d07e6dd277af36814b4:

  firmware: arm_ffa: Add support for MEM_* interfaces (2021-05-26 22:38:43 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/arm-ffa-5.14-2

for you to fetch changes up to a990edc2481124009f11416e9f0bd32b727c9255:

  firmware: arm_ffa: Fix the comment style (2021-06-22 17:25:11 +0100)

----------------------------------------------------------------
Arm FF-A updates for v5.14

Couple of fixes: one adding check for presence of probe while registering
the driver to prevent NULL pointer access and other fixing some code
comment style reported by clang as warning. There is also a minor cleanup
dropping the duplicate check as the driver core already takes care of it.

----------------------------------------------------------------
Sudeep Holla (1):
      firmware: arm_ffa: Fix the comment style

Uwe Kleine-König (2):
      firmware: arm_ffa: Ensure drivers provide a probe function
      firmware: arm_ffa: Simplify probe function

 drivers/firmware/arm_ffa/bus.c    | 6 +++---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
