Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628CC2C21CD
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162639; cv=none; b=Wt6U2RKFsJyjbV4Flc2TRmbXtKgR/M1fiNBI4HhBzSbBI3Tuz4qCe33zRYznh6cUfQyZJl6IIuKeB06ZHf40OcMHUh3F8JCD2rWOixmbDePjcGUrm+R8QdHhWRTUV88siD30D0Fr+z2FtSQfDO4055WidK9J1prewMSlObU9f24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162639; c=relaxed/simple;
	bh=ry1bqrDJr93nlKY0zwCLjCH0L1zn3lG255xP2V6Y6Fw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BaCRScr1ddOHW5kh1Mx0+4jeC9vKq2aNbqzoSFu6KypvAg3Ru231Hewg7sqaxVFNZU7O3IrYcWmERQHdoBD8gcizhBC9Bm1ZU4JDUys6xq8JPOKlURjMp8OY4MVhbPWP371ZNgWapFdBsoIKGWpyIiunOytBDUC2yMVwJdE3prM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9TUyU7s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9TUyU7s"
Received: by smtp.kernel.org (Postfix)
	id 55422C4CEF8; Fri, 14 Nov 2025 23:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE27C4CEF1;
	Fri, 14 Nov 2025 23:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162639;
	bh=ry1bqrDJr93nlKY0zwCLjCH0L1zn3lG255xP2V6Y6Fw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H9TUyU7sGxQXeFHTu8emgucvctWI9qspSF4nYJ6BLlCdAYten6seoZzlahBJ52vmm
	 mbnEAeQmed6F7ZS0xj3RpygVt/lUluyToEY5ircRQalFlJPh19R2nDxxHEPyFiUvhW
	 FTxuUKSgILsIrQ1TMqznBNTPnZDy8NENsx4oxgT7bXzuU4sQRBTEfV27gyTkofCHc+
	 RqkcVvGqwn8eJBY4fjgo6bHTu1LYo3LEUsKzr7+xPU4iWFmKon8dZSm4WSgqTz8czm
	 OZq4j+DLkcB4+Veg92/yC/UH4+tI/pms2B1O/McwnN2EIK58Wp57eEAI6yamwjzz2e
	 oL7w/b0/cM5vg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE973A78A5F;
	Fri, 14 Nov 2025 23:23:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316260749.1867843.11912370572417055502.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:23:27 +0000
References: <aQawyJZbMn52EKk_@dragon>
In-Reply-To: <aQawyJZbMn52EKk_@dragon>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 2 Nov 2025 09:15:52 +0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.18
    https://git.kernel.org/soc/soc/c/f4f012b0ee1d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


