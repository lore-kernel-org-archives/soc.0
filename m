Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0DF1F4C83
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944242; cv=none; b=OWH/SjVZ5ED1H6sxFwmknDmLdzzU1YajuZNeyD7pkrGJIR/BHtwZ8UYuJAOqkcuR8PDIyNYHE2jhwacb5zNTQUfqRf6l7R0Pq0Ed3gKAv9wE/Hcs4wXBEwKMoFwSjDxsk59bL7/CNKo4NSKHYAZsNhkPKyhpKFtp2bZHXxQOgWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944242; c=relaxed/simple;
	bh=7QC0LYpsTkeuIpvDFw2/hIQzebBazNbOJZf6LC9ZEb8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ivWO4J6t2WGUVz/5yZL4oEAZykwY99KP0PynRkF+ZIJ7dFmvtA/lNPLOyz16zUiQUAFktisV/epMX+ayxJh4YgHQzHAHPXytHz2/5zb6LsyGDDw7jgV/gvPgfJMB7gxTkcuzWTaaa9ODUQs0qJuC3zG2t5YRWcKS+TOvthN2vdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCwcrDKO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCwcrDKO"
Received: by smtp.kernel.org (Postfix)
	id 42622C4CEF5; Mon, 15 Sep 2025 13:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF07C4CEF1;
	Mon, 15 Sep 2025 13:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944242;
	bh=7QC0LYpsTkeuIpvDFw2/hIQzebBazNbOJZf6LC9ZEb8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sCwcrDKO7cRVnhZZck5WWjJMxpsMcursqAtl46ZXJ4fw/00GwuYUxeFaKvNHp3XUA
	 cEVVSryBpETPt7TnHbek7flIjuR3NchP5b3RNflEs/urlxEEj8WMyjd7lGARQnFOTj
	 8Rmm2tzAPjoXdgJkQCP7KS0hc451YUbArk93Gtat+q5h/TREYrPsvmscicIgX0y6mC
	 rV3LFPnQFm0krnlTXW2XOIpsue7t0p8yvFrDc1WMXiH7ujQtEEpTZeC6QlUZJaOy+h
	 AhH0TfWDnw+yXlpy5piXp1QVigJnyOClPduWloFSijJnvLR8ZPNyQmMOOKWy2yNYRf
	 0QA9C8D6a75sQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE3339D0C18;
	Mon, 15 Sep 2025 13:50:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STi DT changes for v6.18 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794424373.4179625.510104772624965309.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:50:43 +0000
References: <4a710c05-aeeb-4421-b3a1-5bfb8230d51d@foss.st.com>
In-Reply-To: <4a710c05-aeeb-4421-b3a1-5bfb8230d51d@foss.st.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 17:34:47 +0200 you wrote:
> Hi
> 
> Please consider this first round of STi DT changes for v6.18 cycle.
> 
> Thanks
> Patrice
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STi DT changes for v6.18 #2
    https://git.kernel.org/soc/soc/c/aa14c3aff06b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


