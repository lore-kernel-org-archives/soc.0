Return-Path: <SRS0=P5IO=DV=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55675C00528
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 12:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3BCB6C433CA; Fri,  4 Aug 2023 12:32:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 2BA52C433C7;
	Fri,  4 Aug 2023 12:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2BA52C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D2CE1007;
	Fri,  4 Aug 2023 05:33:17 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 38EA63F5A1;
	Fri,  4 Aug 2023 05:32:33 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.6
Date: Fri,  4 Aug 2023 13:32:31 +0100
Message-ID: <20230804123231.3258141-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.6

for you to fetch changes up to 31c7c1397a33d4c7ad1e06aa6ea9fc6148554b29:

  firmware: arm_scmi: Add v3.2 perf level indexing mode support (2023-08-04 12:17:19 +0100)

----------------------------------------------------------------
Arm SCMI updates for v6.6

The main addition this time is the support for SCMI v3.2 perf level
indexing mode. SCMI v3.2 adds support for hardware which works on
performance indices, instead of levels. Certain platforms use indices
to identify performance levels. Level Indexing Mode is used to describe
such platform behavior. All commands which utilize performance level
as a parameter need to specify the corresponding level index instead of
the performance level when Level Indexing Mode is used.

While at it, these changes also include hardening of all the internal
accesses to the performance domain information.

----------------------------------------------------------------
Cristian Marussi (2):
      firmware: arm_scmi: Harden perf domain info access
      firmware: arm_scmi: Add v3.2 perf level indexing mode support

 drivers/firmware/arm_scmi/perf.c | 430 +++++++++++++++++++++++++++++++--------
 1 file changed, 348 insertions(+), 82 deletions(-)
