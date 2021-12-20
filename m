Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612E1C4332F
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E5C8C36AEB; Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FFFCC36AE8;
	Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640014826;
	bh=KhC+Q5SoF40RNX/QXSpjDYRzHaqHV9EL7vfz12Xeirs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=sdz9RQUlJbg/QG+h4UHJFPWtFKPRKw8DqgAVa2ohH26xCLgIRuwqyEerPUH9aPKh+
	 w8Zg4IF+RHhclks0E+9TlA7LN0QjBWNFKQlM03FYk9KWUZoA6wfCRSqeNRmeGO4MqK
	 cDpcpSqXSWrxdbRNi+WRdxqVi9c2NNgXWuoPXLhwQ9LLtmNFAMmPDNcAc78Ma+ExHJ
	 UUGxZEbvlR5VIZgW1EH0pJ1EmRX9YYDDFvV5hP1mkr7xeEPjHZfQtU5yXlV+N1tCCR
	 RkzEZEWX8pt49Z/gL92T+O0rDq4YwpjCCE7zegNAwWEQpofLhh8irXrSGsIZ2WWKFq
	 91Mb+Yyw4hXcQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E111060952;
	Mon, 20 Dec 2021 15:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.17 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164001482591.10364.14412415053591048732.git-patchwork-notify@kernel.org>
Date: Mon, 20 Dec 2021 15:40:25 +0000
References: <878rwjm8vj.fsf@BL-laptop>
In-Reply-To: <878rwjm8vj.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 17 Dec 2021 18:36:16 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v5.17.
> 
> Gregory
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v5.17 (#1)
    https://git.kernel.org/soc/soc/c/0724f8a14726

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


