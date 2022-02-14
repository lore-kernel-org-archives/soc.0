Return-Path: <SRS0=UCfg=S5=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD94C433F5
	for <soc@archiver.kernel.org>; Mon, 14 Feb 2022 14:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0120FC340F1; Mon, 14 Feb 2022 14:42:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id C7F52C340E9;
	Mon, 14 Feb 2022 14:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7F52C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FFD71063;
	Mon, 14 Feb 2022 06:42:50 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 629F93F70D;
	Mon, 14 Feb 2022 06:42:49 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fix for v5.17
Date: Mon, 14 Feb 2022 14:42:45 +0000
Message-Id: <20220214144245.2376150-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fix-5.17

for you to fetch changes up to 1ba603f56568c3b4c2542dfba07afa25f21dcff3:

  firmware: arm_scmi: Remove space in MODULE_ALIAS name (2022-02-11 10:37:16 +0000)

----------------------------------------------------------------
Arm SCMI fix for v5.17

A simple fix to remove space in the MODULE_ALIAS name used in the
SCMI driver as userspace expect no spaces in these names.

----------------------------------------------------------------
Alyssa Ross (1):
      firmware: arm_scmi: Remove space in MODULE_ALIAS name

 drivers/firmware/arm_scmi/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
