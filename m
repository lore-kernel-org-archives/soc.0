Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA06CA5A
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078685; cv=none; b=O3dFhC8In98i5MrXQlfrofB0H8YHJR1A2hrVl5TwEJQ8N1ao1jwSARp3suvA6Qp/tEtlC7u95DvV/6SeQKxeduIg8MdyIoH7frGxvR4PTzse3UckemQvxOZKM453Do6GIL7toPEuuPhy9q+v8mHqBJvt+3++TCt0Jcaf00WK12A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078685; c=relaxed/simple;
	bh=InJDXbnRHvIi3HFae7UITu4K1mtnf80UqaJk7Qj7vc0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=d1zSoVVPgHrU49PjSd/bzQYYxLUIGG9+hMpu7KAFLXPwQFh7EJW13coNFarczlaUj/3x8CVN/ukAXMwbOLPVBjQ42gqNVBuULKT3ClIVwb3NI+RasDUZRLHc9ynCR4DWZG1pywiF2gOduDjGMr2o4sg7Ahn1N2S0uNYR2A8OyIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bj27eU2w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bj27eU2w"
Received: by smtp.kernel.org (Postfix)
	id BBE7FC19421; Tue, 25 Nov 2025 13:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A623CC116B1;
	Tue, 25 Nov 2025 13:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078684;
	bh=InJDXbnRHvIi3HFae7UITu4K1mtnf80UqaJk7Qj7vc0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bj27eU2wUzFOAu7WRnS/yMF2746Ie1jCVequcPbhAAlDuDXVdqQJ9EXb6PyKoBvE8
	 gr95uP3eXr8Y5VCrJdOadynGoYgJuG354PL3M07ObXFTty1UkPQaAkg2W5mLMaey3o
	 cp+w3xtgezsTHkbleK6yD+OhaazfxCjnFuCIPaeWkSpCbQNBWPgITD9ru4dlA4t+da
	 GGbGklzwyGNaCh8cGcIB4jxmMKDybFRAPK7iZtJRHCwNP1NIB3ZzPk/w8JhFQWrrAm
	 XiIUKpI56Bt26HdrTc17PGVYI1+1m/2kC8GO1HVWigBluGTXmbURRDzteJodJU2jfy
	 glL7Sek2QaATw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CBF3A8D153;
	Tue, 25 Nov 2025 13:50:48 +0000 (UTC)
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
 <176407864723.736376.11172175528411435133.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:47 +0000
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
    (no matching commit)
  - [GIT,PULL,2/3] Renesas driver updates for v6.19
    https://git.kernel.org/soc/soc/c/d30c7cf491e4
  - [GIT,PULL,3/3] Renesas DTS updates for v6.19
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


