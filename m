Return-Path: <SRS0=LnnC=MB=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ADFC4345F
	for <soc@archiver.kernel.org>; Sun, 28 Apr 2024 05:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95458C4AF19; Sun, 28 Apr 2024 05:47:41 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B906C113CC;
	Sun, 28 Apr 2024 05:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1B906C113CC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 3F4E8604E8;
	Sun, 28 Apr 2024 05:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1714283253;
	bh=9BqlwdBd+mwk4vWYBKbMPMvVOURywSUpi/q+Ly1EeUc=;
	h=From:To:Cc:Subject:Date:From;
	b=SbBNKWIDY2UCMWo/+TKoffWmnweSPjgyR9d3PyU/iy1NuEJzK+silnbcweryBFnl/
	 6oXQaYmigvJ9Ul0W1xHjxPzgpJ+3dBvlbJcCGqU1Vz0q8/tsYmOsmBsIW3gineravF
	 /yHyjl7EuaU13Epy3XRlJonuIzMRImnX2HJEpdR5MR2EU4dE0Ilj4rQituWZeBXHCS
	 hGPzbgo21zxlvrftcwv0qdIkYQEmPXFUrNOxGR+xisHkY5fQCNJ4pmSDxPGqWYSSIh
	 IM7zGc5htUuAEwCe95q3hvuu/VI7H0FF+2BWUH76XiwoFe2xKTDiB2fiXD9lneMuhA
	 nXAdiICzeFyvw==
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Driver changes for ti-sysc for v6.10
Date: Sun, 28 Apr 2024 08:47:11 +0300
Message-ID: <pull-1714283210-549557@atomide.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/drivers-ti-sysc-for-v6.10-signed

for you to fetch changes up to 4bcc2e91b9e77644ee04b290bfd2c1410d7c402e:

  bus: ti-sysc: Drop legacy idle quirk handling (2024-04-25 07:29:41 +0300)

----------------------------------------------------------------
Driver updates for ti-sysc

A change to update the handling of no-reset-on-init quirk to make it init
time only like it should be. And a change to add the missing copyrights.

Also a series of changes to simplify the driver by dropping the old unused
handling for interconnect targets tagged pm_runtime_irq_safe().

These are all non-urgent changes and can be queued whenever suitable.

----------------------------------------------------------------
Tony Lindgren (5):
      bus: ti-sysc: Move check for no-reset-on-init
      bus: ti-sysc: Add a description and copyrights
      bus: ti-sysc: Drop legacy quirk handling for uarts
      bus: ti-sysc: Drop legacy quirk handling for smartreflex
      bus: ti-sysc: Drop legacy idle quirk handling

 drivers/bus/ti-sysc.c                 | 165 +++++++---------------------------
 include/linux/platform_data/ti-sysc.h |   1 -
 2 files changed, 34 insertions(+), 132 deletions(-)
