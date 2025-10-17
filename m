Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938B32C928
	for <soc@lists.linux.dev>; Fri, 17 Oct 2025 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760711744; cv=none; b=pxtQPSvwjQMTRBUnXFqtxLTu1+hhu22fyTsipdyET4SLIam1vbvHmLn4bk392RtMx2Q1hS+xQIeyQ/i1M6OlyDHzm3sB1ZsAJG0IQhtwsndLsFnU5QwRwerFVr3F28kuc8XpF6qDIuiAYBvhRSSMiFhs2DUzR7jfE5iuIotZdv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760711744; c=relaxed/simple;
	bh=/Xxc9GHdevxiCR+bKaDZu45W9OaHgqHbwjgBB51Nd80=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=N8nIly1WT7Fp0gNS566yKAhw2Yxbmn8ie9zQ1uQ06rcgG+q26lS5Dmx6GnGQWKypVjrzNOL2jK4TVk03sf+Z1AGlFe3g0eTJwci3RC0xdWxBn0GFpHy9jS0YIDoJXs6lLtWshjMIepwPsAoaj5hReRLdGxE9o/UPFoPDtIaQ0GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FiWdzoj4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FiWdzoj4"
Received: by smtp.kernel.org (Postfix)
	id 1464CC113D0; Fri, 17 Oct 2025 14:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F076BC4CEF9;
	Fri, 17 Oct 2025 14:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760711744;
	bh=/Xxc9GHdevxiCR+bKaDZu45W9OaHgqHbwjgBB51Nd80=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FiWdzoj4w/eoZhL+gcDNYoNmMtUCQjeDVs8PWPUqKnx9ghGB7aZkYdZBmaDpgOkME
	 90nTSL7Okg4T9/GSUBXmzJesAlPT47i2NjICISN6pkVePBRyJSO0W/tfS5NbTmNLX0
	 kn2sxAelzWv3ve5A/C3ONQV4teNaBgUyYT7/T48nG1vDAfN/IVOwr4ZHfA7B4K0laP
	 q5fXE89/Ei6acoaG2gz3ekkfmYKyVOehioQqSpvJ2ZX5inNDLL5eYrmOwxNhggFc2w
	 k+blPUHTVrr3heiZb3mO7aWZJ2wba7VJleNNxAdLTnVf4PLCy9Jbzay2WviJlgoEDU
	 9x26Pylint2Xw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE2939EF976;
	Fri, 17 Oct 2025 14:35:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176071172773.2229063.264763684427657946.git-patchwork-notify@kernel.org>
Date: Fri, 17 Oct 2025 14:35:27 +0000
References: <20251016093346.945036-1-sudeep.holla@arm.com>
In-Reply-To: <20251016093346.945036-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Oct 2025 10:33:46 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Fix for v6.18
    https://git.kernel.org/soc/soc/c/03667191cbeb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


