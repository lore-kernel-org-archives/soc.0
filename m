Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E54B1F12E0
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078679; cv=none; b=dB+p6G2rcPX2aHTjwFOhzCXbrPnZjgTbC2dPzlLPvIMoLnKj321buACVEInj01hwqcrooYP1sQjd7k384m0sUui3Ff3rp7PuEM9k6t3aaRckup/j5coyDJ3RAF58U3mrrxICG7mExZWPR5DIqVQuTimf80eX8w4GKmxLmnQDPwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078679; c=relaxed/simple;
	bh=QVa3mqjYCoAW1IbrUeDV3RJDTkNvEiQc83cKbqxoDlc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WER2MQKsBldA57LPtkxKpiylOzFk4nqAkTtsy4xZva9edS0TTa9feUZcLT74xdl6beZfysLFu+Bz8uwhLdHQl9FIVwZtEWjmNrfK+kfSFGomZsyqw/WoPqcQPg5h7eV9sRPiTmvkynNqCZwiztAZTGJJupGuXjk3mVUi/DreyjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q3/cJ0RT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3/cJ0RT"
Received: by smtp.kernel.org (Postfix)
	id 42D79C116C6; Tue, 25 Nov 2025 13:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D85BC4CEF1;
	Tue, 25 Nov 2025 13:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078679;
	bh=QVa3mqjYCoAW1IbrUeDV3RJDTkNvEiQc83cKbqxoDlc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q3/cJ0RT+pSLlbwgPuUPAD6V1zB02/Nq+7zIn+QUW6Jua7U5aXv5vDgq3vvrLLGip
	 CzbsaUCvrWl+GC2rQdBowgN1U71JrwnDKcbfyA+772D2EEIUWYJ3NXYyLwol67ab6X
	 Jym59zpVohDBnS56LaAabvUUH7Y6lORd7aJlyxVuFmT+MNVr3ZhqN7Zat782r5mJwq
	 a9FFvesOH5KHJtdlerChU1sdVp922LKnn6JPZUbpogZBgUleWiM+CvRUuH2XtQ4OWz
	 Ale7OAxzQY6Q0H8DS8wDxt6BCtM9IihMJXECKCnbe3Z5Xog4pumHn7IvA80afeVQIg
	 XGnomwm/MWF3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEE13A8D153;
	Tue, 25 Nov 2025 13:50:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 Bus firewall for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407864174.736376.9133040666779365930.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:41 +0000
References: <745d50db-7d68-4789-808a-c5ed88819a78@foss.st.com>
In-Reply-To: <745d50db-7d68-4789-808a-c5ed88819a78@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 18 Nov 2025 09:43:28 +0100 you wrote:
> Hi Arnd,
> 
> Please consider the first round of STM32 firewall bus patch-set. DT part
> for STM32 MPU SoC will come with the STM32 DT pull request.
> 
> Regards
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 Bus firewall for v6.19
    https://git.kernel.org/soc/soc/c/73147be30831

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


