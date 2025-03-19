Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8419420899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422296; cv=none; b=HowuI+qAahs6ajBhQv26PNsBZwXytRBT5OD4l0bIicKC8yaR0z78+BNgb6R/gfnqf/1uHwXS0epXL6kF1+Wlst6uvjs98nWvET7OIfq9yw0pAfAd9S5Y22V+0Ss699lQxIDqga40jwsG3clraXkt6iKLvURAy/RHBvTjHJoZhEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422296; c=relaxed/simple;
	bh=GLWhkV8XHeE1iJBU73Wf3SoHAxWG9hvYQbmw9smXCOg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=REouELLon0EW9N2paGuxQiNuMJD3k1DOnga2yOdns5vKvgn8rE11fDbwbXMHj6/+XSNOCcjybCKjMbsHl/zFWfAxK4yYCzW4ivmaCTkSl6vQ5KIivDXK0MIgKLltAbUC4FD+49DoSzBZeQiDqDVq6nJaqS0YHZ6MtcpNzBw0Kco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUpfN779; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUpfN779"
Received: by smtp.kernel.org (Postfix)
	id 16C08C4CEEA; Wed, 19 Mar 2025 22:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B79C4CEE4;
	Wed, 19 Mar 2025 22:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422296;
	bh=GLWhkV8XHeE1iJBU73Wf3SoHAxWG9hvYQbmw9smXCOg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VUpfN779RC/T6KdsbFzaZfwjelDjjG7HnOHrpglT5M0/SHRzltyc7nYtS22BocXpp
	 nqRt1Qd1ZgYDjEi53fwb/wRk9Im7SQXeHGkk522vuptEHttIF9DB7Hng3rzgko5vI3
	 r4Sfb8haL3+qIhIILylWg0tJr+LVuNbxARac9ltweKTUE8zHYRfIP/2p6SfyotIB+Z
	 mCDeCSb9UXIzxboHcTGxoIfL07MNx5HtWtP2WBfjTd8+bS4NDxKV0cSLMyegRzlJdC
	 +JQGujXYJ8U5aXXEDQgEyY5SPLGWCXz519ry2Wje+06s7/BQdEvhA0CebicPy5LobA
	 khv4rh/PIflXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACF93806654;
	Wed, 19 Mar 2025 22:12:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242233149.1211847.400595463610872578.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:11 +0000
References: <PN0PR01MB10393CEC71B623E0A779E7393FEDF2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN0PR01MB10393CEC71B623E0A779E7393FEDF2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Mar 2025 16:43:28 +0800 you wrote:
> Hey Arnd,
> 
> Please pull dt changes for RISC-V/Sophgo.
> 
> Thanks,
> 
> Chen
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v6.15
    https://git.kernel.org/soc/soc/c/43adf498e91c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


