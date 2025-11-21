Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DA9283683
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756565; cv=none; b=BhrT9Wdq1fRO2X0YY9QmJ4Ss5CW2ctfP/AAwiFrkhdYAxLxGpqJigTVRggWyYICPWQxfzm+3hyrdlsDFDJTMMiwfXXG4a3+UJnCbjHK0yIHwm57VkSamKDqOYnfz95nlJ+tKw9Z/0qOsxfKNg2UpEBq8dtqLrQ12tCouITMCuIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756565; c=relaxed/simple;
	bh=56D2hxDfJtm7S6ufm1jzZWPVtO+tT+DEPUqXMGhUcAw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dBv6NFcpIIXozkOOnCsbqPpiBr9bSu1kRzJ6wLJDvEQFpf1ekMFgQQwnc65MQXt6cgD4ewxYcJzd0qmjrVQF7VGz9x0fQCA0dU9ioBAdezF2BPo7x2cbGUxXGUSRNfgpk2V+oSX7CqYG53uxz8D1C3wcWzNUEaDNRcUf/7Ismmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q3Cw7KxH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3Cw7KxH"
Received: by smtp.kernel.org (Postfix)
	id 2BC07C113D0; Fri, 21 Nov 2025 20:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162A5C4CEF1;
	Fri, 21 Nov 2025 20:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756565;
	bh=56D2hxDfJtm7S6ufm1jzZWPVtO+tT+DEPUqXMGhUcAw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q3Cw7KxHiaHLDziepBmHtPHKAgxwZ0TKYD9etpSQtZ8+e2kpX1CnGsAGukzhfz+/q
	 6M7tnt9KSNvo2hluThZF+tTdGDqMvfk/z0pz4w/rx2fQkhvbtuw/B/T2aSddhv3gW6
	 8epqzehxYdDAdwsbeEE305nXukcR4+gsq5PrbsxuzY5CJ9u6UJQ0dSG9N43QIUZrlB
	 WfhlkRpKDZ7+ZFTMlIsHfsE9WtO1adtoJppWBH3j2KPvtIKqGZ/1omJ0gezMoy5DMe
	 bsBJj0BwUKvsfiESDASoU3dWViQBXAkNU702Uv1hqSI69l9GM/Kx7DxJoo37kBcNf3
	 ZUaCxVj6YnoxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC543A78A68;
	Fri, 21 Nov 2025 20:22:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/2] Renesas SoC updates for v6.19 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375652949.2571237.2874418486810303630.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:22:09 +0000
References: <cover.1763115230.git.geert+renesas@glider.be>
In-Reply-To: <cover.1763115230.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 14 Nov 2025 11:30:15 +0100 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.19.
> 
> It consists of 2 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Renesas driver updates for v6.19 (take two)
    (no matching commit)
  - [GIT,PULL,2/2] Renesas DTS updates for v6.19 (take two)
    https://git.kernel.org/soc/soc/c/9481f1ce9b8f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


