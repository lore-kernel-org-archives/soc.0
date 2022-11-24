Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0872BC43217
	for <soc@archiver.kernel.org>; Thu, 24 Nov 2022 15:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0704C433B5; Thu, 24 Nov 2022 15:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB622C433C1
	for <soc@kernel.org>; Thu, 24 Nov 2022 15:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669303215;
	bh=vQK3hufLPgh9qhIbBG98L2haZuAvp2eKzjMA6GF1ukU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=uFzYPs/7BqlvXTl0/qeRCxvXO335yXhUZzln/U/MpMhdd7rAgutLJwXvYX58uI7x3
	 QYdMhY1NEnfrOZR+bWim6ecgAK3K3oI9tweKNpuKSSzmA2bkPlv18RPJMy+PtunSJp
	 RIBJPzChZYhy4IU2px6M2IB+NOFYaHzqgfztgTrNy2LoM6AagyJC0iyFlcSM68JR85
	 do0Fn1ea+u19PfnFkJgOgWibn5b8EpI3c60QR+sZ4Nwp+m7uZjI0sGkUNwA33IGMV1
	 4vkcVVMv7XZNDEmH+DMIWUKFyCSfjbPJWdvBXyho9D+PJtIdNzx5/2gxKVWRfXOkoO
	 pZOkRyvoAZiGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8DB38C5C7C6;
	Thu, 24 Nov 2022 15:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166930321550.21404.8042750981700146817.git-patchwork-summary@kernel.org>
Date: Thu, 24 Nov 2022 15:20:15 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Rockchip dts32 changes for 6.1 #2
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698528
  Lore link: https://lore.kernel.org/r/9661382.T7Z3S40VBb@phil


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


