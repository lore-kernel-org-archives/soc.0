Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E389F3AB291
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352462; cv=none; b=BnCqabyKLMIBCh5gryXFJMrQq2K6hUFbVmCBL83rL4JOyKFMFp+L0wVSS2p8xMHtfydvMNEumYxLzAZhhvzCGwIaU2exJsHKmB8AwAzZC1aepbYvTGhDJKpXGSF3x7fKELDHTkY98+9st9QoCwoFuDk/0pWo1Sy1XSDcR7dfoCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352462; c=relaxed/simple;
	bh=J/HdYlBwlvrQpMP6llMs6R+9I7t+igPmXnPB58J9DZg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=f1NnB4L5x2Q36vFXG3e0j0oiwVokrjYzcsM3Uy+5kd5sGHZmIrb9bV54VplS4PSXj/3iPR+gIbeNk2N5ao64PpqWM1rmuLlv3RCZThd7h/P2O5pdsPam17mwif0q2k8SH2QnXMAuougBm3lVf8JP73T6SbMHbjn1ujsOsoiNhJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4tMjPNF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4tMjPNF"
Received: by smtp.kernel.org (Postfix)
	id DE9AB1F00A3D; Mon, 10 Aug 2026 09:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57671F000E9;
	Mon, 10 Aug 2026 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352461;
	bh=LFA7sVDaBzApmpFGX9hp/d9Sbew1P0033AFKONWauqA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=B4tMjPNFA/CnTpWWfENMDD6uka9yJzaq+TgtdOOD724DuaV8UCKQjQ/2b+ZK8KkU0
	 Cmz7auKOiW5abQqEhYxPVfL7Bf1oxdjaXN61IjVDVpeUD5Jkn3pqoCydhcVXMsnmMy
	 yeVoyERB+Hld4lGsTXLjFA6/OzLHvcRYBNrQlTlGb9vTrEKmVO0RuIYdJE6ZRGYHUB
	 C1sT7JZOq7DBak6pLBYL8xFznc1DWdpvnOUTcLeRu9x7XSZW3YOtJccG+k3bR+dY5a
	 33KMlemxv/EA1vmTnexg+JK2JQOE4GCP6HvXJp33L2hzfUkRlxxRVSEbUSJlTa2AL8
	 WqaabZM7XjnNg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A1C3924FC2;
	Mon, 10 Aug 2026 09:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC fixes for v7.2 or v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635241839.3658557.14746390206508884074.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:18 +0000
References: <20260807161937.6419-1-sven@kernel.org>
In-Reply-To: <20260807161937.6419-1-sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  7 Aug 2026 18:19:35 +0200 you wrote:
> Hi,
> 
> Sorry for the late PR, I totally forgot about this single fix.
> Feel free to pick this up for either 7.2 or 7.3, it's not urgent.
> 
> 
> Best,
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC fixes for v7.2 or v7.3
    https://git.kernel.org/soc/soc/c/37397cf956dc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


