Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531BF13B7A1
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730473391; cv=none; b=u/T9XPp6zKlMLI5LFvFZ1PzuEAD6Pwn2VBUF1fmFIzPHfVbiB01ZAC/8Vp9YSRD5H/d51f92oEcNv4fOkPkXUTY5r78pu7WmHxhlm4JDRuvHC85sjYF+/9w5EGSSfrRS2rl8tryaJ1OiVUfBIn0Shbd6SnQNXfGFHP56S/VpAbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730473391; c=relaxed/simple;
	bh=uNOXU61hNpF4J/BseGNx1JJgVZYkN2AZgLYQdtfQVbc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Cb4cf4xYVsov4800QVQ62KQ37iqSvh20YynLybmQhd0Gh8xQpsaE+cxKYCBCoRETQ04vIpZz6XXVdh4HERr3dJglvvarRiVS3r+ytiC67ofJ2VjPUOQ1G3ci4cSscyUokyQyFgBmJjQs1joyV5catlsqhHfm6W6mmnsufbHlCAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvhbXa4a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvhbXa4a"
Received: by smtp.kernel.org (Postfix)
	id 09558C4CED2; Fri,  1 Nov 2024 15:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E44C4CECD;
	Fri,  1 Nov 2024 15:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730473390;
	bh=uNOXU61hNpF4J/BseGNx1JJgVZYkN2AZgLYQdtfQVbc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JvhbXa4aBPs0IAYgi0Lz43Jvk3X85ssiyYr6geATZPqtpebU41FcQEzP9KUixvJUI
	 xfAxoKfJTycwhZiu8CUUHPMM40XWlzFJ69OQuRn9Ot4H9qJNAffHw3kh4jWWLyFm/X
	 mG02dU4nLQIaQs9l8PJml+KBnwg62E3gzRXNvL1inBfC2/Ws3/3YxsmTWvUvl0eoWj
	 xzo6tKyj7JeOhMfS0QlZqyG9JOpGAYl0naRn0s1YFVZY8gqkMWg1V6bidnvjVh4zlb
	 ZLUKiWN9+GqWoYjk+YOdVQhDcob544ZUgPip8zb3WiOH32teIi9iEUZ86zomkTQc0r
	 LMhAhmgL7rt2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34DF33AA7F3B;
	Fri,  1 Nov 2024 15:03:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V soc fixes for v6.12-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173047339896.2666840.9589834354581873636.git-patchwork-notify@kernel.org>
Date: Fri, 01 Nov 2024 15:03:18 +0000
References: <20241031-colossal-cassette-617817c9bec3@spud>
In-Reply-To: <20241031-colossal-cassette-617817c9bec3@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 31 Oct 2024 12:22:18 +0000 you wrote:
> Hey Arnd,
> 
> Please pull some fixes that I have accumulated for this cycle.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V soc fixes for v6.12-rc6
    https://git.kernel.org/soc/soc/c/e5c06efdc030

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


