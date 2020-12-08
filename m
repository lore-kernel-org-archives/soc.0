Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10239C2BB9A
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:50:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 88E0223B31; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607471429;
	bh=S+eHlZi5s4y88sssP503Dl0Lb/0IH3yf9zzocORD4b4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=o16/KV8WC1GlnmIF7lFE03Scy/i54gSDMBo1KWaHY4fvsIsRZ22tAilJELufYvOry
	 EbmEKwkR299TSE5T6mZNj8J6e6jqdjJXo/0G+y7ZjJBmY4XViJYtGk5zaEaHsISowm
	 Aj748kbuXV9QWD93NkBYGHybFO2Fz7Q+IK59vtwmqJU7YccuTzEhHtXOHmQlp50dme
	 uuvVYJxBOQG7TE78oXqZFwoVJiFFi6q5Bh/hf07axfVXiA/w1wUfOqf/v9F/aOvHqA
	 BWpsqZkimf5MQdn5u2d+4CgHICOJUxywGS7u4MhN/cmuSUgAAuVPMxqQ+nouWb4ZsY
	 +burtw5HJH5HQ==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: TI K3 DT updates for v5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160747142941.19687.8041808438910906151.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 23:50:29 +0000
References: <20201130174258.ljsiokkyr7x7tsbd@covenant>
In-Reply-To: <20201130174258.ljsiokkyr7x7tsbd@covenant>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 30 Nov 2020 11:42:58 -0600 you wrote:
> Hi,
> 
> Please pull the following for TI K3 dts changes for v5.11 window.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: TI K3 DT updates for v5.11
    https://git.kernel.org/soc/soc/c/e40917e4664e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


