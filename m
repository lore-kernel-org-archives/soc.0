Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7E8C41535
	for <soc@archiver.kernel.org>; Thu, 14 Dec 2023 21:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8740DC433CB; Thu, 14 Dec 2023 21:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71B5DC433C7
	for <soc@kernel.org>; Thu, 14 Dec 2023 21:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702588286;
	bh=DBD/u8mHwlZVbOrUf0UITox4K1I+isny9cnflVlnpb8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=W0wN8Yy9o/UgESyhpVXrJmZ6apRKFbR/g7DMMCIaC0yZPAkswPwn+eQmd49ZBLhza
	 1XBaN9Ev88kgksyJOVVoFAoVPEjTsbreEeerT6zYK/o+71a/Zn58XbgHw3uEm1grow
	 Rk4mgeHItwt2/0BnbruL7EozFsN5jXeotKTPlst4+cCbx5RabuUcxvtLlcil0RI64Y
	 8ltecmxqbrCTCVLyEKZX3gWbp8xVr8FFWKBNi3JduoxVIAoWsYcQL0x0A3xiPHWSlF
	 3uybv04gEktO8SOhc8bmBkJxRKq9fN6/c0C7Pqof6pAH5RAxVBvqWk8ubonZs55oE5
	 pJyCjNlKHxFag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 51766DD4EFA;
	Thu, 14 Dec 2023 21:11:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170258828623.10180.17347157137717960900.git-patchwork-summary@kernel.org>
Date: Thu, 14 Dec 2023 21:11:26 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Reset controller fixes for v6.7
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=809717
  Lore link: https://lore.kernel.org/r/20231213152606.231044-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] Allwinner fixes for 6.7
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810199
  Lore link: https://lore.kernel.org/r/ZXtVUJ0SG2NRpPG4@archlinux


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


