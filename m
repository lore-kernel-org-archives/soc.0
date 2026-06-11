Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6C332863D
	for <soc@lists.linux.dev>; Thu, 11 Jun 2026 21:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781213411; cv=none; b=lLbcPWmz26zoZiQwkL2fAnxmPkdybbLT+88EfozDx5PdNSU/uYk6kB9UQuwqqkmj0l5/sRXiqRXuxXgIaOK97+SBlYSVLD6/JJbhJlFAO8dh29ic8MRkolsioRWz/xgmL+zyyRaauCb2yFsUW+I38K8u7rS0b6r7QEQBR51s7CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781213411; c=relaxed/simple;
	bh=GrfjV8uWiMsUxv/uKifa/2rXzTQNnioLd2oTj8lDQ0c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=B0jCVSQyfmqmQhM8Zc3vLN8G2nK2pfUjt6UrLmnrcVoyDWjmQ72Sncc3byQbh6x3P15mrTT1NN0vgAGcSpDQhQXWZbVtsl4NdC1z6V2wt5mBUKsTT8s7g/ogEDO+6bsyGel6adngtWFc11X4+ZtN50TBl79reGQqhISCilJs+s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdHpanY5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdHpanY5"
Received: by smtp.kernel.org (Postfix)
	id 3EDB91F00A3A; Thu, 11 Jun 2026 21:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E3D1F000E9;
	Thu, 11 Jun 2026 21:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781213410;
	bh=8wTghSR1nxxHIDHNFjZMQIvPbtbfQHcnH/uz5C15E1Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hdHpanY5Suh+lx67p5anYZ4LL74SFJcGgk/wQDbfh7S2t7/b65f2ncjk9JLKApg8k
	 PhU1tBNzFd2xqxznfziaGHcAaqjOZk+neIOWeAbifO4sLjWp0ax4Etla0oVpVNSYQ3
	 sZLGVQAj5K+EgRPcOg+MtVdPhF2yaZ8juhil8TVjSYZIvwhFU2FDlqbrvgQwinTGBZ
	 clRAx1++XekGtQJbpVmRFVXixAwUhVisNmlF/sQk1ImAqww9QuNirRQb/qzvgznuZd
	 tDIbN42QWfvSZLYC1ggYZVX4U3+LMIp0U4tjhCn/TlbSgYJlahkWsBVZ/YrThmlHVh
	 QXELrs6U7WPLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939C93930FAB;
	Thu, 11 Jun 2026 21:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX binding (display/lvds-codec) for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178121340714.373642.11087801768650081010.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jun 2026 21:30:07 +0000
References: <20260611144912.3860262-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260611144912.3860262-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 11 Jun 2026 10:49:10 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX binding (display/lvds-codec) for 7.2
    https://git.kernel.org/soc/soc/c/74b1b75a32ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


