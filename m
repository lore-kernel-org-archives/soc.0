Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2775EE49B0
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F1C7C4160E; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58683C433BD;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671476;
	bh=vNg/hp/HnEE2wOofeeGztwXTnFjBxt2Rp/wM77ECrQI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=roClx6CqlAaP+V6pkzjLqZjrKmcmkUZRedYW0W2MhWFoxkqJ5DHQ5D3HVHCe6r3Cv
	 /82XKu4eUaHQWsSAuX3ahzl6mVBNvlc1bLJwBwphTJJqBrdK9k9BNVrdsi/+GVQeXF
	 pnD1HKxyp4Efq06bk2w/O25Jv2aj41NmUtII1wZRQ9lzGvPB9O4Yc908oBVMLvPqj5
	 eqcnrRxKFLNnTPwVUyGYbmXm1nHa2AKUcQPT3enk4NKDazmVLE0jajwdJ01PE58nHW
	 C3+8SAIg+Ifw0ZYvTPrDAMMcRsOjC7fit6kQvtY8sBU19uyvNcZ0mClLsH+AeeIhqJ
	 yOz3fdtqGyUfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 45083E22B04;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: socfpga: updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147627.32531.4747330126088437879.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:16 +0000
References: <20230819161418.931258-1-dinguyen@kernel.org>
In-Reply-To: <20230819161418.931258-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 19 Aug 2023 11:14:18 -0500 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.6
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: socfpga: updates for v6.6
    https://git.kernel.org/soc/soc/c/c708140e960f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


