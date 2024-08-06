Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718A4C52D70
	for <soc@archiver.kernel.org>; Tue,  6 Aug 2024 20:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46DCDC4AF0E; Tue,  6 Aug 2024 20:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3025CC32786
	for <soc@kernel.org>; Tue,  6 Aug 2024 20:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722976068;
	bh=1PP/nOLyyh+/nBD04AwcngKXwjO2DH+UBmaywpzi4fQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=IO3sxHwPVD4Kyo4KI8DcIFF4lDmeSTlQGDuvtmlZaF5k3rtzorp87OWDe5uvpZ4Bv
	 gUgYHsd+uPhl9ZYMDv66m9qgWgytwb9PPjfVtc/sG0itgemrKUa7/QXWOECa+TyRgd
	 gx0T412xi2rifnut0jjSdP83YFSCQ2qhspkf8KDLR+0IvjPdQLCB+qyVzfGwh7b3wp
	 L9Z0NX8qkp1qkbJikAEetfg5RuuEKilbk4aOk4Y4TzMAKm/NN3rwvmwLyuvZhUB8VE
	 su1mxCP2DYHcZen11NoibXBsrcUrJ7gDzgpInuuW+3fl/jBsQsghaXi+A4ZZ7gUe5F
	 rMQC7JW2KZnrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F227A39D6562;
	Tue,  6 Aug 2024 20:27:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172297606634.1692635.142342556379353281.git-patchwork-summary@kernel.org>
Date: Tue, 06 Aug 2024 20:27:46 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: dts: ti: K3 devicetree updates for v6.11 - part2
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=871462
  Lore link: https://lore.kernel.org/r/aacd1e96-9ff4-4222-9f4d-29e63041f7fb@ti.com

Patch: [GIT,PULL] arm64: dts: TI K3 fixes for v6.11
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=877057
  Lore link: https://lore.kernel.org/r/20240806122659.vmasq2qjy6457bbs@peroxide


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


