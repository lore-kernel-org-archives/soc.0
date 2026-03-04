Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28DA272E56
	for <soc@lists.linux.dev>; Wed,  4 Mar 2026 21:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658046; cv=none; b=otdYmNu+kcN54brvfECqFLIkcCd1ie2sLZcdq9hPQ1CZ9bYbmQv0ZJMwIiT4CmHDGlbU8ub7V0wnLrtXWX63MhkuKRgoVZbwK8acSC60VKNLPERHkOI86uvME0tNOdnbyFsrHBVlDKW+oNh4KEz4g1y2VM40U/5al3zY8UTxn+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658046; c=relaxed/simple;
	bh=y7CK5POFAEgC1HlE5I3vfD1n1LKBeH31zVK6x2hgUx0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PlXXEGnLtbtajTPaIE1CNFPR9Sywxzqc2bpj5a2BeXkhy2cw+HluZXxggOQLZPx0ccWh0W4BJ7CwESMWw2Q4BJTUMKr6vY1RYxdOCKE7sL0I68hz7aNglzgnK/JxitlBI7bvEGFj9Azj7xgl+YNNEQLbMKgNu5u9zi1Y7YXd8q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5g/kF0O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5g/kF0O"
Received: by smtp.kernel.org (Postfix)
	id 9FC05C2BC86; Wed,  4 Mar 2026 21:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E2EC4CEF7;
	Wed,  4 Mar 2026 21:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772658045;
	bh=y7CK5POFAEgC1HlE5I3vfD1n1LKBeH31zVK6x2hgUx0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=P5g/kF0Oy3pb2cSClUhr1ckwWnjbCNLqu7naJsyoGiDwg7FGavmfR2TPrs8bkGid8
	 akireIkj8sUWyaQlBNg71eBPq1zZZztWuXmiYZsTthfYuVvTxWjlj0uev49Af4MGBO
	 8I9DCJq69stpI/oriScThdyzLqwX7GFjZoGBzDZDT/HBZ8Tv81HKNV4KSgqyu4HW4k
	 HgZowJgvxHVEj4rcVZl/+prp3LJKErhuoxnSG5a0ZAnHYKw2JwdYfLxpfFANcdJAfY
	 DqYPPsn6CCcLa/i/BEgZRCQyE0SMmLa6sae4RuQQVJtnW89y44dm/yRJwx2WgWG/Ob
	 LOjr00vJfsdKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FF1E3808200;
	Wed,  4 Mar 2026 21:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SOC FSL Fixes for 7.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177265804605.2385795.12510176579358930958.git-patchwork-notify@kernel.org>
Date: Wed, 04 Mar 2026 21:00:46 +0000
References: <741919dd-743b-4f6f-b43a-8a107fd31754@kernel.org>
In-Reply-To: <741919dd-743b-4f6f-b43a-8a107fd31754@kernel.org>
To: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Feb 2026 13:52:04 +0100 you wrote:
> Hi Arnd,
> 
> Please pull the following Freescale Soc Drivers fixes for 7.0
> 
> Thanks
> Christophe
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SOC FSL Fixes for 7.0
    https://git.kernel.org/soc/soc/c/4bc732b00a9f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


