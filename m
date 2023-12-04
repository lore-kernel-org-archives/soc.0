Return-Path: <SRS0=8aEA=HP=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93032C4167B
	for <soc@archiver.kernel.org>; Mon,  4 Dec 2023 13:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69485C433CA; Mon,  4 Dec 2023 13:47:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 63936C433C8;
	Mon,  4 Dec 2023 13:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63936C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2D3F152B;
	Mon,  4 Dec 2023 05:48:15 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B81A3F5A1;
	Mon,  4 Dec 2023 05:47:27 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.7
Date: Mon,  4 Dec 2023 13:47:22 +0000
Message-ID: <20231204134724.30465-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.7

for you to fetch changes up to 77f5032e94f244ba08db51e17ca8f37bd7ff9acb:

  firmware: arm_scmi: Fix possible frequency truncation when using level indexing mode (2023-12-04 12:33:44 +0000)

----------------------------------------------------------------
Arm SCMI fixes for v6.7

A fix for possible truncation/overflow in the frequency computations
as both the performance value and the multiplier are 32bit values.

----------------------------------------------------------------
Sudeep Holla (2):
      firmware: arm_scmi: Fix frequency truncation by promoting multiplier type
      firmware: arm_scmi: Fix possible frequency truncation when using level indexing mode

 drivers/firmware/arm_scmi/perf.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)
