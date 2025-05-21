Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28FD136351
	for <soc@lists.linux.dev>; Wed, 21 May 2025 22:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866672; cv=none; b=kwDBNqpi9lOwgpPnkLjGLHERiLPT58FLopnWd6yIsgHlEkMkPPvVEK7EZjKBvonG1zoP9tcsra2aJ1mWvxSHwOeCk1+EbTr8q4XnsFaFYo8vng5lTb1OXKxNojXNFByBTpAMWmUDlpe4ex8OzArOErkhKC9wMv0ov6qX7XqCT/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866672; c=relaxed/simple;
	bh=8nAzcplo35LJYnTDpo5BAEw7bjyTgHiT9/fi8xwrMOg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HNiSKnxo113EuKOnIQfuMIvHLYoZoFTOGnh2AJlSqVlJi3v96xUYvETHwFCMxOV/eN1xtOiaX39mNJ/iFbNMHZ6gNn9AjRwvZN5F5edRlwOGYG/s84J4yYaG2MLStjqf8ywyMuXds7DqiRC6uMGZ8Two2YW3g3st5FjZoWFjl5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdSSshE0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdSSshE0"
Received: by smtp.kernel.org (Postfix)
	id A8600C4CEEB; Wed, 21 May 2025 22:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D42AC4CEE4;
	Wed, 21 May 2025 22:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866672;
	bh=8nAzcplo35LJYnTDpo5BAEw7bjyTgHiT9/fi8xwrMOg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LdSSshE0um0yf1QIXX2PGWm8MqJcReEWMDS7kFjMgXsTiwhJgb+0hWOk5k9ZKf0e2
	 j9j9Iag+Ffo9kjjJrmoaiH3e7Yd5/agpKYzV7PxJ9wNKstodAJMNkfFtidqa/fSvV8
	 5Fz6vHagfWglhCzvTYTeQacgiCwXmD3SHUUc08QVVPOCZYjnpNY7RFxbPALD28TdX+
	 nTFMuF7QzHDbAXqnqQilrTYjFksZmlRe9xVxeVG2U+JtorbR00+OB5/6JANPOEJnFc
	 tvvCwD3uRA23KoYQmad824ZRjbnsjrcThvpO5Od33i9Uk6BXzt6MyRnhA1A5aHdhxE
	 xLPWRlPUsRuCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E28380CEEF;
	Wed, 21 May 2025 22:31:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: nuvoton: soc changes for 6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786670798.2299459.6254091308065400079.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 22:31:47 +0000
References: <CACPK8Xe=f_hNNWUGL670x4-OeKgDB+2P+mxp5BaTLW==T5jE_A@mail.gmail.com>
In-Reply-To: <CACPK8Xe=f_hNNWUGL670x4-OeKgDB+2P+mxp5BaTLW==T5jE_A@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 May 2025 11:43:53 +0930 you wrote:
> Hello Arnd,
> 
> Here's the Nuvoton 32 bit arm pull request for 6.16. Andrew has prepared the
> patches and created the tag, so all credit goes to him.
> 
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: nuvoton: soc changes for 6.14
    https://git.kernel.org/soc/soc/c/c307e9c1a472

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


