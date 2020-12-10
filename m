Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F619C4361B
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 15:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D85382310E; Thu, 10 Dec 2020 15:00:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607612406;
	bh=19VWS6FN8oUOtfMuOHEkBbjo891Bem7PjOpxAmqPLdQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=U07iKZmeEWBDvZcWmY8Nsav8UiDMlp85Vr9YvlQLdJQIhBBXSzOOK8OD0legCz3ou
	 TapxqZkNtKl6DNCZlyXZeEQbvDajdwC4Rr1Zx5pNQFv2sJWivGo/smyCtTL/kJrpWJ
	 apvecUWy1WMGXbxrsbJOh9G1JOoO4xhJ2VG9QNgoeN5PRf+Kj4c71Ys66tS/QOSy0m
	 kcyoTrjYTOueBR0IB2CijT6AuyS/uQNZmcCG+pDXajXEgJik8blZu1aNwImEbqyYxV
	 1vMed5/rxLR7pbcGPRtpbXt2qX+EBPLz13ReW7KaVAzp6CIntxb9Eu5tnijFYl0v4Y
	 oKc2xpTPGUG2w==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160761240663.29964.1152003325495072228.git-patchwork-summary@kernel.org>
Date: Thu, 10 Dec 2020 15:00:06 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: arm64: dts: bitmain: Use generic "ngpios" rather than "snps, nr-gpios"
  Submitter: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=399593
  Lore link: https://lore.kernel.org/r/20201210094056.54553-1-manivannan.sadhasivam@linaro.org

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


