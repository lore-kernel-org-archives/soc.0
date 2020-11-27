Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B38C3E8C5
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 17:10:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 399D6221F7; Fri, 27 Nov 2020 17:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606497028;
	bh=txbiMitO3yCjEdyVHu0oQAP4kC1I6Wax5/S4w4QHRj4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=UDsMbbCv4TflZ4N+Rg72l7bVfcHuzzK/cP+mQvIWq6bsaEq8TczO5FVjU6emKaZ0l
	 VNrEgBqh7e67dsBxvdC3ApUExfl7fNXOUR7kLvDzvTQhy9BY6HfGBbcywRr2cKyi9C
	 slbMPojx1b1CGPTNmcAkNqZ6Zzjtv16a2tq38xCQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160649702808.7685.4067896911210527902.git-patchwork-summary@kernel.org>
Date: Fri, 27 Nov 2020 17:10:28 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Series: [GIT,PULL,1/6] dt-bindings: Changes for v5.11-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=392269
  Lore link: https://lore.kernel.org/r/20201127144329.124891-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/6] dt-bindings: Changes for v5.11-rc1
             [GIT,PULL,2/6] soc/tegra: Changes for v5.11-rc1
             [GIT,PULL,3/6] firmware: tegra: Changes for v5.11-rc1
             [GIT,PULL,4/6] ARM: tegra: Device tree changes for v5.11-rc1
             [GIT,PULL,5/6] arm64: tegra: Device tree changes for v5.11-rc1
             [GIT,PULL,6/6] arm64: tegra: Default configuration changes for v5.11-rc1
Patch: [GIT,PULL] STM32 DT changes for v5.11 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=391973
  Lore link: https://lore.kernel.org/r/873c17a5-28d5-9261-f691-1b917611c932@foss.st.com
Patch: [GIT,PULL] Fixes for omaps for v5.10-rc cycle
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=391929
  Lore link: https://lore.kernel.org/r/pull-1606460270-864284@atomide.com
Patch: [GIT,PULL] STM32 config changes for v5.11 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=391979
  Lore link: https://lore.kernel.org/r/a6ea4940-a9a3-eba6-4ef5-aba7ff382009@foss.st.com
Patch: [GIT,PULL] OP-TEE driver for v5.11
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=390879
  Lore link: https://lore.kernel.org/r/20201125120134.GA1642471@jade
Series: Renesas ARM SoC updates for v5.11 (take two)
  Submitter: Geert Uytterhoeven <geert@linux-m68k.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=392207
  Lore link: https://lore.kernel.org/r/20201127132155.77418-1-geert@linux-m68k.org
    Patches: [GIT,PULL,1/3] Renesas ARM DT updates for v5.11 (take two)
             [GIT,PULL,2/3] Renesas ARM SoC updates for v5.11
             [GIT,PULL,3/3] Renesas driver updates for v5.11 (take two)

Total patches: 13

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


