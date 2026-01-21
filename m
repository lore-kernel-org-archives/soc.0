Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6802AD03
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011223; cv=none; b=NFOQQXxMqUPjaBj9z4iB9X8PsXi/eITafD8U1NFx3CKLVERzARhxOEQpNeQKxpmMCbnVm69gQxSUUsUyAFDes8LfJsryTBJi/psUIyqd3iVYrsRL3HVVBFHcnXa0DrJAX0AcxmEc5g5BokMHLMybZo7DtwMQZPCPH4g7tb0dJdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011223; c=relaxed/simple;
	bh=HWdpd4V4fa+rRsWyEKbXN7jLOYhc/N3j1JzUFWGblEc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IH/o44I+eAbapU69Xa39ErgS+Q72gUMlMuXmru0dtBbsYeC4s5qtyxp5agvwjv7dWh/oLUPgM492xj5ZEzc1Az61EEPyQD4zfw13s+EkBZM/5jAczRAn7vMKvOvdpnkKNvG+SHUIWsltl6TwSFBxcloqA1P/rMke/h6PY6O9fMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0rCGF1d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0rCGF1d"
Received: by smtp.kernel.org (Postfix)
	id 948ABC19425; Wed, 21 Jan 2026 16:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F04BC19421;
	Wed, 21 Jan 2026 16:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011222;
	bh=HWdpd4V4fa+rRsWyEKbXN7jLOYhc/N3j1JzUFWGblEc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s0rCGF1dkeFl+tzS5PelIuXOJ5JPJRfNrWFFIDOxk7j/szjXselKnCGaef8bdmS74
	 XJRx/rq+4e8BYV0AHq3PxrPkf81jg0HulXbB7IPIw1ZkyoqGYrLn3XGQqFobkJVDDW
	 jW9s8v3kW5e4Wz5eoeFN3cM9tH3TY7+NL8blTi4scuBVPN9K3Db52eN6+BxEqOHUID
	 +fz1ePUABIzv/rwlVhAm8BmwiuAdlvJkv1jvZ93W2R2qPsrkE1N80nhUkcJkg61Acm
	 BtUTBt5HA/sLmLz0ZfxXJYbMZ5zmOYla+8C+33xtUIBU56rxCVj/BB4PbuvRrpF4qu
	 ypuyTG6WvsJmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8A673808200;
	Wed, 21 Jan 2026 16:00:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE sysfs for 6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901121959.951664.10277148737875621152.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:19 +0000
References: <20260117124413.GA262260@rayden>
In-Reply-To: <20260117124413.GA262260@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 17 Jan 2026 13:44:13 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these two patches adding a generic TEE revision sysfs
> attribute and implement support for OP-TEE.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE sysfs for 6.20
    https://git.kernel.org/soc/soc/c/ee5dde7ed6ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


