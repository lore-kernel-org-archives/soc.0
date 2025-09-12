Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADC422A4D5
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693421; cv=none; b=eQsbu27UWoQ5vPYfZ9c4MOpRJTlo8S7kkJ/vDwAIW2A6xuBnuLdZCQh024M/Bi8E810eGmiCyBtsOVy5pVktBfWZZmtfyTllocMj8uc7KaW22TNrWcW+QVWEvOCJ9Rf+ZoJMwK0oS0N2MQSL9wNXZaAA64IUnqrSVXLJ6B6yXbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693421; c=relaxed/simple;
	bh=aoWMxUvFrDMgYZuO+MEt+Tg60QAiwFKqc/lrrGYe5f4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RugJ4oD/QIH43VFqoeDWP+IgByjulU13+vbv1Aq4E7ERedf+v/RsEiTmUMXL/zDIrUs6K6Zwz9eKuZVWZDNUuZLCcRZHu0jeDQ01EzaY3HY2sxq0B11PVU1K4hq6kW0QE7dTFdcsUyd5eaisGXozvi5Dy4pron98K8Xxxdb+c8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPdWXvYk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPdWXvYk"
Received: by smtp.kernel.org (Postfix)
	id E5192C4CEF4; Fri, 12 Sep 2025 16:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF477C4CEF1;
	Fri, 12 Sep 2025 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693420;
	bh=aoWMxUvFrDMgYZuO+MEt+Tg60QAiwFKqc/lrrGYe5f4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aPdWXvYkJt5XgJajOhdo05k/qdOpBvUFGzTncTIgjZNA+TnZ20Aj9WsrFbXXq/pDd
	 HTw57lafIweJeUBDyGDHfZojiGO1LkjG4hzXifV415k7XyvxNfS11rgMowC4kdEx1E
	 ZRAaRNq3i32xLTOYYKOzonzj6dbxK4YtphV44joM7yrcYjG96Sj8QCusz1d5VQYqWm
	 UXoBGZWTKQZC+86afi0YUNjS4T1hsEoEnOShzgzuazrqh0h6zXif0hN9nmhwxh4Cng
	 4gUQUGiLihHqf/avgyCJjjijN+Lnis412yiEQV1FH+a6Y+GQVn5lKf/l+oXMH8K2I8
	 IwRDcyXeHPp0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D45383BF4E;
	Fri, 12 Sep 2025 16:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v6.17 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175769342324.2998972.17350454590307482681.git-patchwork-notify@kernel.org>
Date: Fri, 12 Sep 2025 16:10:23 +0000
References: <87ikhnn1pl.fsf@BLaptop.bootlin.com>
In-Reply-To: <87ikhnn1pl.fsf@BLaptop.bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 17:13:26 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for fixes for mvebu for v6.17.
> 
> Gregory
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: fixes for v6.17 (#1)
    https://git.kernel.org/soc/soc/c/f1a43af7a9ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


