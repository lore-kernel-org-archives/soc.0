Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685B2B67A
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753109506; cv=none; b=TnnRdIZnkZeuyBMfNhLnmLs8lHtiAi3avwhGTK+elmLgNuhB+8JFl0d22zbAji+KGdKxevyuM5Auf215jPjoMpIwVABLZT8qnKFBDgjXtkW7mts1KZXUYoaa3LVq9yoCZQjMwqLlPwlPQJKWbge8E7lBlPJPLRHal7YtkGIG/MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753109506; c=relaxed/simple;
	bh=Hfrle/0U0nT56vcCQvhW5E/oG9JEFonh3YNry6LGRzM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZJvObeJUj3XuVWGz8rEcl1ZhpUg7pPC3YSKFEct52zUE0utByWhvUFBy51MaU+K/XP/YyidCB4ZbzKltFaZwpEcPlPcg56eRrKka81kav5xJk8PtKqEN04ZCvMnU7ZhNPfnUY7BXhqKSL38ejLHHQrN0XjlqqNBPzbXhc+kLpwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qw16HtdU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qw16HtdU"
Received: by smtp.kernel.org (Postfix)
	id 101FEC4CEF6; Mon, 21 Jul 2025 14:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED790C4CEED;
	Mon, 21 Jul 2025 14:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753109506;
	bh=Hfrle/0U0nT56vcCQvhW5E/oG9JEFonh3YNry6LGRzM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qw16HtdUevg6eKoaf7WQX37x6rTKOwQzjFrqAT1YgTDooY7rVF5G4t8UXL0fMCVP5
	 zJdnsHw0w3GJUhZZuHp4rp7u5QU4c10zSNq+nIaaoLKmaGZ7T9NMAz/XAg4A4Ozwdy
	 q+R511H8qFNOIrB18cf3IkXTc8ohfO8l9uf7zIRkUBPab8xNEYhGRaQ0A+2234fkJz
	 20uTR6TWrR69eCmRTqthSyZGsRrl4nGKvOBDjV303LXXHj3IV1WqR1VoHg0NTRc/Ow
	 hBNlMtKxFbnw8lkFa7qsoHkIMUfyx0/+/DfsM/6FgV9jqXA3MgiMSIHi2vOHxJg7HE
	 EsmGR5bc5Xrgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD20383BF5D;
	Mon, 21 Jul 2025 14:52:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner fixes for 6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175310952476.77297.13924813419143512673.git-patchwork-notify@kernel.org>
Date: Mon, 21 Jul 2025 14:52:04 +0000
References: <aHaJp8ut6z9Ds_qn@wens.tw>
In-Reply-To: <aHaJp8ut6z9Ds_qn@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Jul 2025 01:02:31 +0800 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner fixes for 6.16
    https://git.kernel.org/soc/soc/c/816309d500ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


