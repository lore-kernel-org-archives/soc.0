Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0F62F0673
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163436; cv=none; b=F5ojJYJrRHuX/Vd6SLxPbUIwpaZUCr1dXbMYCMi6Bsx5YLJIN+yRZXKNZbFdzwnmsL1ryZtuH+yzKpIP65nnytBkRIpa5kBOkHaAKUEIYYS4Mxgv4+hhRxbIaBopT4+axdsOAfKfZLFvbmXpr+2vmdllNudOfBFQxrBmx3Dbjt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163436; c=relaxed/simple;
	bh=oGthjrFhu8sRc11fyUufCke/eDwQuhLjP67vabFTaDI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bPOOwjnlHBQZp6p1EikeMjscFdWW7PB9JLoNJxo7/Yueko9JK/9a1X9H+YqBtV/2+Lgmt6Mj9ALtNXWQnuV6h9BsFKmSUtkbYNo1DBCLb+M1WNkcTD3iTH1s+egpZLRUMaZ0d6LadTIxrM8bxJi8fbD1ReS0RB4dr16c4J1AQtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amDEWKpZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amDEWKpZ"
Received: by smtp.kernel.org (Postfix)
	id 971311F000C5; Fri, 16 Oct 2026 15:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813401F000C4;
	Fri, 16 Oct 2026 15:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792163435;
	bh=xbjv2Zmo6kqy1RAEgcinqlYl7tC8YMOP20Av1UKc+uE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=amDEWKpZxyelQ1vNnlQ5ZzfyCSyRmze+U2qyw8G/BHdkdVkAidueU9pG/MnorBAuM
	 4nG2Dcb1UMNxp58juz4yB3rKpn+7ww1ec5P45xBK+BjyiZCceymIvr9kHMDk4MsxZV
	 tFHkF0ZnETJCsDBnBHfE8CFdaPd4IF5nzbmMWZTP7Nu0P3bDb7uBO3JYR2on0yt0za
	 I599rlCWG1xT7ZlhRiqLdDvp94YTCJa5aXf2ZwHppT8TeBt6sljos3uwOXiPwJjw41
	 XeMfvZw0yDFw92OvJVlr2oJ8DWiCX7KoeTdgBjQ+yL7zGGiotVcL0V8f78oUe5mhVt
	 IlsU0wSGpb0jw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77473380A966;
	Fri, 16 Oct 2026 15:10:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179216343401.806834.17954367170210159751.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 15:10:34 +0000
References: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
In-Reply-To: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
To: Chen Wang <chen.wang@linux.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri, 9 Oct 2026 17:23:58 +0800 you wrote:
> Hey Arnd,
> 
> Please pull this dt changes for RISC-V/Sophgo.
> 
> Thanks,
> 
> Chen
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v7.4
    https://git.kernel.org/soc/soc/c/5d299ec9395e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


