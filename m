Return-Path: <SRS0=RGj4=KG=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC42C48BF6
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 08:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0DFBC43394; Thu, 29 Feb 2024 08:15:00 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FD89C433F1;
	Thu, 29 Feb 2024 08:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0FD89C433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 8C9B2603C4;
	Thu, 29 Feb 2024 08:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709194499;
	bh=gu1HnfHt+xN6xFKRH6l06ExVCQXu9YfxKm1JsRRvMY4=;
	h=From:To:Cc:Subject:Date:From;
	b=Zs+vnYIZlLI990w7MXxILCIgaHfgVOmUgB64+6HJ6e79UkfzH3OezgXl2kb2WvvY1
	 gmiXH9MnvOY0rDN6rf8PdsnY2POFuc4nrabI120ZC2UiJ92WVoF8FW23vqJE77FToO
	 s8sMgre/tTP7v0x8ly9oYmlgpQoxgH7tS+DRWxXHwe0vf//AhNvP6f6M+4gy+OVY+Z
	 blH6LhHrrWsBsxl1D0OhPAwykBjrYehiyiVxWbPJJ6k4yLfrIBgYyljq0HMMlWa8xF
	 bQ91Hm+F6fRbPjEsHUjQG/Rgf/NU3R0hiE9EsmBDOUBZ55QUJYiJeaU39lAW/u1yrh
	 fsQa2P5QDFtTQ==
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Driver change for ti-sysc
Date: Thu, 29 Feb 2024 10:14:44 +0200
Message-ID: <pull-1709194472-263643@atomide.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.9/ti-sysc-signed

for you to fetch changes up to 097948afa1c2220609683106c884a3c710e62c80:

  bus: ti-sysc: constify the struct device_type usage (2024-02-28 09:30:25 +0200)

----------------------------------------------------------------
Driver change for ti-sysc

Just one change to constify struct device_type.

----------------------------------------------------------------
Ricardo B. Marliere (1):
      bus: ti-sysc: constify the struct device_type usage

 drivers/bus/ti-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
