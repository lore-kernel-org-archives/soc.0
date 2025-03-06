Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EC6148FF5
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741275684; cv=none; b=ZhDvYbLWlhIIf5UWMxWcdLC6NgbGLWkE0ZF8CelhHysFMYCXmhuCbEsrASBH8Bzdi5g37Bx9mjq+b0S88vZNJvYfpEH6SbC5nX3jS+UGFXWz66OcOEfLoaYXNzt15SgvlO9oLSygIHEfwO9/gxWfGMAYt/ZIdttxXMfYRquXy+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741275684; c=relaxed/simple;
	bh=hgref6qZTbB7pewVBlwFHwDz4dTzNtwPDYedOxwRi+0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=W9nnmHYJHTfl3C1yiqH/qdHrllWeMrQKhHoUzlSF/uEBGlIs3nOSddZPZ9f+GlLT2jjdeppV9ExWriqWxJ0elqOw6ZpLpgBLy2NYdlxfVQoZyFU0PIxgbnEj0mQteK2rdtU/5kqyutREkxJJRBW+m6xUfwd/4F3fu/BACWoU8hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYcHNThN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYcHNThN"
Received: by smtp.kernel.org (Postfix)
	id 4EDF3C4CEF0; Thu,  6 Mar 2025 15:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36ED8C4CEE4;
	Thu,  6 Mar 2025 15:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741275684;
	bh=hgref6qZTbB7pewVBlwFHwDz4dTzNtwPDYedOxwRi+0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VYcHNThNC3GpjViFegxoOpE7lbbYKsGYFmwpIUUStG/fQkT0pRjtG0AnKbevYN2zq
	 GC6yxaC9mQbc+UXWaJcBF9O6b1lz1eGgb4XvUiEjb9Laf8/YGSSex0CcFdpQUg9NfX
	 XMrdiAZLeqHSGuXcvh1DD28FSlZBaFAnFmgGghJO4KNCKQ/T6tMB3+qn0eAFxCMH9D
	 4drv0Ed7ZqN4b5FYBP/lHY2aJ9biR8kMSXLYJKaTISZB+3/pZNyyDSfDhNDXzNyl59
	 aofiVnBRK4Xtvg8i5vDeD1/2AaWjjDL06c/12qbX0rkPTzh3kt5tBEKCWDKA6c8JmY
	 MrIzHGYO89wuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF0B380CEE6;
	Thu,  6 Mar 2025 15:41:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetree fixes for v6.14-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174127571750.1636926.9357683333849328215.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 15:41:57 +0000
References: <20250305-sip-unable-d56ef7dbf86b@spud>
In-Reply-To: <20250305-sip-unable-d56ef7dbf86b@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 5 Mar 2025 13:17:12 +0000 you wrote:
> Hey Arnd,
> 
> Please pull a single fix.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetree fixes for v6.14-rc6
    https://git.kernel.org/soc/soc/c/26e29a26f84a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


