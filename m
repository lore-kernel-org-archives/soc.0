Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289FF20D4E1
	for <soc@lists.linux.dev>; Thu,  5 Dec 2024 11:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733399035; cv=none; b=Lj9TRkpKpDVjBYVTrWjn3Uu32MFrcfYDp9ncmJqmGCPFnGMWQw73NY/oZvr80zrj8dXSy00pJzSPEy6hQpuQ1qnomWg1Bpy2SgRWSSwWrHGED9mOWsBxkELchmC84DGJGNhHCbi3eKYfDwW3dtb/IktPT8EsE5FTOcqJ5WxNFKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733399035; c=relaxed/simple;
	bh=o4Nw1On8duC+30aMkioSM7+mKmUV5sy4yMqGMi/MLjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IlCb+wPLDvHBjIrGNsdHjxCjmxXmb622IZtWFC+cYIhqmdGN/gQf9KWHiAll6DzfiuZ6nt8UDVn3lZfTY9SsBY9Q5yKi6sf2GoAJJHbrJBDFT/jgTPN2MrEhwjfLgQ0qo37EaBKDJSAbzib9nHLzmyyfl5868fzyuNRvmW/MT4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id EA323C4AF0B; Thu,  5 Dec 2024 11:43:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 30142C4CED1;
	Thu,  5 Dec 2024 11:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30142C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E0A6FEC;
	Thu,  5 Dec 2024 03:44:20 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08BB13F71E;
	Thu,  5 Dec 2024 03:43:50 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fix for v6.13
Date: Thu,  5 Dec 2024 11:43:48 +0000
Message-Id: <20241205114348.708618-1-sudeep.holla@arm.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fix-6.13

for you to fetch changes up to 514b2262ade48a0503ac6aa03c3bfb8c5be69b21:

  firmware: arm_scmi: Fix i.MX build dependency (2024-12-03 15:47:11 +0000)

----------------------------------------------------------------
Arm SCMI fix for v6.13

Fix for the build issue in the ASoC driver with the SCMI support by
enforcing the link-time dependency if IMX_SCMI_MISC_DRV is a loadable
module but not if that is disabled.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: arm_scmi: Fix i.MX build dependency

 drivers/firmware/arm_scmi/vendors/imx/Kconfig | 1 +
 drivers/firmware/imx/Kconfig                  | 1 -
 sound/soc/fsl/Kconfig                         | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
