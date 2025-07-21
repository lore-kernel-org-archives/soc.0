Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F48DDBC
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 15:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111912; cv=none; b=nvXA7n7ARM5fX3Ba+HMloel1J9m5tp5utoe/TbY8udZtRusWdZw0HVKlLfbXXMzeKbsh76iDIgIKxzc3lyCzy0M1pw6qtdu5PRrdI8bDDdicxFNG7DRIxiW7eMNzmGZ1MRHTxOcvnBIO5nU2+yjzQ9spyv2jU8C6Vn8nYAwKmPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111912; c=relaxed/simple;
	bh=BKvMpa+XRpx5IEIG/yb4zHd5Hkwsb8sMpu3zVhUVi+g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ERg0vNjbbCs5jMTw24vNn7GOyzPTZjkIlZuRGezF8iAC6bjEBioJkE85yC93ek/jxyQVS/yWvfJzPhK3t0XEkpJhk6vsmmi64VkZ2cfYhze8lLgwaz3J4YgH3KAoee+9ZeRsj9lHeh3nvCSwaUZfK2MwaPzODDK5lvfu+pf3qo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r4Yci0qI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4Yci0qI"
Received: by smtp.kernel.org (Postfix)
	id 0E25FC4CEF6; Mon, 21 Jul 2025 15:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC64C4CEED;
	Mon, 21 Jul 2025 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111912;
	bh=BKvMpa+XRpx5IEIG/yb4zHd5Hkwsb8sMpu3zVhUVi+g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r4Yci0qI0ujfXuB/cDhFox27aB9oYOxcdqHoWXr6dBDx/f0ENQDTJcHqOMyZtu4AI
	 8k8w38wGHYdD2V0pTHOh/MfmTkw/N1Jxlie6ZRuux8PqWWlGkAjCv28lzn8m8yPsp8
	 SF+EyXiON4sq9QaFPt9lyNCJy6UjuyfQ7qTAdMLpOn+RsFBtJikylexk7PWUdr2l1j
	 mYmmcFmcJxEw+/TBhB7CbldW0/PLDb+CMukaxxWTM9m0Td7GJ4SdwJDkvpjnedB6kR
	 Em8RPQo9GLBe9niEe8oPRp6+9dMiIDNmcybmdqmL2g0otu0vbDjTPvS2x0Xfxzbjfa
	 grjDFNS6Z8wWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 01BBA383B266;
	Mon, 21 Jul 2025 15:32:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: drivers changes for 6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175311193074.94241.15161048055182600083.git-patchwork-notify@kernel.org>
Date: Mon, 21 Jul 2025 15:32:10 +0000
References: 
 <9123f151280e52c63dcb645cb07d4eee3462c067.camel@codeconstruct.com.au>
In-Reply-To: 
 <9123f151280e52c63dcb645cb07d4eee3462c067.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Jul 2025 12:23:59 +0930 you wrote:
> Hello SoC maintainers,
> 
> I've done further rework to the ASPEED LPC snoop driver in addition to
> the immediate fixes found in the PR at [1]. The commits in the tag for
> this PR build directly on top, so those from [1] are also listed in the
> shortlog relative to v6.16-rc1.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: drivers changes for 6.17
    https://git.kernel.org/soc/soc/c/708109c46f47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


