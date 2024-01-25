Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735E5C47258
	for <soc@archiver.kernel.org>; Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D253C43394; Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2647EC433F1
	for <soc@kernel.org>; Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706205098;
	bh=wmhTKXTe6/PDMJzJVhNBDLTavup1aOnNEMnwiTQ+hKI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=McONx/i5/sDl36n5zYl3pQWnMyO37RNz9NgFJQuz1OiEaRNTNxMBo//NAi4k+XTJ7
	 7ujdCjGRUh6k5IC5OD+G45NX+mH6tOf+G2Aa36WHfL++ysbhSJCpN7yYxyZ+PQdopx
	 ktChKVbk0d/1mSBzCTPdWnQJdpBVvtpxmlxT/flyf5kYmYRanxkEF8I4xTU4pAvUu3
	 VJLdfNn9Yj0F1qpgUsw7a0Jlap9Zth5amq8FcinsjM9LbSfzNTWCU8CPR+4t56gflQ
	 nCNOzpryUAD7WjfD7x9FgCYSS72wGLfAg4+u9iZF/qTicYVEd1++LNOr6nb4jZLgVa
	 91aNjcxUNoL0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0AB8DDFF766;
	Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170620509798.10279.12321649594973282078.git-patchwork-summary@kernel.org>
Date: Thu, 25 Jan 2024 17:51:37 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL,fixes] ARM: samsung: dts: fixes for v6.8
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=819760
  Lore link: https://lore.kernel.org/r/20240125082400.163935-1-krzysztof.kozlowski@linaro.org

Patch: arm64: dts: Fix TPM schema violations
  Submitter: Lukas Wunner <lukas@wunner.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=816699
  Lore link: https://lore.kernel.org/r/e6d7768e2a257e0bd5948bcf168909b6c670851b.1705168605.git.lukas@wunner.de

Patch: ARM: dts: Fix TPM schema violations
  Submitter: Lukas Wunner <lukas@wunner.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=816664
  Lore link: https://lore.kernel.org/r/8b49a64d5946792f01e75fab74076557ef4f7d60.1705135956.git.lukas@wunner.de

Patch: [GIT,PULL] firmware: arm_ffa: Fixes for v6.8
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=818695
  Lore link: https://lore.kernel.org/r/20240122161652.3551159-1-sudeep.holla@arm.com

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v6.8
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=818694
  Lore link: https://lore.kernel.org/r/20240122161640.3551085-1-sudeep.holla@arm.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


