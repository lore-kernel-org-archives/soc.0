Return-Path: <jernej@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5ECC5478C
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 20:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 588BEC43394; Fri, 23 Feb 2024 20:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B553BC433F1;
	Fri, 23 Feb 2024 20:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708721694;
	bh=YMDFVUB+eAwjUgRY39fuJMI4SBr+yKSsST6AAhUh3sI=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=XLRxFg7pYeETdjssTuvZG9hcNIUIyOUL9/jMtiuVW2fXDbYgUamqEFr4VcQdfpbJh
	 RYlTurZh9cgKfZCROf5huUeMq+AZMABZbREsIJiTLmciUB6p5r1rtpmaKDYeq0lxZt
	 Pc8alnF1C2qrtR6navPez35wK5j7woTJjJhcwK7dl4PDd7H7ooBPdxLNhO4vfjktFa
	 BFgr+3t4IHy4MrvPlIkaoIfU2/+HICp8a3Icd21uygokmrULwE/UKui233xe2F5oh3
	 PMhw9eiC0cvTpz322+ZGBmTsr1PGULUOert7gNmIatoWRMLVM3y3exv8fb8CO8dAL9
	 sRzI+9YlstmLA==
Date: Fri, 23 Feb 2024 21:54:50 +0100
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree fix for 6.8
Message-ID: <20240223205450.GA8881@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following device tree fix for 6.8.

Best regards,
Jernej

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.8-1

for you to fetch changes up to cbec657208bdd4bff4ff31cac5924aa18817027c:

  arm64: dts: allwinner: h616: Add Orange Pi Zero 2W to Makefile (2024-02-23 21:02:51 +0100)

----------------------------------------------------------------
- include Orange Pi Zero 2W DT in Makefile

----------------------------------------------------------------
Jernej Skrabec (1):
      arm64: dts: allwinner: h616: Add Orange Pi Zero 2W to Makefile

 arch/arm64/boot/dts/allwinner/Makefile | 1 +
 1 file changed, 1 insertion(+)
