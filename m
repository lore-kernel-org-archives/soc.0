Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D436C1F418D
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944249; cv=none; b=GCRHt9W8O85iPZjLXClpslBz1PwHGtsDyt/xTAx5CfXDzgprqT2z4q/aKROf2duZh8fBTqFZthJ0Uj3fwSslI5d2UeaX9cLhNYWcgI6a+5eyxuBDZAmRSGd5JzXJ/4WMG/ec5uGVksWuYjInllOSwtxSNUxzVc432rv5uMkvV70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944249; c=relaxed/simple;
	bh=Bfb3Pt5/vF4xdLcda7/jTr4kbMRhr5MbKTWnDsTXBnI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=j+a0VTE1Gw/Vo/k63asGYCKytl9Kn8rP+KbHdffXd4OxQ5SAyQCvcjoptY+B3GJaIIjFZj0fcMQUUOr8XsnA6uqMIK1edbgsrPqV0Xvn80DLVKcTrZrkbg/rJMEb/t7VdPd6jQMyhKWY5JoaeTMS2AewHIqE6yAQyyxaUbToqzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IW6k1oCK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IW6k1oCK"
Received: by smtp.kernel.org (Postfix)
	id 89868C4CEF7; Mon, 15 Sep 2025 13:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D5AC4CEF1;
	Mon, 15 Sep 2025 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944249;
	bh=Bfb3Pt5/vF4xdLcda7/jTr4kbMRhr5MbKTWnDsTXBnI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IW6k1oCKm/Eb9Zwdp/BUgBNulDD5oirjnFgIFDaI6fiZIqxlzsyjcJMhCszFCQiwZ
	 roHE3XoQyNYuPMh6ZhQqw/0oFPbafmQUbxEdhCmsTH0Qxt90DaLtKxa1hIOQf47qgI
	 USyIry5ha7XCcMq0X3YKJT635AFu2VGCKYlFVIiMWEChCsPnY1kl6U5WFktZ4dL+YD
	 7Z+letJ7EFNOD7Sa8FY6S0YXZ9ERd0nemznZW36f02w3YqltS5hZY6br7akn0sNF//
	 ds+w5r1nNhrDbj96JMs0FGnQWxLcjMi9OnHY5eyA/AO4mQz7EGpVdH0cjL/68EdPMg
	 kXUIRR6lwd//A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C6B39D0C18;
	Mon, 15 Sep 2025 13:50:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794425098.4179625.6830331313574601498.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:50:50 +0000
References: <aLyIXR1G9DUzwGWc@x1>
In-Reply-To: <aLyIXR1G9DUzwGWc@x1>
To: Drew Fustini <fustini@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 6 Sep 2025 12:15:41 -0700 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V T-HEAD Devicetrees for v6.18
    https://git.kernel.org/soc/soc/c/48c7bf3ebd28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


