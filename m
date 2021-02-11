Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91A1C43381
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7B1E164F52; Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 61F1464EF7;
	Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613056808;
	bh=uV72avYEC9rQ3F0SWnWpLYAaW2aqJBFKNzokxk4+5c8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=O6gElMfGbQf3uqGkMKRWuTj1tFa6hEnlXEH1MeRTOOot5s7lm5JawIgpINgfJVJG8
	 LWB33I2ZxeDKQpb9Uc0VhTgZghLJvqSwhFAWtL/LX5ZD17DHTNnbheR/69KctpEh77
	 fnCCXDUKXTZ2xpJ04zyl60YfWqkQnUJp3CRNBmOKqbx6pBrQmkqaHnlsExrf2Zj26+
	 be6os7znSmZwkh93MAy7PN9732UGU/mMauQynSBsqqpUnkE1/2psxL+WqjYbR1x3Tl
	 5m/WymDV0EiGgRgtqNq7M2obz9Wx1Z0sSCiSxX1OQj6cSUObD1Ro7SfEVA/0/aeGy8
	 zInAoThVobKxQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5B64660A2B;
	Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: Visconti: device tree changes for 5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161305680837.9082.11776328608756866532.git-patchwork-notify@kernel.org>
Date: Thu, 11 Feb 2021 15:20:08 +0000
References: <20210210173210.nnytfyrkkj6ylrtb@toshiba.co.jp>
In-Reply-To: <20210210173210.nnytfyrkkj6ylrtb@toshiba.co.jp>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu, 11 Feb 2021 02:32:10 +0900 you wrote:
> Hi SoC team,
> 
> This request includes the GPIO DT patch for the Visconti SoC.
> Please pull for v5.12 kernel cycle.
> 
> The following changes since commit 4fd18fc38757217c746aa063ba9e4729814dc737:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: Visconti: device tree changes for 5.12
    https://git.kernel.org/soc/soc/c/a36c9ff6a2df

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


