Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03359188915
	for <soc@lists.linux.dev>; Thu, 20 Mar 2025 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742490608; cv=none; b=erehWzHrJZt1WfmJDivOcfuUdyypzlMEMJEYeQOdQIJdvsZWY9s64vS9d1nbqTS93DHGzWql1sichvir/sVoQ/EyLaBZErSDnDkTORrhBBCVSr+V6FT5lr7a0wUHdWJFyWXnid1dlZkd3HG9PYPfjMRSmqaw85ETda2zuH04i4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742490608; c=relaxed/simple;
	bh=JO/Kl+yMU/OLygWJbeHhQNz2q5Q9amGroDj3N8Xd8+E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BU7PxRVIMsRNtw5WE+qUhvXiyUHTC86tIv0OS3uY7gr5lxEgHklImpRi/TM4XjGG7f2rM59Mvcdiv/bLKypSN1TSnerXLkrrsv+JUV0wDgKRJZkOl1u7+ve8tTY7U3E6gU0FIea9AFXwIF9+JYHPh2WdHqndwsSjZOJofbfJwcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8jIuX2D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8jIuX2D"
Received: by smtp.kernel.org (Postfix)
	id EACDAC4CEE7; Thu, 20 Mar 2025 17:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4991C4CEDD;
	Thu, 20 Mar 2025 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742490607;
	bh=JO/Kl+yMU/OLygWJbeHhQNz2q5Q9amGroDj3N8Xd8+E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S8jIuX2DJcBQhDbi5Ur5p3OOESFX27mrJzr7b80r/upnSuXgNC4/xg3oO4oTzqAsA
	 bOAbqF8cOp6yWy1c4/ePmLYR4q5D/dyQpzaZWu8y9GaPypooDAa9mA+zILSRNf9xfG
	 RWxtmDzZaCC9MpkjHdWEppuWiq26XHEMygbxnw5NOZhZDSWjMmCP80swCJ30Lw1qcy
	 VAy9JmsMkDHZq1am+iSF9mdO5zE9JyLRK8dQ2PDQHMJVwWgugDfByUFRVcDb6s2g4X
	 5LUe3tOn+tRaKKjIUnMhqiaMPoWe8bdz64N6uV8jfsj5JQ6dJFEbJGWZsOTufI3Rfe
	 Wf3wNrj6sfimg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB3E33806654;
	Thu, 20 Mar 2025 17:10:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM DT updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174249064351.1843567.10896240273687224186.git-patchwork-notify@kernel.org>
Date: Thu, 20 Mar 2025 17:10:43 +0000
References: <8632a8fa-7af6-4fb7-ba87-297df4f084f5@linaro.org>
In-Reply-To: <8632a8fa-7af6-4fb7-ba87-297df4f084f5@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Mar 2025 17:10:44 +0100 you wrote:
> Hi,
> 
> Here's a simple changeset for Amlogic ARM DT to switch to the new PWM controller bindings.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM DT updates for v6.15
    https://git.kernel.org/soc/soc/c/b82310b5729e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


