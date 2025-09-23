Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E59263F38
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662452; cv=none; b=W+qSga/vmDkGePTo65ekr7YFwSWY9A7pZC3mYjJsVAA3XV7+u3aDn/Vv6N4XR9mBux1Nv7g9X7Cfv6ppleYHhvkRFO0eSkpDqfz+7fZlgpIaL4N5KM6RMLy4LsyYDP47f2gP+90oIkc92ESI5EyY5MnCLRlqUU+9TRVA13d3AWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662452; c=relaxed/simple;
	bh=AJp+tdTggaC5AAWKrSxm0Ig8czUzuINBcvnF0fpssJ0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pzkSRHK1gZSickUzPiBc26+Sf/DwaP2AZhTIeB3HdzgtHGYMwh6EXVYkdiyT/3OHgn4+T71BSrAZqaRb1n23WGNMQGw94Uo+Df7tQ3PrWZeHuvfhjqGmrVB6MxdTJ+Ik4kVRsE26QGI1fnlzQNNXPZ5vsMw2Vwr/2+ujWH+bdzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlvfHBbn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlvfHBbn"
Received: by smtp.kernel.org (Postfix)
	id C40BFC113D0; Tue, 23 Sep 2025 21:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE52AC4CEF5;
	Tue, 23 Sep 2025 21:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662452;
	bh=AJp+tdTggaC5AAWKrSxm0Ig8czUzuINBcvnF0fpssJ0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DlvfHBbnu7o+ZzSstATTa/EhLH7HdQnMszZ4mhPAHkVKwxoYl6cgLYlWwMSyVeAvw
	 b2pvil5yLUzTJk2SVSwp4RE50hig/6wbpqZMHiXbgpSze13VHKPmN1Eyc8wRG40z9S
	 EX19V0m1gIL1BSAtPgXNPCufr6E+SCgjPHdqhnW7FWUBQnFiEq12k+5jpZFqi//vd6
	 5JU4yCp/TxC15uAzyM5Gqhio+ofBbeCxU3d6qVh+B0Nvnnx16VZsholsPb/bwcnWg+
	 2Ba14OR7GTIwnmSZ7gKjNNwAp48iy7jtLLlYMod7+DyCpI5sDRdGBuUgANrKugpxo7
	 1Zxx7n2w8dSiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB00839D0C20;
	Tue, 23 Sep 2025 21:20:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Apple SoC driver changes for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866244948.1926563.15881048767445788365.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:20:49 +0000
References: <20250920123028.49973-1-sven@kernel.org>
In-Reply-To: <20250920123028.49973-1-sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 20 Sep 2025 14:30:27 +0200 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-drivers-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Apple SoC driver changes for v6.18
    https://git.kernel.org/soc/soc/c/72af4030bef8
  - [GIT,PULL,2/2] Apple SoC DTS changes for v6.18
    https://git.kernel.org/soc/soc/c/8de446fd49c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


