Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803D8C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4DA1B23AAC; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607471429;
	bh=a+YxNiptcPNmVoU8gV25DfBu9WnzrQqPPV8HOCZhwo4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=BEIB0G6HdXfRlN9pMGIlgT46TfWr+9AnZdiwxd7J9ZJDIrTrsfyYbcMDiHpT3Shvx
	 z1ulmxcbtK1EMWjAPVdNZ/Ad0BPTD5hdSIWgbjLBaAmI/xiB8xaMtB+kRv+a1h7j9C
	 fXakNbkJQ4R8wcEyd60TuG2gVBfwWvOAP8FTE41PUf9HjhGyWkKgxR78l3jAxlDPRL
	 Met4gfF928lO0CoXZ2xXB2yQv0cj0tb1WsGRaIIj4tB5VHjkbDeP3aV5yQhKU9vLKN
	 M465pLuzfj6gJpl5AyBZ1A2jmMSiy4++2CPENAUbMM4s/WJpgXqWxJY+Ff8WnttD6J
	 3SLQZvxYJV2sg==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160747142907.19687.10480163060550922858.git-patchwork-summary@kernel.org>
Date: Tue, 08 Dec 2020 23:50:29 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Series: [GIT,PULL,1/2] drivers: soc: TI SOC changes for 5.11
  Submitter: Santosh Shilimkar <santosh.shilimkar@oracle.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=394183
  Lore link: https://lore.kernel.org/r/1606851405-26338-1-git-send-email-santosh.shilimkar@oracle.com
    Patches: [GIT,PULL,1/2] drivers: soc: TI SOC changes for 5.11
             [GIT,PULL,2/2] ARM: dts: Keystone DTS update for v5.11
Patch: [GIT,PULL] ARM: at91: DT for 5.11 #2
  Submitter: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=396949
  Lore link: https://lore.kernel.org/r/20201206013840.GA627225@piout.net
Patch: [GIT,PULL] Reset controller changes for v5.11
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=396371
  Lore link: https://lore.kernel.org/r/d586ada0073f2ac50a02274f42bf07bfb0603835.camel@pengutronix.de
Patch: [GIT,PULL] ARM: nuvoton: devicetree changes for 5.11
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=393039
  Lore link: https://lore.kernel.org/r/CACPK8Xd8RaLv_p6t9ckBwCwtZww+2YYOAoAYQdvni0dxc2mS7A@mail.gmail.com
Patch: [GIT,PULL] Rockchip dts64 changes for 5.11
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=397155
  Lore link: https://lore.kernel.org/r/4278011.LvFx2qVVIh@phil
Patch: [GIT,PULL] arm64: TI K3 DT updates for v5.11
  Submitter: Nishanth Menon <nm@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=393447
  Lore link: https://lore.kernel.org/r/20201130174258.ljsiokkyr7x7tsbd@covenant
Patch: [GIT,PULL] Rockchip dts32 changes for 5.11
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=397173
  Lore link: https://lore.kernel.org/r/4582475.GXAFRqVoOG@phil
Patch: [GIT,PULL] ARM: mvebu: dt64 for v5.11 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=393389
  Lore link: https://lore.kernel.org/r/87eekaj0i4.fsf@BL-laptop
Patch: [GIT,PULL] ARM: at91: DT for 5.11
  Submitter: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=392513
  Lore link: https://lore.kernel.org/r/20201127220403.GA1735041@piout.net
Patch: [GIT,PULL] Rockchip driver changes for 5.11
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=397175
  Lore link: https://lore.kernel.org/r/2045618.irdbgypaU6@phil
Patch: [GIT,PULL] ARM: mvebu: dt for v5.11 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=393383
  Lore link: https://lore.kernel.org/r/87h7p6j0m7.fsf@BL-laptop

Total patches: 12

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


