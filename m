Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A92AD37
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 22:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281597; cv=none; b=C36VR+a1Cd/Maw4V9bMKig4BiSCe4KavXxU8/U+GqyixGd1T9a5VYyBqTML1Jg+KWZASO3a3oRFOqqX6/5EPNt7oJekfUhX8A9RmUKaMRJyr8kfZFxPN9mvLpXhkbKEfhHiaSz1R1984VxEIpadcMMleHfJbldvZ25y552Dub7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281597; c=relaxed/simple;
	bh=ZaeZfk6vIVoKkb5fmgi46Td1NrJ7L0OTsr+rfq9CSMU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kHyMUj/1PQGBztxcpw6qAzbTVdypeV3YZIWS03hshOyiz+wMRvtZzsv2E1Y4VsR3ia8ifcZQ/MICDA0CzTxAkAWkBdMh6iRAnkKBL+8+BalpFPoGYDR3E1Yx4mK7B35PHPUm1YARM+S89PfRecd9a9Dm6TxXppaSbriu5KNNR3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRDQuZ7X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRDQuZ7X"
Received: by smtp.kernel.org (Postfix)
	id E6EC0C4CEFB; Thu, 27 Nov 2025 22:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B2BC4CEF8;
	Thu, 27 Nov 2025 22:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764281596;
	bh=ZaeZfk6vIVoKkb5fmgi46Td1NrJ7L0OTsr+rfq9CSMU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IRDQuZ7Xh9d0GpXTQu0BMhNZK++f25HLoXyp085NNJIaNTH8vlBxKdAkc7Zcbx5nB
	 ABlo3Ebym19EBGIyDPckzGGUe7G9SbthrgFJdxxXyUXYgi3/r2FIrVVsCbuWGJnuvA
	 m+PeLD93jhuGm8sjmnD03zQ2BdiPmOZQoyvROcNPtsH3qN6KcQLPkv7wzHYOU5vCoL
	 9HOWwpc/4iQ7RIk62tgn0Mw7LwOhXHSEjIrCdrszLZwEpFOeckVEEMd82JRy9MCcgl
	 JR/Z0ZaX4zylQhOa0jIlIbwzv7QhvpCYJg9Qp2HcEVMVm1RAK9apIt0l7cArpbSayL
	 gcnQ2AqNjJVdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 786F43808204;
	Thu, 27 Nov 2025 22:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset/GPIO/swnode changes for v6.19 (v2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176428141927.55019.12170174983637717039.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 22:10:19 +0000
References: <20251121152802.3619853-1-p.zabel@pengutronix.de>
In-Reply-To: <20251121152802.3619853-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 21 Nov 2025 16:28:02 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 5fc4e4cf7a2268b5f73700fd1e8d02159f2417d8:
> 
>   reset: gpio: use software nodes to setup the GPIO lookup (2025-11-20 16:51:49 +0100)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset/GPIO/swnode changes for v6.19 (v2)
    https://git.kernel.org/soc/soc/c/dc567f36f9ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


