Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907FB27FB11
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848028; cv=none; b=C4049V4EMUVy7WcxCx9OR6S9TMhzdKogrhfv/SirgpA6YBHtt3XmPuXRkYnb4smMjis1zPhMTPSzFdikDbpvVL93B6Vfqw/aX2aRqx3ADt94v31srWs3q+wY/QSZzHlmUrCBaBGG0KmNTJvujHcb022Ex4Y9t5Hf96InGzlWSSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848028; c=relaxed/simple;
	bh=T6GKS7XNFal8uo9C3sha8lSf6+xNhIzloIycaMqE8Qg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=O0OM+8YOHGEnsFcS8FFVAvfMb14LFZqNrZgpKHrJVxm5PNGKrI1cWgCwBO5WftI3eE/PdUXlbCzjWyy6bgHrNGbkIiv7hvXSeJ222iZTN7nMYQzGJ2q7U8gwRKOuXy8ig/SdaTAQPXJUQuDJRcwr5hUgpuKk642yDboWxgCAI10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rR6N4QkN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rR6N4QkN"
Received: by smtp.kernel.org (Postfix)
	id 1CBA6C4CEED; Wed, 21 May 2025 17:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072D0C4CEE4;
	Wed, 21 May 2025 17:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747848028;
	bh=T6GKS7XNFal8uo9C3sha8lSf6+xNhIzloIycaMqE8Qg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rR6N4QkNkCLaTB1sfHNLtSBOoiRKR8y660Lg9WIcM2rGMAHxLnkUVVKZQQb1RIuiw
	 MNgWw3Q7mThg4cxduJol8AQgAcKvRrnPcSh5pTpTdFFCBKSOacACQiRnlJwMGjFHsC
	 vSIjh//vqoWxOiIGzCx5LSq2TTiz/oKYmJCXjUfW74uAIWVVAHq5V4vpMZ5MM/FpPc
	 JG6vuv8fDyfjimGJuSbjCrLypahnrkE1uoeiWVyXnYUsjn9z4anVlWte+zmHr9TgV1
	 s5I258TrhSL8dkaFwUFu5uVJE2BiYXUpS6FUoAdyHQhqWZzzhaE7Y/7ZA0xOlRBBnh
	 hWbngLuQ328JA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEC2380CEEF;
	Wed, 21 May 2025 17:21:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174784806349.2163178.325958955987802372.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 17:21:03 +0000
References: <20250513092516.3331585-1-p.zabel@pengutronix.de>
In-Reply-To: <20250513092516.3331585-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 May 2025 11:25:16 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.16
    https://git.kernel.org/soc/soc/c/a97bf0c6aa5c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


