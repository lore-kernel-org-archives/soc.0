Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CC3C19F2B
	for <soc@archiver.kernel.org>; Thu, 28 Jul 2022 22:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97C3AC4347C; Thu, 28 Jul 2022 22:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED49BC433D7;
	Thu, 28 Jul 2022 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659047559;
	bh=scawR5v1LeclDr/Xd6EWX8pq+5oKjL0qWa9292ESc8c=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=ic7I99uSq7oBjctQGHnUfWGW6lEfo+QjQx9KbhY21fhJ7ijN2ZIymPCiiF65+n7hi
	 CIV3rwr4Mgx8CObKvjMl0NtaZI3yMznBz2ttmjxPJ6qSiIvWaDNNb43cLlJLgILcn5
	 vmycGfiQrr8zMCmL3AQMDhU3uerd0q9PSHfLfAqrR171CmxpD3NGapPkm8q8bD/O5W
	 Q3Zn5ib4X2tM3J+Z2TEtX3dUQgvJefWZzrH1cvz6eHBoNiwtopDYYBwFrPEndPXRCk
	 eZZxHoyYoQ563/xvM/+qvbT49R2N2eYAbqDnCvfUZIjYYwlEJ/K/nuNDOGKgHa2Ab7
	 wCWmpe9k3BqmA==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: dts updates for v5.20, part 2
Date: Thu, 28 Jul 2022 17:32:37 -0500
Message-Id: <20220728223237.3184243-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd/Olof,

Please pull in this patch for v5.20.

Thanks,
Dinh

The following changes since commit 357513c052e10945427dd341bdf7a7ee5bf065a9:

  arm64: dts: altera: socfpga_stratix10: move clocks out of soc node (2022-06-24 14:10:04 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_updates_for_v5.20_part2

for you to fetch changes up to b3cbbb58632fa6f9cebf3f5c3ba210f11a3bdeb8:

  ARM: dts: add EMAC AXI settings for Cyclone5 (2022-07-25 15:03:07 -0500)

----------------------------------------------------------------
SoCFPGA dts updates for v5.20, part 2
- Update EMAC AXI settings for Cyclone5

----------------------------------------------------------------
Dinh Nguyen (1):
      ARM: dts: add EMAC AXI settings for Cyclone5

 arch/arm/boot/dts/socfpga.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)
