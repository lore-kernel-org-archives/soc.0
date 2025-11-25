Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32B9238D22
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078667; cv=none; b=IGauPjIqfkguPAqjBljFVHim4u+cT7tf5zaafB62CSKcsMO/hS445ijmAsx8VOwvzZ2IpGSquc7PvsvO6AJrfZDDACIYIAXiR2tG3/+pgEbZsevXnWxj6CiMqghr2rN9IHPqKC5RfJ0B7NNyp1RPux5v8HvRpkkBgtJLnLUwDK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078667; c=relaxed/simple;
	bh=JSlh8hmI08O9uiYkYr0ygz5J3bTZKW05QUj/qJBcMGo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IdJAOlARnLf0VvyNqaIWFZXauPy6k7eTqlHpaq2i3P8mesq+CVVinVANThZb69ekAI0zxMJj8hAepHZUqO/gWWZgrRITwwVB3jGadtdRTGiFC71mjC97+9Vk6xmnHVIlSmxEY0SljwIh1iJ/GEzQdPs0ztJVMnYu8KI6icD658M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZUynQ2e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZUynQ2e"
Received: by smtp.kernel.org (Postfix)
	id 7EDE7C19421; Tue, 25 Nov 2025 13:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69755C116B1;
	Tue, 25 Nov 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078664;
	bh=JSlh8hmI08O9uiYkYr0ygz5J3bTZKW05QUj/qJBcMGo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bZUynQ2e0LAaVevEvKL784WK+KeEaVvoywo6kECDKfBDgnPZ7xhSq7ElMajFDM4+0
	 iMTOd4I0X4V2tPjP6Udx2J8wcMM3+wUFpvUk3nciVgimF3mH3ssSJLf+k9gIC5arV+
	 m3rw6kpM/wunb8inQRhVfmFy93/GErV28XDgYRBOHHrMtqEbmj9toQqsNdlAeBVtK+
	 9vBp99qgj2RtPS2PgqD64hORbPvAwOEh638YqSht6pRR6CPk56Q/sRM7Q/JyHVymFW
	 QGJvqme2q2BTF0i9qXBv9YMbpmnX6XPyEuhkiJjhqd0aEwidH+Q3YTOxq57YaE1+c4
	 0ad1c07nnrbkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DCB3A8D153;
	Tue, 25 Nov 2025 13:50:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.19 - replacement pull (v2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407862674.736376.10928953125583077799.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:26 +0000
References: <20251122143409.68115-2-krzk@kernel.org>
In-Reply-To: <20251122143409.68115-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 22 Nov 2025 15:34:08 +0100 you wrote:
> Hi,
> 
> This replaces previous pull request:
> https://lore.kernel.org/r/20251110173624.3127-2-krzk@kernel.org
> 
> by dropping Tegra ICC changes, because Jon [2] reported regressions and we
> could not solve them within reasonable time.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.19 - replacement pull (v2)
    https://git.kernel.org/soc/soc/c/bcae4697695c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


