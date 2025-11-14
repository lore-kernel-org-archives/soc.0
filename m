Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7AF2C21CD
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162648; cv=none; b=VE8e6RMlYvvJfVWibvuAAj0U+B27cdAjKJMjHI+Sa8UOojtTuWtUpY5tV9pwue8tU+g/znzDsfEwDmXSKBR8yN6Ks/t66PgZzOCCHzwTzaFvvvmJRO3xloazBK+8xf9jr6qMx5ZSu0hFECSwO8wIGHrhFa7TeqHa7zT2K+whojA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162648; c=relaxed/simple;
	bh=mT6v7zfxC6NkaMOmPLQRqUG30n0RECrndOb+oAngQb4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RoWyWwKwvgs+m8TWJ5zHTqjsFEZO/ZzjUDztvRMaOC9OLOFybDdueqMbpy8R8eliHR7N8tvui4BscGc2gkOKhDNXD523fsgzUEjEU9spf8xFasPXnZK7NhUUNZYJcm6x2QxvuAxq6x06Mdo19j+KbZe9ieQeflTwfVBJvk/J29o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNxwn/gk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNxwn/gk"
Received: by smtp.kernel.org (Postfix)
	id A8DA5C2BC86; Fri, 14 Nov 2025 23:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92BE7C116D0;
	Fri, 14 Nov 2025 23:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162647;
	bh=mT6v7zfxC6NkaMOmPLQRqUG30n0RECrndOb+oAngQb4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iNxwn/gkB8DZebKp89OYrsUIWutPBWh4/OuIocaU4lrkF7szEe5b+KzHZ7+KyAsm4
	 t6RgA6OVkG2Exo8hNtE73x3K8xaf46TqYQb56xtzBKRl7pMNF1rTowaTvCjxMeMhCg
	 XltV2xNlFCDP9KBGyhBT5pBHtsYoiDT+w1gGDMxtLuG2rvrKJQYe7/ZgRAmaWTWz8V
	 CkF/nqJ5UvLXPEWqUuUhIlqFYhXjaR7746vad/XdM3WOrz9qxgjwsn4ZXU7BNMsl3L
	 vAH3vxYKsijvZ+1G3tD9MBBFzQym3bTXp2Go0S+Ln9xp8Rj+XCj/3L46WWgwvag77J
	 nH0A1hdHILB2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F753A78A5F;
	Fri, 14 Nov 2025 23:23:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316261574.1867843.11022540593676891400.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:23:35 +0000
References: <20251030192007.682116-1-thierry.reding@gmail.com>
In-Reply-To: <20251030192007.682116-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 30 Oct 2025 20:20:02 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: tegra: Device tree fixes for v6.18
    https://git.kernel.org/soc/soc/c/3e40c919816d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


