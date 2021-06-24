Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A04C48BC2
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CDB78613C1; Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B7E1C613B2
	for <soc@kernel.org>; Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502410;
	bh=DQBDeFPvZkZ9sNWfRlbMzDXDDJZ1FWxHF86C2S7/ZTU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=WbcwbgBH7ssrZI782s1cCRde0USsSwz0uOeDhnpPWAk1sixf72Uj//1yiH5NIBZqD
	 AUxEP3qKYk5aUuEPMNbWzXtH/ms05IVT6G7JAwvO1/mr8HyTBjwkycS1n4EXa7b82h
	 JjgU5BjyuQjRL47dDowxWIM2zPv/CyZVq76MVnse7bP0aaNAxqKKng/6OnViMuYkn7
	 mRL42bz32ZgTpZE11iteKedY+DgST9Q0E+mZVzNYOwo7gUzEBLrytb3QnCJZ6rDkCb
	 SkQlWf5uCVK3T+Qcun0PKZ+KL0K5/U1FTA+jF3w+pYS7QW+KnNeengrKRvIxS2g3o4
	 965ADY1HG2e/w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B2BB1609B1;
	Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241072.24025.10979881399535475332.git-patchwork-summary@kernel.org>
Date: Thu, 24 Jun 2021 02:40:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] Rockchip driver changes for 5.14
  Submitter: Heiko Stübner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=504011
  Lore link: https://lore.kernel.org/r/4647955.GXAFRqVoOG@phil
Patch: [GIT,PULL] Rockchip dts32 changes for 5.14
  Submitter: Heiko Stübner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=504013
  Lore link: https://lore.kernel.org/r/2084346.irdbgypaU6@phil
Patch: [GIT,PULL] ARM: mvebu: dt64 for v5.14 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=503897
  Lore link: https://lore.kernel.org/r/878s3429zi.fsf@BL-laptop
Series: [GIT,PULL,1/2] Non-urgent fixes for omaps for v5.14
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=503033
  Lore link: https://lore.kernel.org/r/pull-1624002812-396117@atomide.com
    Patches: [GIT,PULL,1/2] Non-urgent fixes for omaps for v5.14
             [GIT,PULL,2/2] Devicetree binding clean-up for omaps for v5.14
Patch: [GIT,PULL] arm: dts: hisilicon dts updates for v5.14
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=502885
  Lore link: https://lore.kernel.org/r/60CBF408.7040302@hisilicon.com
Patch: [GIT,PULL] Rockchip dts64 changes for 5.14 - #2
  Submitter: Heiko Stübner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=505047
  Lore link: https://lore.kernel.org/r/4876354.ZzFAyJQhcr@diego
Patch: [GIT,PULL] Additional Qualcomm ARM64 DT updates for v5.14
  Submitter: Bjorn Andersson <bjorn.andersson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=504459
  Lore link: https://lore.kernel.org/r/20210621164946.942956-1-bjorn.andersson@linaro.org
Patch: [GIT,PULL] ARM: mvebu: fixes for v5.13 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=503893
  Lore link: https://lore.kernel.org/r/87eecx0w6s.fsf@BL-laptop
Patch: [GIT,PULL] ARM: mvebu: drivers for v5.14 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=503895
  Lore link: https://lore.kernel.org/r/87bl802a2d.fsf@BL-laptop
Patch: [GIT,PULL] Rockchip dts64 changes for 5.14
  Submitter: Heiko Stübner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=504015
  Lore link: https://lore.kernel.org/r/2796982.e9J7NaK4W3@phil
Patch: [GIT,PULL] arm64: dts: hisilicon dts updates for v5.14
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=502887
  Lore link: https://lore.kernel.org/r/60CBF4AE.7040301@hisilicon.com
Patch: [GIT,PULL] Rockchip dts32 changes for 5.14 - #2
  Submitter: Heiko Stübner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=504641
  Lore link: https://lore.kernel.org/r/4611716.rnzMqkiUVr@diego
Patch: [GIT,PULL] Additional Qualcomm ARM64 defconfig udpate for v5.14
  Submitter: Bjorn Andersson <bjorn.andersson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=504461
  Lore link: https://lore.kernel.org/r/20210621165015.943060-1-bjorn.andersson@linaro.org
Patch: [GIT,PULL] IXP4xx modernizations for v5.14
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=503077
  Lore link: https://lore.kernel.org/r/CACRpkdbw6HSpp7k6q1FYGmtafLmdAu8bFnpHQOdfBDYYsdLbkw@mail.gmail.com
Patch: [GIT,PULL] USB4 regression fix for TI DRA74X
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=502999
  Lore link: https://lore.kernel.org/r/pull-1623999845-180025@atomide.com
Patch: [GIT,PULL] TEE reviewer for v5.13
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=505033
  Lore link: https://lore.kernel.org/r/20210622130454.GA2196996@jade

Total patches: 17

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


