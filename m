Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6A0C43603
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 20:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5DF4161361; Mon, 17 May 2021 20:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 45F756135D;
	Mon, 17 May 2021 20:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621282810;
	bh=cVfvmyNrngrxYfei8PpybOcdfRfgaGBiNHFXLldu7Qk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AXtMIXIeSn5Bmh6SO8MZKMjyETbyTVZroHXR9DZiX1b+mIvY0s5YxgeFyfS7tiHX6
	 7O2G+TqEQMFcbRaNmz645tdtw03Oqbu4oqE4u8xH2wiBq776ykjwzo31o+w4CSSn7k
	 Bo7/cLoQNk0VoXFPP22fPq7XkUyTGYosB3lD0M8OxZVHO0mkw9ZHT5MZst9sGMs2/T
	 yBKpVBDd1gWTpJ0SNiuqDhmrcwWapwS7+hSgHIYGizKLLdXogv23JLWcX9BS9DBHcH
	 wSEBVUDnpSo9uhMJwPpbldvOm5AlMm7g3e1aKeRdA08U/fH7tTRzlw5UfXgtSmmo1K
	 vZDjlpIbLkHAA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3FCCF60BFB;
	Mon, 17 May 2021 20:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas ARM DT updates for v5.13 (take three)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162128281025.19328.3107877849952506745.git-patchwork-notify@kernel.org>
Date: Mon, 17 May 2021 20:20:10 +0000
References: <cover.1619522726.git.geert+renesas@glider.be>
In-Reply-To: <cover.1619522726.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 27 Apr 2021 13:29:43 +0200 you wrote:
> Hi arm-soc folks,
> 
> The following changes since commit 2b35ca2fe605f85aa1a52c713571baf04a5f434a:
> 
>   arm64: dts: renesas: ulcb: Add cpu-supply property to a57_0 node (2021-04-02 09:22:35 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas ARM DT updates for v5.13 (take three)
    https://git.kernel.org/soc/soc/c/826b5f765939

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


