Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83561C433E0
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5CB1A64F35; Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 43ACD64EF7
	for <soc@kernel.org>; Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613056808;
	bh=Ajfxu5kkQiGuyyFCN/aPTtZRaQQ0fN/gGu03YZMWk64=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=lVWPzGM4PieyklFOQ1fsw/a1Hw2mjXU5dR1CnQGgt7ZFdilQyPoF6V1PunT+UrNSD
	 FjnGYuSsMD4idTkYfY98eDAw4Zo2DciMfPwlMxHjVEtALiVLTR3sRsR74CEBdKB8wM
	 epEKY1VqJS3sJnd6S2kV8p8HOKp+L9BVt/4v65KVsFO56HcJr5F2aKUwLyZOsl9hS0
	 Um/v4MgAW7qEa7pPv2Cp+mNKRq7oLooAwmqbdinsJjLLDsfI1vWRnmwqrse5N5UOHI
	 V93r/4ccWZRybbaXO68aSIiail6z1utqPZdfQKkjAEwcz7QyCm46HazHj7lEwdNNwt
	 slUKtINUr/Q0A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3080960A0F;
	Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161305680814.9082.628823157136497897.git-patchwork-summary@kernel.org>
Date: Thu, 11 Feb 2021 15:20:08 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] ARM: aspeed: soc changes for 5.12
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=431479
  Lore link: https://lore.kernel.org/r/CACPK8Xf+4VkWC6rkHhsWdwhaLjy2Az=GAHaEe=SvOiUc_OGKSQ@mail.gmail.com
Patch: [GIT,PULL] ARM: aspeed: devicetree changes for 5.12
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=431477
  Lore link: https://lore.kernel.org/r/CACPK8XfQgGch5bK3YD0La+CE2L5DxVa1MNw6m1fc40j0w7e9Tw@mail.gmail.com
Patch: MAINTAINERS: arm: samsung: include S3C headers in platform entry
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=431673
  Lore link: https://lore.kernel.org/r/20210210172303.335268-1-krzk@kernel.org
Patch: [GIT,PULL] ARM: Visconti: device tree changes for 5.12
  Submitter: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=431699
  Lore link: https://lore.kernel.org/r/20210210173210.nnytfyrkkj6ylrtb@toshiba.co.jp
Patch: [GIT,PULL,v2] ARM: dts zynq: Xilinx DT changes for v5.12
  Submitter: Michal Simek <michal.simek@xilinx.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=432139
  Lore link: https://lore.kernel.org/r/19e0e0c9-1bed-bba5-6c80-6903937b3d96@xilinx.com

Total patches: 5

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


