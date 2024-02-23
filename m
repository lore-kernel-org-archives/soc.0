Return-Path: <jernej@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B20C54798
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 20:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E4E1C43394; Fri, 23 Feb 2024 20:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF781C433C7;
	Fri, 23 Feb 2024 20:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708721858;
	bh=5u4wpwmJcyAStc6I1ZIfyCSbe9rFG7nsuqBc5gYOlBk=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=RoxdiNlqJhVSY2AA96PTtHX1wc4/Ge6JEXte6GZzq0ljn4We6Ii5W6jyZlPgOMOrC
	 rHzzJTwEvOSZIXCZz1H2oPR2wTwoT+FQBzALBR78g99Oiwug/LgN2++k2ub9FZfRtM
	 EUs87Pcw1iD0naLuKCvIJ+SDRGIkbBtSVY2pYznDURrpQzwtWYYwP5TYGjbzQV2QYB
	 9yAwmshcps+apiJik3bDXYJbtYyMrssxyd8gVz8t6DOMUXdDBPxx2rMF1dQjPKra4x
	 IvF0gRfkPUzZDEgjU+Mf3wZQxv1YS5JM64qc3B6uBcwChqR91DI3SGNoDHQyGPBDV1
	 UaCMm7K3b+CiA==
Date: Fri, 23 Feb 2024 21:57:34 +0100
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner drivers change for 6.9
Message-ID: <20240223205734.GA9027@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following drivers change for 6.9.

Best regards,
Jernej

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.9-1

for you to fetch changes up to 0daf87e7b47e05d0c9ccab648d5e45eaddb547f8:

  bus: sunxi-rsb: make sunxi_rsb_bus const (2024-02-11 21:24:48 +0100)

----------------------------------------------------------------
- make sunxi_rsb_bus constant

----------------------------------------------------------------
Ricardo B. Marliere (1):
      bus: sunxi-rsb: make sunxi_rsb_bus const

 drivers/bus/sunxi-rsb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
