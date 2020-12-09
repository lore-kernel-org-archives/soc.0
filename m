Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B084C2BB40
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 17:10:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D678C23C82; Wed,  9 Dec 2020 17:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607533810;
	bh=8tGKV+KbtmPECLxoYuSNXoxBOn6b4YegaBYNDSQI4eQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZzsF15RW5VZ/HkJFmIMv+x7qJvg3E2zk5nKUDm2HaA3nkUFPRHahOHT6bJHeZWzGs
	 pMf9YEFf8rywg06IvESvbtt2IItOCkxhpRtwUw4Ba3FmgpIbvuUTlcwU1YP27n6GhD
	 WANIW2V+E3GJfONBmqqaDyURsezKQJrLyfJ1kgnh24+HjXXzowDQjvFJlKREPQMdZY
	 4sCcCKCPApXqt4NaK1Dr8pj3gR0ofiMsLQ6EoQiqk9cOVWOBl62V0DTH1TtgHKdbdG
	 UC50Wx4PF0xGgrAJMXEWj1gIEZneYwe7yFpWMKtKug87m4sH7Bbl4lG759mlgDAN4T
	 TZeaXow/wq1WQ==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: arm for v5.11 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160753381069.14869.1825798208342825126.git-patchwork-notify@kernel.org>
Date: Wed, 09 Dec 2020 17:10:10 +0000
References: <87k0u2j0n7.fsf@BL-laptop>
In-Reply-To: <87k0u2j0n7.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 30 Nov 2020 16:59:56 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for arm for mvebu for v5.11.
> 
> Gregory
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: arm for v5.11 (#1)
    https://git.kernel.org/soc/soc/c/4bdfafd6ff29

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


