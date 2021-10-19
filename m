Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF18C433EF
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 22:20:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9A7F96128B; Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8283F60EB4;
	Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634682014;
	bh=LNt6MNTxIlRIUkBkGl9o3SS1U00JQF14PpP/f/fIb5g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iHSTWT/7Xgz32PrUto+h637OWMCCJJW05huze9Jmy0HtkZW+FUcic0kFsAkzS4/ao
	 m5bEeWqX+uN7tuzS1KLeu7AzLPcSeSULAdMx7HXd3MRLxIdsJ190Ib0XcBGRC1q0Os
	 b9Gum8K/c9LYOqFG9pK5D84nSES7mcsS9EWK3uJj1ioBKH0d4f3i50ysXC8CEzXqDw
	 MUEKEQGmQOXKohRlAFYzSecIgrMxiSzQhsoHVu4SG13OPKcei99EyeV3Z9YNV4ip1d
	 qqVoZcilhM2K9LdncUlpS3MA0BEgk+cS3poUzr6lHx7wd6EirBXqtPio+PSUBMI+n9
	 zBlFBSy/5ch9g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6D83360A24;
	Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: hisilicon dts updates for v5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163468201444.1188.3390362355807654382.git-patchwork-notify@kernel.org>
Date: Tue, 19 Oct 2021 22:20:14 +0000
References: <6168EB53.60503@hisilicon.com>
In-Reply-To: <6168EB53.60503@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Oct 2021 10:45:39 +0800 you wrote:
> Hi ARM-SoC team,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: hisilicon dts updates for v5.16
    https://git.kernel.org/soc/soc/c/6fa496fd7db6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


