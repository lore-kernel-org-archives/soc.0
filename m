Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556CB381EA8
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874873; cv=none; b=uPC4MNeDRcHmPJP5kGmcp7OHT8FJlFAfC9voLuEHPk6/3Jx6R7eMQ1iH38LOREJWgu5RJiN4IpvH7qehE+Y7dCxXLKuZeCnlqzWBvR62CaP58yWUipIOfiXWKraCSiz7fdZMOZmXL5fTOMhlu0X4FWIMNRbuZw57O8BF8MOiV1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874873; c=relaxed/simple;
	bh=MtI8I9cD4oQStzK4iaY+s6Zcb1ZlxZIwEaL+pYSDVRg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NSSoOZ7A7KYBRG/xAEr+LlbHX9me7en7fBizpIKliy+pll7TWONnbKTsK6AjD2ygBy1297RJN54YOXMdkHL2+owX5l12NMPu91cf3eabGjU0OE5UUgo+htFgriTufGydWPP6XHuXTqwBcBuIro1ZEJkkevg1eUgrzwKwWPVHgfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UE3PxPxh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UE3PxPxh"
Received: by smtp.kernel.org (Postfix)
	id BCE481F00A3D; Tue,  4 Aug 2026 20:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74A41F000E9;
	Tue,  4 Aug 2026 20:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874869;
	bh=WKVldjwltUAMJxNWwk+wfddkW35SunYdEKMkAoMzYXU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UE3PxPxh8adOD3dKQ5ZQhXkTf8cfiD7zewdJrTGE1c5jW0T4jCcrWNvZR1MCAe5WP
	 wWvhmK5OjkRlH4c3Q+5zf4szRwydmiZRrmtvOONSf/ehsidhj1iwY/IeEhODXmot/q
	 LHYVFLaXJNp1917tRIUIyMdqEzqtJOCX1Ia9SwtuziP8idUZgiDs5YNg7cGj/AmMs+
	 ucMcaAEDIvPLXgxJYmc4M6t7yc+rhTnGSzXz25/MqCmUqTptS5vo8W6X94AydtfaPY
	 0MHEivok+AbMTeQo3cHcOEYNyCHVo6lqQcNbHi+Gckmad9ip9PF5lF4NQ506pA3v1l
	 g60Ng5KUneMgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568B239263B9;
	Tue,  4 Aug 2026 20:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Amlogic drivers updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587482988.3769923.17790587871537806685.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:29 +0000
References: <41698506-1585-4b8d-930e-91a79b58b833@linaro.org>
In-Reply-To: <41698506-1585-4b8d-930e-91a79b58b833@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 31 Jul 2026 18:00:23 +0200 you wrote:
> Hi,
> 
> Here's drivers updates for Amlogic SoCs for v7.3, mainly fixes and new
> SoC support in the Clock Measure driver.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Amlogic drivers updates for v7.3
    https://git.kernel.org/soc/soc/c/484ddb357c6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


