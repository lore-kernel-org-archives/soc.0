Return-Path: <SRS0=vZI3=D3=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DFFC001DE
	for <soc@archiver.kernel.org>; Thu, 10 Aug 2023 09:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D0BCC433C7; Thu, 10 Aug 2023 09:17:08 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 92887C433C8;
	Thu, 10 Aug 2023 09:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 92887C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id E592A8107;
	Thu, 10 Aug 2023 09:17:04 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/4] Maintainer file list update for omaps for v6.6
Date: Thu, 10 Aug 2023 12:16:51 +0300
Message-ID: <pull-1691658952-110529@atomide.com-2>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <pull-1691658952-110529@atomide.com>
References: <pull-1691658952-110529@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.6/maintainers-signed

for you to fetch changes up to fda31904ffbc7231898198333804fa551b681387:

  MAINTAINERS: add board bindings list to OMAP2+ files (2023-07-31 09:11:14 +0300)

----------------------------------------------------------------
Maintainer file list update for omaps for v6.6

Adds the new SoC specific yaml file to MAINTAINERS.

----------------------------------------------------------------
Andreas Kemnade (1):
      MAINTAINERS: add board bindings list to OMAP2+ files

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)
