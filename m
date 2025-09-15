Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D306523A
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944257; cv=none; b=MPJXHRGrYTjDiFzENaGKvVuety6eW2k5Q0h3hJngG1RvYQXzwVr5oM+x7vlP1l+07JB3aM/s6MEjIldZRmo99e29Lk6MS1snKXDa+KaKi1TGmcutnih08aKq+THc4NNarq2KhLzgwEtx9S5sZlWMEzSocHeUrCqWK0Wan4/ldYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944257; c=relaxed/simple;
	bh=Bujz9EVw9SpmyTV41fWdIp5pERzGhwCZYsS1gXtTtDc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OrK6M/Fl6eDcfoRUD+GxKujb6+8SSX++xokZ3qxJ9wu0aU8MMirPdtd1g5ZyBxsoRniuDvrIvlnRJXgVXVnZGHji4McTCw5ywqA3mr8J488M1cBsRV7yhnAMEUGhyX79K8b3jsunmEAk2wD/j5aRgfLHkr7cRseL9jfHwryxcAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVSru8/I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVSru8/I"
Received: by smtp.kernel.org (Postfix)
	id 077FDC4CEF7; Mon, 15 Sep 2025 13:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E627AC4CEF1;
	Mon, 15 Sep 2025 13:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944256;
	bh=Bujz9EVw9SpmyTV41fWdIp5pERzGhwCZYsS1gXtTtDc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kVSru8/IKd5bMV+hZeMsA15taLWNJaV1EGBK0Tb7KSivpYkiDZ0uC5en4pynQZYdy
	 mX+Oe7REZBtMTeKSz5ne4fGQYCr/8sDu0o+6Ab5cmmIzeC2EGVkzcalr4zEJCLUEdY
	 20LkwyFHhDm/e/lC66hw2uGTXTFHChJf/UxqwEozyO1njzssNMuy4+ZEGMm5MRyFWA
	 zGmDILO8WVJmORZ5eXHsn9XqhvZWba7vm9rzP5Xc1yV6Yie4yJZeXyBOQvfpWPOPju
	 yK3+o1QwsOV5CPjEK9z1ngY4OsNHrOHYPG/mdBBUcM2O5xay27H5PFd6U0C1G/KHF9
	 Yv0yBFR/nxHwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE3F39D0C18;
	Mon, 15 Sep 2025 13:50:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: further devicetree changes for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794425823.4179625.16404421483721330644.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:50:58 +0000
References: 
 <5793039afcedeb28179a3c9909631d8251abc73e.camel@codeconstruct.com.au>
In-Reply-To: 
 <5793039afcedeb28179a3c9909631d8251abc73e.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 15 Sep 2025 11:43:18 +0930 you wrote:
> Hello SoC maintainers,
> 
> This is a second 6.18 PR for the ASPEED devicetrees, following the
> first at [1].
> 
> Cheers,
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: further devicetree changes for v6.18
    https://git.kernel.org/soc/soc/c/10588787c803

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


