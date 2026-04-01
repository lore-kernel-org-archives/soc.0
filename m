Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD013264E9
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080246; cv=none; b=qeUSs5UdkOdg0PI+iNGyvqkzs/sZk2yc+EPoK1u+nr+3eiLUDGDRjEisdknH0FDwIyCTATeSY3g7k90UL/MD7Agc6Q5rbyR/d1unp/tWUz4rtXeuErbYXB/KH8qQKQAAh1K6x6PMgOu3eY4XzjZ9AZUcp+4wITiZTxnVedNB/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080246; c=relaxed/simple;
	bh=6iw8N8ZdXZKgT6UUq+TtuTKXTphEKP3TjrAwNBhUYB0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OOw7xDw/brLYw1a2Ys7r0AjjNPpjD6iv+wb0rRu69+jLOs9ZO6r4E7jru0RRSx/PDtPcIAYqehEtYW8ay+mUwtj/Rs5hRfcpenQkzKWxvoOjIqbLePEdVJTf6RyZPa858ui2UrFNAIeAarIPv9s+wAoEpEResl+pV6KM3647HoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agDZBM+Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agDZBM+Z"
Received: by smtp.kernel.org (Postfix)
	id 54323C2BC9E; Wed,  1 Apr 2026 21:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8A4C4CEF7;
	Wed,  1 Apr 2026 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080246;
	bh=6iw8N8ZdXZKgT6UUq+TtuTKXTphEKP3TjrAwNBhUYB0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=agDZBM+ZgPzm1emFMneqAwHcAM800C5eOv16hTjYgA6Opw+s51ar1MuZnzmOrWno1
	 6P9r7EFvZRr7kTSXfnzL0jwrcfzwawXtooa+0dFVOV5roiiEBxt2QYy244NRu9DwPE
	 QAifry+E3NGukd+hpYJ1azXjbXuttGpl3e9eBaLCxcEfZnWLe4CQBLChCrzVpOqyOe
	 8rKEYVDzITt5KFxqUDrkM+DSzXjb1iLjJg1HYHMMcadgQjG0GFsPP1e91jtPy5aTkK
	 PD7TTObip/01L4mgStnOenFJYnKMCz0JHbg0WOo9IMMeGVhANeUGe6dMWF342MaRY6
	 Y6sGOumuQWMRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDD53808203;
	Wed,  1 Apr 2026 21:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v7.1#1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508022878.3876275.10443879487971673278.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:28 +0000
References: <6af7bfa8-dd73-4d12-9c3a-b2d62a8e3a38@foss.st.com>
In-Reply-To: <6af7bfa8-dd73-4d12-9c3a-b2d62a8e3a38@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 26 Mar 2026 10:05:55 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT changes for v7.1 cycle.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v7.1#1
    https://git.kernel.org/soc/soc/c/9e17f8e9ccdc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


