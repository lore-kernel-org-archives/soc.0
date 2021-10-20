Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C59C433FE
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 16:00:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D5ECA61373; Wed, 20 Oct 2021 16:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BF69B611F2
	for <soc@kernel.org>; Wed, 20 Oct 2021 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634745607;
	bh=iTO6HqiWZoQCyjJONBLLasVOQtIvBBGJEQpfVx8YU20=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=mCg8pX7jWImHDYEAeKuJicO9DKsGyHkhsgLYfvUjIkdonutmSIQMzIIPu3eEiCduU
	 XP/CImDsrDZ2AH1ggk00kr8T1Yn/TCP6rpAVB6xCAZy6WzKhM7aRNWCqJgSwelbVOx
	 JM+OqcBXCdE0qvuZVm9atPk0jF56Kke9vavU51/RNCCcF6V13BmW2V+RIHX1p1r/LG
	 wViOwIHTKwhEBt9d4Tt093XyHJScEShSY/1z47AS6bMvaQIx6Bu0bhVmIUCvwqChli
	 O/9IPTfz2273vk68yzGo+ZYhx0n66RWyyF9cJnROtcr/Y4OZyiiI+28A9e7gmtIA9Q
	 48RY2A3ZinSVg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AD3BC609D1;
	Wed, 20 Oct 2021 16:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163474560765.11707.4935439344158335777.git-patchwork-summary@kernel.org>
Date: Wed, 20 Oct 2021 16:00:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: arm: ep93xx: CCF conversion
  Submitter: Alexander Sverdlin <alexander.sverdlin@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=565373
  Lore link: https://lore.kernel.org/r/20211018103105.146380-1-alexander.sverdlin@gmail.com
    Patches: [v3,1/2] ASoC: cirrus: i2s: Prepare clock before using it
             [v3,2/2] ep93xx: clock: convert in-place to COMMON_CLK

Patch: [GIT,PULL] OP-TEE FF-A for V5.16
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=565481
  Lore link: https://lore.kernel.org/r/20211018121324.GA2943530@jade


Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


