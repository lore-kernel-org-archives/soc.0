Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480C9337104
	for <soc@lists.linux.dev>; Fri, 17 Oct 2025 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712514; cv=none; b=cqiZkgfW3DGclk9j0NBV3KKOI7dbovuL+L5Yu4ynlYQE157aHF4ytmIOqLM4p0XkdzRkn/NfG5xsX4Lnye9NuIebTrK8Va24BAjsJPZdzbFdtdr2JDItoH3Y9qsn40nsGyhmOc1eA+VIOApgXoljOsWenCfvdUdGa+E+CzT6c1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712514; c=relaxed/simple;
	bh=KFpxk4MZrg3gF/d7enaydQJEVVRZn8aRaVbnSLlXyAI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SYATyUYo6MLU6FY9CJEDsMV6oh25Sb5Oy4roVeyc72w2aD7/i+bc3wJxUlfYmIz3GThsIHvRQLOTfrWYT4wuHlnbeE2cJK5javRMyjM+nsYZ2pO61lgvXdQbyKnduix7SrXUT91qxxwLUIArxvWIIgQ3Z45VkDEnwX8jgjKy6Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqJCSo0n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqJCSo0n"
Received: by smtp.kernel.org (Postfix)
	id CF81DC4CEF9; Fri, 17 Oct 2025 14:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AE4C4CEE7;
	Fri, 17 Oct 2025 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760712513;
	bh=KFpxk4MZrg3gF/d7enaydQJEVVRZn8aRaVbnSLlXyAI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PqJCSo0nxshS49k2BTr8Qoxf4SN1hfiHU1X7yDx7uphSjE+Uh/OmqeEP616OWttdA
	 sUZH7NNhjGr2J+bfm+cxOsujv6m3NwziTs8Dg1W5uQbJsQm/477UtjTh2l1xQ7TWwZ
	 X7zxY2SL9M/wTgsNmcjBrHgXi1RtT5TR819e2eictLGGHDBGYa37KHiFqZMXupQIkh
	 cYVZ7hwL7sn2G/EnZ43XYG2NlJf7RxmYXjKN5eIZhzk1g2nkNGhh30DmyB/XjcKMsQ
	 du5l/6QA5ks947qrjapLYlGYmU4e0nUrAamRtZIo1FxUy96Q/TkgrV2871IxPEPdAX
	 GqJu2/zoX1U8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDA439EF976;
	Fri, 17 Oct 2025 14:48:18 +0000 (UTC)
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
 <176071249734.2229063.11807529744146467899.git-patchwork-notify@kernel.org>
Date: Fri, 17 Oct 2025 14:48:17 +0000
References: <20251016093346.945036-1-sudeep.holla@arm.com>
In-Reply-To: <20251016093346.945036-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
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


