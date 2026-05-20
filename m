Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2134534678E
	for <soc@lists.linux.dev>; Wed, 20 May 2026 20:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779308999; cv=none; b=LmMDRe9m770tXyj8nTeh2VnP/1knGBNzdhz4f5yliaGorhGm6srDtVrxVqauSwA/6NnYCaunP4/nLSEF41MxUobcZDeaeOlXYIuEfcU9IXjSDPXOD/NOb279ElBpgm4R9VuQ66yF0l6UIyaBkl2FlBp0qyZtqcy6/1KWjMoAqic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779308999; c=relaxed/simple;
	bh=o+AeD0aboqTcOxQsQ8XhlVqSDNErAmxp+OI3keBGqfg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Aj+FTOVLJCIxGJY+iwzpFqcPVxeG4pTw3xGlBmP/jk0DIpbJ9eX7Syg8gSDWFqKsrwNS2pzXAtep6Hk8J9TOvx10CtHWS2RbuPNiboSbps7EhTY3VmpHCMJvq39Zl+kNfy8oUZu6EZd3prH0oStlMIkgmF1wUoOvnSpEXge1DkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyTkCrm+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyTkCrm+"
Received: by smtp.kernel.org (Postfix)
	id 0549F1F00A39; Wed, 20 May 2026 20:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26971F000E9;
	Wed, 20 May 2026 20:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779308997;
	bh=eZpaIqk3HnWdSxZ/CbXnkHczGVr2NM7/fzNvMSx0RLw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DyTkCrm++62wOs7ASDysWT0zIN2kibXGYdFs2ZsDLHMRhDDOne7uZMraIGnR0MNdo
	 1w/kN5E7ZZr+yELGfYhPB3VStwf0ptzCqYG8LB27l7laezzTcWnP+7m9uSiGckHXYq
	 WAD/V+STOXBBDevFU7rzNP5qrMHfNLbp++MK5DPfTw6jYcyOH3WuMyjAeSbTUqwvBI
	 ulwf07Y9X/iA8rA5K14+gp9jsDhhGenk5u+/PUY+eMsdT0zK9bwNYSqrnzPw11pUZU
	 7hrMvCEXhoOhvOYz2dHFpwE06syytvOLX+LaZkuyqhX9VxGDsDnxOwtektipe24Z4m
	 wk/KfG0klMZeQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 785803930BB7;
	Wed, 20 May 2026 20:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] CIX arm64 defconfig changes for v7.2-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177930900813.3744642.12804365432360806483.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2026 20:30:08 +0000
References: <agE+l8yT5a48G4XT@nchen-desktop>
In-Reply-To: <agE+l8yT5a48G4XT@nchen-desktop>
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 May 2026 10:27:35 +0800 you wrote:
> Hi Arnd,
> 
> Please note: it may get merge conflict with soc/defconfig branch
> since I got below merge conflict message from Thierry Reding at
> May 8th.
> 
> 	Today's linux-next merge of the cix tree got a conflict in:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] CIX arm64 defconfig changes for v7.2-rc1
    https://git.kernel.org/soc/soc/c/1440d446ad5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


