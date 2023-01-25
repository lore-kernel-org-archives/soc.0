Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19610C27C76
	for <soc@archiver.kernel.org>; Wed, 25 Jan 2023 16:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E013DC433A1; Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6825C433EF
	for <soc@kernel.org>; Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674663618;
	bh=OyAtt7uJ9uwVuwenl/dRFMRVkmx5mjx/02j3nH4plt0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=aMVW48hC0bE03Qn97GKXlZfr5uEoiarcj58/CZoX2Q7MAf2q+IjMvWm3AJaYP9g6+
	 6sQOZcFamgIbdJEPWZHzg52ogOFpYXlcTct3U9eBrre7mMp3K2NQ8KkwLcHxtrzbYW
	 Jz3H+bJbWYL0KcSPwCNMNSa98YU8TVnclq53+6+YAb5Fv9kzupBXLycntPJGNnhx6y
	 mSdkZmJ4KDl2BkE0PByAHkwrz86k1ETxNZxe/7jeV1uhk7O7I+C2uWRqWAvmwq1smo
	 /fMxNCQzv6dG3++pM4YOr9xmkEA73vltWFh+bswGdDUV7mK6bnlRB2ZUWX3sjGSetH
	 hXt9V4at/JdNg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A4A87E52507;
	Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167466361859.4524.16573525505988543480.git-patchwork-summary@kernel.org>
Date: Wed, 25 Jan 2023 16:20:18 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: dts: Cleanup for v6.3
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=714471
  Lore link: https://lore.kernel.org/r/20230122121541.29312-2-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] AT91 SoC updates for 6.3
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=713627
  Lore link: https://lore.kernel.org/r/20230119113202.43543-1-claudiu.beznea@microchip.com

Patch: ARM: dts: intel-ixp42x-welltech-epbx100: add ethernet node
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=715378
  Lore link: https://lore.kernel.org/r/20230125075838.2801020-1-linus.walleij@linaro.org

Patch: [GIT,PULL] Gemini DTS updates for v6.3
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=715376
  Lore link: https://lore.kernel.org/r/CACRpkdb=dDD-y91jdEM01iuioJVDgDwMgS8F46iN84vw_V8BvA@mail.gmail.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


