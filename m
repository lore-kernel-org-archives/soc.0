Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2448A79D2
	for <soc@lists.linux.dev>; Thu,  2 Jan 2025 15:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735832436; cv=none; b=B7/a9nYpDprVvCUU3y1qSvGJPeZII18zYjsfgRVFZiCxlku4ja79/qwpdUjx9QjScOT140mIaStxnK7QtdgvkrLZOj9CcOo2JxykvCoT3ReU5K5EByQvMJ9pqC3QLjHOkyjITbaq4X/ST4PmwbS4ON1qJH/dvL5iPrMixG+I5mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735832436; c=relaxed/simple;
	bh=XU6w/ccmn+C9AE5EUDBn/lgfSciI2gEm5A2JJ7Um/mo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LSXus5Ye3OgAOA2XnM+PAOaElV0oqpbJCCC/GWmpI5rjHLBxvkr67ACTpYhakwxHPW6lYjpeZB8SsPEO33wYdS124KXKBh4yWnknYNEzwyIDeMirjI0bb0z3rLn68BppHOUUf+rAXHl40+cWCL27eFYLACMoRNDNXznMkG/8brE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id AEA86C4CEDD; Thu,  2 Jan 2025 15:40:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 49F86C4CED0;
	Thu,  2 Jan 2025 15:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49F86C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABF2011FB;
	Thu,  2 Jan 2025 07:41:01 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5EDD03F59E;
	Thu,  2 Jan 2025 07:40:32 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.14
Date: Thu,  2 Jan 2025 15:40:24 +0000
Message-Id: <20250102154024.2168165-1-sudeep.holla@arm.com>
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.14

for you to fetch changes up to 3f3f0e53e9ae906844e8309fa433b48372f905e1:

  firmware: arm_scmi: Add aliases to transport modules (2024-12-10 10:30:45 +0000)

----------------------------------------------------------------
Arm SCMI updates for 6.14

This mainly has 2 updates:
1. Extension of the transport properties read from devicetree to support
   multiple SCMI platform/server instances
2. Addition of the capability to automatically load the proper SCMI vendor
   protocol module. The vendor protocol selection is already provided by
   the SCMI core while the automatic loading of vendor protocols was not.

----------------------------------------------------------------
Cristian Marussi (4):
      firmware: arm_scmi: Allow transport properties for multiple instances
      firmware: arm_scmi: Support vendor protocol modules autoloading
      firmware: arm_scmi: Add module aliases to i.MX vendor protocols
      firmware: arm_scmi: Add aliases to transport modules

 drivers/firmware/arm_scmi/common.h                 |  4 +-
 drivers/firmware/arm_scmi/driver.c                 | 74 ++++++++++++++++------
 drivers/firmware/arm_scmi/transports/mailbox.c     |  1 +
 drivers/firmware/arm_scmi/transports/smc.c         |  1 +
 drivers/firmware/arm_scmi/transports/virtio.c      |  1 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c |  5 +-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |  5 +-
 include/linux/scmi_imx_protocol.h                  |  9 +--
 8 files changed, 71 insertions(+), 29 deletions(-)
