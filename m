Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC834C43334
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 12:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 891DAC341CD; Wed,  6 Jul 2022 12:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 730BEC3411C
	for <soc@kernel.org>; Wed,  6 Jul 2022 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657108814;
	bh=xEyPhyWSrpdHhPseU+dBHTlzwbNYrx3xyJxirVNt33s=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=fWo5U2+ELiUq1aBTskhw05X5rUkf9W58FwW01LFKH51/Skh/5mSel8cn3b32KDF1x
	 SJnmIB1oahgiOC12VNsaVRfcnLk7v2Y8sYmNYghQkVEwkFdtgo0M7lR9toDuRhT6/A
	 9AqjsELzoioJwRPj9hC2wvc56qbFCWJGj6H1PRdK3dUAAeFV+WZ5JytG2EmyIzZMEG
	 ACvrDBmRKWxwNdybtsHC4sN55jYfbwXdb8bVYEWHsOXQuipVKJ/JRy3qp1LKD5dM8s
	 nmBMc52aHuSzqboEpbHgevNWyT+Msf5Hz0FFaqJBeBcvZTLGy9OVW/+5XsYsNGMG89
	 Y/iOX3aFBwNUw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 428ECE45BD8;
	Wed,  6 Jul 2022 12:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165710881421.23384.13242101946800424252.git-patchwork-summary@kernel.org>
Date: Wed, 06 Jul 2022 12:00:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Rockchip soc fixes for 5.19
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=656623
  Lore link: https://lore.kernel.org/r/7527945.6fTUFtlzNn@phil

Patch: [GIT,PULL] Rockchip dts fixes for 5.19
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=656622
  Lore link: https://lore.kernel.org/r/7723415.29KlJPOoH8@phil


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


