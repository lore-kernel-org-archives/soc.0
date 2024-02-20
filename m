Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108DEC48BC3
	for <soc@archiver.kernel.org>; Tue, 20 Feb 2024 21:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ECF18C433B2; Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D426AC43399;
	Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708463561;
	bh=78Vd58KaooSZcZzV92tKgqEqvWYB0OUfSsJ8K8QOQZg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EYARsBdEg8lVDucGZW9hmXh06PKM51XkhSkEdukgnJ30hwwYarxnhoaXoG7w/+JVo
	 vE2UoGpqjX8aQCS8VGemt+w3fekC5vkyMbnRwvmJT6Yh5QRxxmkEJw+XXpsBk/XAmw
	 yrM/pdHkLdzjeUxAo1l5RCNHsOyuQ1NIFx+0GAEdXsfv47LDEzCN6gM75CRKZ5uX9d
	 xD6RQNGTxe8g+DS6iBwfGwOecYL135cH3hcV+1ZzH8ltmleEl6hJRjsspkdddZWtio
	 65VRcrH0qUt7Lu7tt3ominn/Gtfu5+87NknTfJ5UKXgdc3S3wZWaHgoSmqexxRmKxk
	 6KWCjPfsZJkkA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C26FFD990CD;
	Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170846356179.4365.12248391015916482577.git-patchwork-notify@kernel.org>
Date: Tue, 20 Feb 2024 21:12:41 +0000
References: <20240219131230.157792-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240219131230.157792-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Feb 2024 14:12:25 +0100 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v6.9
    (no matching commit)
  - [GIT,PULL,2/2] MediaTek soc driver updates for v6.9
    https://git.kernel.org/soc/soc/c/d4aece85e8b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


