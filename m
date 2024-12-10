Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3576423DE8E
	for <soc@lists.linux.dev>; Tue, 10 Dec 2024 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825482; cv=none; b=ceuNH+1NYEQJMbTg3gjSAQhgTveGmMolIboMgwK8oRpWACgMhcgFHEU6xfPSuFSDen9ZfJ29TCwO7wVqUIFnatpCZjOJ+CjMkRgDTdpshwomxmPMiem2gJStZVGxrn+YTxMhiO5tBUrrY/ZQvOQ/uO9fTntQ9/QyWeHUsfj8YLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825482; c=relaxed/simple;
	bh=/b0oc4Nc4tfuikK3n267Z9evOMOl25jjfV/trqaVjmM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m0FCgUIEZ+y4xfiam75DASl/E6nikuUUEwD/doUueNh2wrwrKp3lAY9Q6rxk69si3VLSSw90xZLDiVW9+NGjqbNVqffnOEA4wl0BcifAnQx7S4J73pdFqMBXOJ9vf8myjAsGHPEYk1LL4PK5BOeehSDW6jfe5H+QZ8Gil4SplFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id D7017C4CEE0; Tue, 10 Dec 2024 10:11:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 02F10C4CEDD;
	Tue, 10 Dec 2024 10:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02F10C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 288E1113E;
	Tue, 10 Dec 2024 02:11:47 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F6D43F58B;
	Tue, 10 Dec 2024 02:11:18 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL v2] firmware: arm_ffa: Fix for v6.13
Date: Tue, 10 Dec 2024 10:11:13 +0000
Message-Id: <20241210101113.3232602-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull ! Sorry for the confusion, this is updated PR with wrong patch
dropped.

Regards,
Sudeep

-->8

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-6.13

for you to fetch changes up to 6fe437cfe2cdc797b03f63b338a13fac96ed6a08:

  firmware: arm_ffa: Fix the race around setting ffa_dev->properties (2024-12-04 09:59:54 +0000)

----------------------------------------------------------------
Arm FF-A fix for v6.13

A single fix to address a possible race around setting ffa_dev->properties
in ffa_device_register() by updating ffa_device_register() to take all
the partition information received from the firmware and updating the
struct ffa_device accordingly before registering the device to the
bus/driver model in the kernel.

----------------------------------------------------------------
Levi Yun (1):
      firmware: arm_ffa: Fix the race around setting ffa_dev->properties

 drivers/firmware/arm_ffa/bus.c    | 15 +++++++++++----
 drivers/firmware/arm_ffa/driver.c |  7 +------
 include/linux/arm_ffa.h           | 13 ++++++++-----
 3 files changed, 20 insertions(+), 15 deletions(-)
