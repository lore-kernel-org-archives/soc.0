Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438C11993BD
	for <soc@lists.linux.dev>; Fri, 11 Apr 2025 09:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363968; cv=none; b=Kcjhej3SycSVjieKQaMV7QmZPV/GNs3TvynTQ2GR/JpSGyk8z/ryuZuT+rX4SORZOS6Ix37VVwS22INPoBF6Hot2MiwOXcqPmAGaFZGh6Zeh8b0K29EbHydX50osbekvZIMi4+cnDEOJXL09dNMJOeEW98RgOVVStpxWYgPfOxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363968; c=relaxed/simple;
	bh=QyWE1RRynpaYcQrke0CXgSXBN5JdiplDs8nk4rkXPEs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rQQbQylCskkHzUzu+GXsi2GdNx6UUkq1pycmFzI1cp3TKm+ASKoMHp0EJlLdajSKd5OrhyG7/p7JcqJI4GuXTylo2VzQqgEzq9Sapj38HFfBIK+/oC7ebtVuINpLhZA1t47YCRsjldXc6fml4xSy1r48nafD2nhF/hGFsb6snu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id BEDC5C4CEE8; Fri, 11 Apr 2025 09:32:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id D6198C4CEE2;
	Fri, 11 Apr 2025 09:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6198C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6CE5106F;
	Fri, 11 Apr 2025 02:32:45 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C9BF13F6A8;
	Fri, 11 Apr 2025 02:32:44 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.15
Date: Fri, 11 Apr 2025 10:32:39 +0100
Message-Id: <20250411093239.1060395-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.15

for you to fetch changes up to c23c03bf1faa1e76be1eba35bad6da6a2a7c95ee:

  firmware: arm_scmi: Fix timeout checks on polling path (2025-04-08 10:31:59 +0100)

----------------------------------------------------------------
Arm SCMI fixes for v6.15

Couple of fixes addressing issues with timeout in the polling path
and device reference count imbalance detected by kmemleak.

1. The change fixes a timeout issue in the polling path of SCMI transactions
   where false positives could occur if the polling thread was pre-empted,
   causing it to appear as though a timeout occurred when it hadn't. The fix
   ensures that the polling result is verified before reporting a timeout,
   accounting for potential pre-emption or out-of-order replies.

2. It also corrects a device reference count imbalance caused by
   device_find_child() during device destruction, which prevented proper
   cleanup and triggered memory leaks detected by KMemleak.

----------------------------------------------------------------
Cristian Marussi (2):
      firmware: arm_scmi: Balance device refcount when destroying devices
      firmware: arm_scmi: Fix timeout checks on polling path

 drivers/firmware/arm_scmi/bus.c    |  3 +++
 drivers/firmware/arm_scmi/driver.c | 13 ++++++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)
