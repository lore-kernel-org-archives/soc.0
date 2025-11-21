Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21CE275106
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758258; cv=none; b=It0bQvDq4S1ZddnhTSbSsxN23683pr7sFR8r89GmdiwnAHkcHlzPFqNBWufBJRaCgGnQuzqMcm+Cf4UYADy4K3tVv73Pnp9N+0sIo2RnQ0Zwc3yOJHzvNhMRlggdJNpxvPV3LJzW4vxWRspyaHaxqHhqEHD9vIWAh3bTQBk/mRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758258; c=relaxed/simple;
	bh=ezUlqgTA8I3k9jvFL0M4r3iS1SqdNpFyfo1wD58n01U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YP0pj4UKQ3TFg1APMLBHvx8MVc6OpHRKeGKZpmK8z6OqDHtzTQxg6w3lveiUIDb/nlXJTgl7OYqsphN8e6GdV9XXTbhQpYQNEGHlArzmU1PP51XBo2ScrmKkFkOUfWa+g39WrL6988BqP3fHAei9ENoIucI5ZJhPd7g+A1QvMOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEY44B+2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEY44B+2"
Received: by smtp.kernel.org (Postfix)
	id A915EC116C6; Fri, 21 Nov 2025 20:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93827C4CEF1;
	Fri, 21 Nov 2025 20:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758258;
	bh=ezUlqgTA8I3k9jvFL0M4r3iS1SqdNpFyfo1wD58n01U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oEY44B+29IioXCzE0xIl9Gb2vBGqrV0XF7xx26nU14HIvUQaWCEmVqVvgcZoBgQGg
	 tY/fqh15DUmbl6TZTsLF4VyaU654npdtj1xqMxDW2OfFJrl1uOiF7AQ0zkOhyGHNrW
	 Ue/XsS/SHmqow+M/qZtCzwPLIyl5tomU06aMImnUo9HMhYayku9a29k+aVCKr9lNDh
	 LJugmyN3WucQT+VjawienMdNhZUP4raEEVuyySylaKz4/oytLxQM7Oli0aA4I4A1A9
	 oBou6FYvxrQD+6GtTtq+r/nPMEUQS02wjC69uhPdjQNe2r2UMd4VjxwPufsowMjw/T
	 XCKVulVO73roQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CA63A78A68;
	Fri, 21 Nov 2025 20:50:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375822323.2580769.10359255741477085964.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:50:23 +0000
References: <cover.1761905410.git.geert+renesas@glider.be>
In-Reply-To: <cover.1761905410.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 31 Oct 2025 11:43:29 +0100 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.19.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.19
    https://git.kernel.org/soc/soc/c/24a979a1fec2
  - [GIT,PULL,2/3] Renesas driver updates for v6.19
    (no matching commit)
  - [GIT,PULL,3/3] Renesas DTS updates for v6.19
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


