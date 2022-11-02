Return-Path: <SRS0=rxLu=3C=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2959EC4332F
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 14:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4734C433D6; Wed,  2 Nov 2022 14:02:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id EB604C433C1;
	Wed,  2 Nov 2022 14:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EB604C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 901231FB;
	Wed,  2 Nov 2022 07:02:06 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B87A3F534;
	Wed,  2 Nov 2022 07:01:58 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] arm64: dts: juno: Fixes for v6.1
Date: Wed,  2 Nov 2022 14:01:56 +0000
Message-Id: <20221102140156.2758137-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-fix-6.1

for you to fetch changes up to c4a7b9b587ca1bb4678d48d8be7132492b23a81c:

  arm64: dts: juno: Add thermal critical trip points (2022-11-01 12:03:07 +0000)

----------------------------------------------------------------
Armv8 Juno fix for v6.1

Just a single fix to add the missing critical points in the thermal
zones that has been mandatory in the binding but was enforced in the
code recently.

----------------------------------------------------------------
Cristian Marussi (1):
      arm64: dts: juno: Add thermal critical trip points

 arch/arm64/boot/dts/arm/juno-base.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
