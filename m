Return-Path: <SRS0=YsBk=LT=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF7DC2B9F4
	for <soc@archiver.kernel.org>; Fri, 25 Jun 2021 10:28:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A4D0061442; Fri, 25 Jun 2021 10:28:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 5FF0C6143E;
	Fri, 25 Jun 2021 10:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FF0C6143E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 121CBED1;
	Fri, 25 Jun 2021 03:28:24 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06D553F719;
	Fri, 25 Jun 2021 03:28:22 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v5.14(part 2)
Date: Fri, 25 Jun 2021 11:28:19 +0100
Message-Id: <20210625102819.206172-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 61832b35b4d953b2b4f6c668a3ad2a3013f40532:

  firmware: arm_scmi: Avoid multiple initialisations of hdr->protocol_id (2021-06-08 16:06:12 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-5.14-2

for you to fetch changes up to 8ecab77009297ee716c92ced1dd6d8487988b624:

  firmware: arm_scmi: Ensure drivers provide a probe function (2021-06-25 10:51:25 +0100)

----------------------------------------------------------------
ARM SCMI updates for v5.14

A single fix adding check for presence of probe while registering
the driver to prevent NULL pointer access. There is also a minor cleanup
dropping the duplicate check as the driver core already takes care of it.

----------------------------------------------------------------
Sudeep Holla (2):
      firmware: arm_scmi: Simplify device probe function on the bus
      firmware: arm_scmi: Ensure drivers provide a probe function

 drivers/firmware/arm_scmi/bus.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
