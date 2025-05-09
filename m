Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235DE244683
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826790; cv=none; b=Xq6ijiul4PxHC4Lh9CefTKKlVeNJHhYoD+hpcPjjzi/QxWFrtn5QlBYUm+3LEGcFRbDamu4BdheHgiVLnsXKsvPvej6Dq7j9lh+heuZyw98fKy0bxAs9LbxJOabhsBELkn/ls89sMz7+uZb/r9K46w9HKTlzpwxTrBA50xHvaF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826790; c=relaxed/simple;
	bh=OkedoHQjc5K4sDuH1le09RE7ulVlV/n+y33xOHmllrg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JEZ+HEpTHVWo5fn+7U6HgPW02mxKbfIBqYuRbsZuAPYlpGLEYsE/zEsFn+eXetLPgI92zD0n/sHIca23+WL3mYe9yI+01OUa7TYO2Cw7Toaarkvl0MIagwEvdiI/bQUdfr1gKDRqU0aSgZ4Ryr1GQV7TxRivuW/5Zu3W0lilLno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2zRG+wf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2zRG+wf"
Received: by smtp.kernel.org (Postfix)
	id 9EB2DC4CEF2; Fri,  9 May 2025 21:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89721C4CEEB;
	Fri,  9 May 2025 21:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746826789;
	bh=OkedoHQjc5K4sDuH1le09RE7ulVlV/n+y33xOHmllrg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=X2zRG+wfB0TfiJeAVEAg0oti4qOpSl8oZybubaU0ptS9I88K+6Q5Bxl5iz+L8T/fO
	 0X5XQU3ILyYGlUT8VSz4fKPRndg/Oa4BfoUH/eKx/AFUKr3n7i5b0iiYwwpGTDe9B3
	 pXULAE/pOZrIYoIK0KTOPLaXXrGddKUUP2S4mpxaYW8dPZSjIWH+hXhcg/2ufuLOSD
	 5tQR/BWEst8xcni0e2ZjCboGa+VcC4o1lr1iiduIDzfppt1UV5xfukx6dkDON0p+k9
	 kM1khP7YtG+dFt+JemrhA5eIHupBoCdFDeuKXHEfJ0HAAbPPC6OIRwoZmBuCQB/qXp
	 OU+K+QmpR8qng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D2C39D61FF;
	Fri,  9 May 2025 21:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: delete email for Shiraz Hashim
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174682682800.3820180.7047060250332943891.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 21:40:28 +0000
References: <20250331190731.5094-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250331190731.5094-2-wsa+renesas@sang-engineering.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 31 Mar 2025 21:06:42 +0200 you wrote:
> The email address bounced. I couldn't find a newer one in recent git
> history (last activity 9 years ago), so delete this email entry.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - MAINTAINERS: delete email for Shiraz Hashim
    https://git.kernel.org/soc/soc/c/3238532ba55c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


