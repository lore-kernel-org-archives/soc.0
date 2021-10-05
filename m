Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7302CC4332F
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 40AB3613E6; Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2318061381
	for <soc@kernel.org>; Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633444832;
	bh=iiL4v1BM3gXBpGydPVPGaALxiNnBJqvYk0ghdE1yn8k=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=s8YCEh2K951V3uiqe+wnvJqaVA2DZrPjchVwEpLXcEcuPwzt9i+ABCWUfNirgan8W
	 pJNDoB7cW6X1cu+QPaOe94axlNnZKYyS/MaQT18eELLDj+qo5EfJJ7cMvLfJWczTOB
	 UazIbbFuXfUn3geYoM5Nol8xrdoDOQF/deasKE4FA8CuEYqbakUGEdDF68O6O6k5Kw
	 pNxsXNan4XCIuMcmMtuFVLsGeEJQ9UcVXH0F+L8lEoEFZpwU6yB80hO+jvJOZypQ/N
	 8jhVJPJexLcMcDy0JznTKv4gZZe+PgRLdP2FC3EnVBukcSfC5q7OTKaeUW0tb9tfJQ
	 Kik4xKwlGAFXQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0AB9460A0E;
	Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344483198.23473.8790630639484362660.git-patchwork-summary@kernel.org>
Date: Tue, 05 Oct 2021 14:40:31 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Series: Renesas SoC updates for v5.16
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=556129
  Lore link: https://lore.kernel.org/r/cover.1633081144.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.16
             [GIT,PULL,2/4] Renesas ARM DT updates for v5.16
             [GIT,PULL,3/4] Renesas driver updates for v5.16
             [GIT,PULL,4/4] Renesas DT binding updates for v5.16
Patch: [GIT,PULL] Rockchip dts64 changes for 5.16 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=553301
  Lore link: https://lore.kernel.org/r/4439872.CQOukoFCf9@phil
Patch: [GIT,PULL] ARM: config: multi v7 defconfig cleanups
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=547757
  Lore link: https://lore.kernel.org/r/CACPK8XfTHOOksA8q7MeHW=7ijP_49iOyq1pDj2SQnqSBTDUoaA@mail.gmail.com
Patch: [GIT,PULL] arm64: dts: ZynqMP DT changes for v5.16
  Submitter: Michal Simek <monstr@monstr.eu>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=547135
  Lore link: https://lore.kernel.org/r/b1cbd05d-ab40-e1fc-4001-6cf88e1e81f9@monstr.eu
Patch: [GIT,PULL] Rockchip dts32 changes for 5.16
  Submitter: Heiko Stübner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=553303
  Lore link: https://lore.kernel.org/r/5121280.Lt9SDvczpP@phil

Total patches: 8

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


