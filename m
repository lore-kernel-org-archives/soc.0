Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB751B4F2C
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758257; cv=none; b=AmckltqOpfguYLONOIiDxnQopE7hG31ovTDw1kBppMOTAEqp2sUblI04EnHAHNNikVOFT+KL6qlb5/Ql6SqTIrPS9nIPDSr7VykFIp49JtqUzSKEjZVtmAWozDKpziDoLbZsKlqSHAJRvwerlP419w/1Mh7Z26Y0XwUuWaYi52E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758257; c=relaxed/simple;
	bh=RvL2zaYmxj2N2koUfgCRy5fk8k8/fgOMskYVmxYngvA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IbGzEzfByzKm+CCyX++i/LODV3k7k3UHf5ebGAOo+U2fhMlLrLQ3JJcsCSWbIXzN945UGkhria3nsDJk3r91qOuP9LxTiyjJ1oWXL01K9WNSDzJ85r/Kv0pXcqq+I61fxoJMqWh4PEMTbehneyoHZGAiutJKyWdb/zTAiQtvjYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6/+PlPg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6/+PlPg"
Received: by smtp.kernel.org (Postfix)
	id 794F6C116C6; Fri, 21 Nov 2025 20:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C50C4CEF1;
	Fri, 21 Nov 2025 20:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758257;
	bh=RvL2zaYmxj2N2koUfgCRy5fk8k8/fgOMskYVmxYngvA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T6/+PlPgpTX2NvzPnwi29X7kwgmQf9n4U+Jn8RAWpNEBBsWn/H26Fhve8Gp1An6Ye
	 zL/yXG+dQ+h1WDPHXCqqE9+32D57bOVERhipsesPpcT9qIOi4c/zxfN/TOaRRfYrTi
	 hxchZhC6qTVFloQydIDj72E9hYMf+LPZN0KRVZHWEQEERO/UoQg9rgQdU6+5nUlh+c
	 5J/OPScQVgUa5T62XihCokYKUjBzhf+vDlo+9q+5R3sFZdC1DecHOXSJ8GkIGHURUb
	 lhdw8bHYxesqDqKlIcMeZFq0E7/U+bO8YVsMRqDskTNRjN17/uCRKnFFlea5cUwD8y
	 5CBEfdVb9m2LQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BD53A78A68;
	Fri, 21 Nov 2025 20:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip defconfig64 changes for 6.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375822174.2580769.17651379264495241963.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:50:21 +0000
References: <2101096.usQuhbGJ8B@phil>
In-Reply-To: <2101096.usQuhbGJ8B@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 23:19:30 +0100 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.19-rockchip-defconfig64-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip defconfig64 changes for 6.18 #1
    https://git.kernel.org/soc/soc/c/1a263d3a70b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


