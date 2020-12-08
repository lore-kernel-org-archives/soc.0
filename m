Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EB7C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 17:10:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DAE6423B1A; Tue,  8 Dec 2020 17:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607447432;
	bh=gwoPPG7Pjy9AZNUoOY5qAFkiM57lED0HZEs2C8YMZLQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=aNjjdvTa7nQ3u0itPHpVVvj3vuzdp2CdbuwM5+5jNHcNWQxsuQcPnnLNR91VffSz+
	 dDatJR13JS8RdacSh+zpSPAe3zsfK3bu5euD7eb3iSNZv88d9JskXSRhyKsoVymEnp
	 HkYkTo4bYirsIgdSSXNzGeKn6PJI40j6IZ/a3Whr0ItDbPPgOrn4l5UD/Eass0Utp5
	 G6uEEszkac67SZHy2dy0gkHdnxPcpfznHbt37zUnmAXeXw/gL/JA3RQY9Bernm/R6b
	 vrDldulM6CLY52P1ckICyCVO0xJYxx8uO5YdZKu5vKvel4wtVEAZgQlUx4xaR5jEpE
	 /dhjvaUT5ZJSg==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160744743276.1206.161669672714323151.git-patchwork-summary@kernel.org>
Date: Tue, 08 Dec 2020 17:10:32 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] Rockchip defconfig64 changes for 5.11
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=397177
  Lore link: https://lore.kernel.org/r/2750818.e9J7NaK4W3@phil
Patch: [GIT,PULL] ARM: at91: Drivers for 5.11 (bis)
  Submitter: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=392501
  Lore link: https://lore.kernel.org/r/20201127214140.GA1688544@piout.net
Patch: [GIT,PULL] ARM: aspeed: actually the soc changes for 5.11
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=393035
  Lore link: https://lore.kernel.org/r/CACPK8Xe=9ezhyWRMqVOEQr7SU1YoYfVBGGdGzjmE4SiBr--vJQ@mail.gmail.com
Patch: [GIT,PULL] arm64: TI K3 SoC configs changes for v5.11
  Submitter: Nishanth Menon <nm@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=393453
  Lore link: https://lore.kernel.org/r/20201130174850.ni4sdyz3qp67j3sz@upstart
Patch: [GIT,PULL] ARM: at91: defconfig for 5.11
  Submitter: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=392505
  Lore link: https://lore.kernel.org/r/20201127215517.GA1733715@piout.net

Total patches: 5

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


