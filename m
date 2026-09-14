Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACCA48822A
	for <soc@lists.linux.dev>; Mon, 14 Sep 2026 15:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398681; cv=none; b=CJ6TvRS934bvHL9EdPhiD1v8pnD91N50orvIaeYcBvLj03wmT8dcEPA1yTOzHDc+Ru//+r+eQbKx1RzPePBF1phwq6iaBrU5saHn8F/9MkRt22gn5huli8VVmSq1xohVCTYGkrK69Q8kMr7stQGT9W6qZjI4NH7Zbu4wb+yaNgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398681; c=relaxed/simple;
	bh=xTYHsMpPV6laN0JmErRtaWDzoISesoN7Xyq2RMPvumU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SkSIkgw0cVAj1zw3sktRprOewGTlOSuP/kwjquEww4VrJJJCsWNZQ6P3w7h0JBTIbtkchzo7fNja4a32RD7fHRFcaWIUCogCQJYDPWiSMjMq0v1VDDQ1gumW4FFc0kRqg3SRXnK5JM6fcC+yAKxEA4OhpsMwr/7qZa6kw/Vufys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSM2xb0s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSM2xb0s"
Received: by smtp.kernel.org (Postfix)
	id 0E3CA1F00899; Mon, 14 Sep 2026 15:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB1B1F00898;
	Mon, 14 Sep 2026 15:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398680;
	bh=8061N0cwVBiWgZNLOaRyLK+L3bIqnfkjBy8OOu9i+ug=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BSM2xb0s7FCjL+Ec55A9iLbb0PNFFp4AKYTMnbA6s1mdslTQTid1kDoz1qZ0DMnbc
	 8u4qagQMapgtrRyGumq7GBtv8OISngCfGeKwgUpxUJwnHqJFRRkRYBhVifsSCEWR/P
	 3q0ijvzScMrcctyDmavFLWy7QYTxwfuSFW3IiWt6fQw0OnZugwTWsPQ1mjtKrQlpbf
	 2mZDsL2wL4PJgn2AVZIz5e0+lALSGRGm3a4nldVz7Ju3IOpalzIXJBJv3r0e4GcEs2
	 BizviBCDnz8eTY/fl0bPY5nmRtdCGpWGbOe3NybnPiU4+2AroMEF8FfejGO5WKsDcx
	 2UL+oZq3NmRgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569F93924A6F;
	Mon, 14 Sep 2026 15:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi/ffa: Fixes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178939861487.630437.14533234387851321766.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:10:14 +0000
References: <20260908201216.2993544-1-sudeep.holla@kernel.org>
In-Reply-To: <20260908201216.2993544-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  8 Sep 2026 21:12:14 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi/ffa: Fixes for v7.3
    https://git.kernel.org/soc/soc/c/869e97e66d3f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


