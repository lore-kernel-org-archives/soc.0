Return-Path: <SRS0=WkcZ=JZ=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4F0C433B4
	for <soc@archiver.kernel.org>; Wed, 28 Apr 2021 09:31:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5AB8361428; Wed, 28 Apr 2021 09:31:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id F08E661429;
	Wed, 28 Apr 2021 09:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F08E661429
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B08DD6E;
	Wed, 28 Apr 2021 02:31:58 -0700 (PDT)
Received: from bogus (unknown [10.57.61.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 270543F70D;
	Wed, 28 Apr 2021 02:31:57 -0700 (PDT)
Date: Wed, 28 Apr 2021 10:31:48 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v5.13
Message-ID: <20210428093148.flrcowzr2dsj7byz@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit d4f9dddd21f39395c62ea12d3d91239637d4805f:

  firmware: arm_scmi: Add dynamic scmi devices creation (2021-03-30 16:35:16 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-5.13

for you to fetch changes up to 03f840c49207e8c125b3df8c29c13137c6675d42:

  firmware: arm_scmi: Remove duplicate declaration of struct scmi_protocol_handle (2021-04-27 11:57:26 +0100)

----------------------------------------------------------------
ARM SCMI fixes for v5.13

A fix for very old possible ternary operation sign extention bug in the old
ARM SCPI firmware driver and a cleanup to remove duplicate structure declartion
in SCMI driver.

----------------------------------------------------------------
Dan Carpenter (1):
      firmware: arm_scpi: Prevent the ternary sign expansion bug

Wan Jiabing (1):
      firmware: arm_scmi: Remove duplicate declaration of struct scmi_protocol_handle

 drivers/firmware/arm_scmi/notify.h | 2 --
 drivers/firmware/arm_scpi.c        | 4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)
