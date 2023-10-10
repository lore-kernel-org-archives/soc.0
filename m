Return-Path: <SRS0=/QGC=FY=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6FFCD80C1
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 12:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D0EDC433C8; Tue, 10 Oct 2023 12:43:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id D75D8C433C7;
	Tue, 10 Oct 2023 12:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D75D8C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C1931FB;
	Tue, 10 Oct 2023 05:44:23 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC8253F7A6;
	Tue, 10 Oct 2023 05:43:41 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] ARM: vexpress: Update for v6.7
Date: Tue, 10 Oct 2023 13:43:39 +0100
Message-ID: <20231010124339.1620012-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/vexpress-update-6.7

for you to fetch changes up to cb289ce6e2ce4cee594285d0c1e0249ae868c1de:

  bus: vexpress-config: Annotate struct vexpress_syscfg_func with __counted_by (2023-09-25 19:38:27 +0100)

----------------------------------------------------------------
Arm Vexpress updates for v6.7

Just a single update to use __counted_by annotation in config bus driver
in preparation to the upcoming versions of the toolchains(GCC and Clang)
with __counted_by attribute.

----------------------------------------------------------------
Kees Cook (1):
      bus: vexpress-config: Annotate struct vexpress_syscfg_func with __counted_by

 drivers/bus/vexpress-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
