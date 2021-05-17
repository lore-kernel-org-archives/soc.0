Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47532C43461
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 20:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E07EC61355; Mon, 17 May 2021 20:20:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C8F9661353;
	Mon, 17 May 2021 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621282809;
	bh=8ZFGs4tWXF9dSLaQZAWnuI395Kmg/LeEoFNYFHpN2ns=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TpJ1TPqxN3ftoKBHbV+NyQk3A6+smjKfWwo/WP42iLYl8K+0UB4M+HVElrLc5u4ox
	 ox2vifxQKYU21C+CEnDZ2C6TLBB9OqeYzFtSNjo/tEa2kdO635QPhGx8ZXtFQy78Lw
	 WVmx5Cyu/1HwDqEYLFlUSy8O2yCOS9P1e2hLCCWJsu+ToYrbjMQq4ArX1ao9QSWIcs
	 LN16I4cUlY5C/z+YbFFjj88/oNSB9rFpBjGPtxCmWPn/A4zO48KPTocTb3ZUJnt+X4
	 UjnQHJQYbuHIDmzehc9EvxUJr22yHk6zUh84DgfZZBwA0IVRMxx2djyoYgM0894W4E
	 WGOz2M5Hw1srg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BA8A460C4C;
	Mon, 17 May 2021 20:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas ARM DT updates for v5.13 (take three)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162128280975.19328.13238659979138563374.git-patchwork-notify@kernel.org>
Date: Mon, 17 May 2021 20:20:09 +0000
References: <cover.1619522726.git.geert+renesas@glider.be>
In-Reply-To: <cover.1619522726.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

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


