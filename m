Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7BE20899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422294; cv=none; b=VlMsoCXyapetmatnG0Wq3OYOowKi32KNxWss2wZJxN08iyZ0mXRbW82zVtMZ8WXWmzFlNlo8Mu/hiUSWGmAughb99TTLmUQQn6mr/sAxB7DowEWxTJONclWzJPMkNEB5zjzV5FegPOdVBQxL6TFQ2HSM22kCrEbkHf/IbMcDBlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422294; c=relaxed/simple;
	bh=BwCRr3KTHhnSHtF2UPPhQAI5e5tcyF6bL7dY1og18Mw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=J/5PP4xKEiYxDchdTXmbDuyZU6e8TBxQb/2T1bn4cOOhgUC22CYsuSE9ze5iRaisMaQ87mbqCqadpi4u4v+MeAAhgpE5pms3w7UvfnM43FDrLCuZOlF9AHKQAK1tFV0wx9RIVc2VvyYiDjjNENXNVIvyhRtg+YQjesz96XlGmJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eg6FLZCg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eg6FLZCg"
Received: by smtp.kernel.org (Postfix)
	id 8FC29C4CEEA; Wed, 19 Mar 2025 22:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798A3C4CEE4;
	Wed, 19 Mar 2025 22:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422294;
	bh=BwCRr3KTHhnSHtF2UPPhQAI5e5tcyF6bL7dY1og18Mw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eg6FLZCgcnJGU+PnkeMg400JlpAaLmUpQbNYiefLT3A9uVWz1NbGmqTO04OemYWtn
	 q3588vfKf213PfJOb65HVP5L5MOkSQXXjOW31bAXfJOZ+ifFIGJU2SvG2x772yP/Gi
	 JqXzvxlamrZvbwub1z2mceCsgO+VMSh3nWtITwSwz9JGBVZSry5jR9WIczvkT4hqEA
	 IGvItkO9kNTJwH8oKAQfS0lJUlvG269/9vOltwN5FtWELjEsHt/XUrd1XOvTQoQoe3
	 7TSV8ABHJK5tCw86/85o2eKVfzh7QdI29G+QfCktSJKi/IC4QO9HQWCc231STH5Ume
	 a/6e5K9jl50ww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C593806654;
	Wed, 19 Mar 2025 22:12:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242232999.1211847.1847399961321071826.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:09 +0000
References: <67D968A9.7080504@hisilicon.com>
In-Reply-To: <67D968A9.7080504@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 18 Mar 2025 20:35:53 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: hisilicon dts updates for v6.15
    https://git.kernel.org/soc/soc/c/2c5ef4e0b73a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


