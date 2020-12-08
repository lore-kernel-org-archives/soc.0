Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAD2C2BBD5
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:50:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BC90A23B53; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607471429;
	bh=IamCAVTG6DG2oK9uowfU4VDMYDudw++Dyy+mRTlPVLU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jGeIUUubQEgg8+UdWJMFa5Dog4L+7KUBialJu42+HQK0WZAIf0ieg6/rQtfWbCbXt
	 IzIG54++7qpB3/49Zl8CiJo2OgToxSl9AlGIXtIk09fhlrhk9XE5gLAlXaBJt908T6
	 YKrhSBIg4/AsbI4Rx/PVmmolr81LGxpZzx6RPgo8BPo3MZgduo7E9q4XAnmmD60fEu
	 +KgqC+Kjz2Clo7hs+4nGxupZansZIGJMFxIpyFg0zn/qXmFP1FVPWp9NkqcjveBT2K
	 z0Hf+cowUAFtaR2X2FBOnFzi8qrWL8TS9HmVpQ7v+6YLlFPQ0BzidRbWNs0yK6Fx9v
	 LdYZ/XkvnHm7Q==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v5.11 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160747142964.19687.11695343344376262383.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 23:50:29 +0000
References: <87h7p6j0m7.fsf@BL-laptop>
In-Reply-To: <87h7p6j0m7.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 30 Nov 2020 17:00:32 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v5.11.
> 
> Gregory
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v5.11 (#1)
    https://git.kernel.org/soc/soc/c/9bc08aa60f56

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


