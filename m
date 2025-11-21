Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A78B262FDD
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 21:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763761843; cv=none; b=Io+ofWyuNMjszrDLcgzz8N6flfuZ+8aKIPzyOe8noyu/Cu/Cjl/qX/1Yq/MYCh2wGm8vxJtwY0UuGdTFYj76qfGPvc+QKUtIYvBNNBq6fbBb/igpTKQ0D0d0D4uzd+kRNnWPEm+As69cAfm//mHVlllHxGEOvTNn6NVv69I1NGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763761843; c=relaxed/simple;
	bh=PLzzkW7KyGi7T3hoRShfe7lUm/BSI5BfG23i6FIIUVk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=j6Pp4pQiLXHXgMpiP3xFAPfRT7vorMkV2DngW5/YKr8LyMs/5EH65A7V8omCqsjAcxVriHmOG40SDDkcWSjxi5STr9D/jP++nBIUoHZA+5jpCPoFd1Vmt4IN51siZJbmIjpT6joTpeQEtHXXZ1xidGNr1qmpXjV5VgK7q1oJe70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvOxJ0BM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvOxJ0BM"
Received: by smtp.kernel.org (Postfix)
	id 0A250C19422; Fri, 21 Nov 2025 21:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06A9C4CEF1;
	Fri, 21 Nov 2025 21:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763761842;
	bh=PLzzkW7KyGi7T3hoRShfe7lUm/BSI5BfG23i6FIIUVk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uvOxJ0BMXtiMheiCKp2aycULYWgvK/z9f+F/MNV1wzKoDwRDllQ9ugwQ9DfbP6RiI
	 XqerW+TVma73lcVXv9ak424ytm10JDK4Pv8mggR/fBo2bUuYwQ3duqgTbhRPL1sVez
	 a06Ubp2nJe6iJncxZXdVXAsPy/Es00cCGm52XEM4qSLLxl5VdJNq0mW71DcePdrCdk
	 fYHWud6LK2hqtjpDEJm+XjelVGKgICYHVJr6+irLzLNOJP+yKjUhb5/fz1duA36xRL
	 tq6Kuuo3N+udjzPUXuEvMihVsNcvjNAGNQ83wEQmB+xDdlhOZMFIe2EhfDpPwzDz8j
	 d3vuWfHMLVGTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE1D3A78A72;
	Fri, 21 Nov 2025 21:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: omap: updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176376180751.2598359.828425886534151282.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 21:50:07 +0000
References: <7h7bvolgd4.fsf@baylibre.com>
In-Reply-To: <7h7bvolgd4.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 09:27:03 -0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/soc-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: omap: updates for v6.19
    https://git.kernel.org/soc/soc/c/ad2478e9fc6b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


