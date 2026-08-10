Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB9E3AA4EF
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352476; cv=none; b=o0mfwZkAxOILGqpnACei6b87tCFFp8wJDfmZLSDUC2HDusrXaLUcY/T25yiE0y9PQJ9Y3FYMydG1oLbXJxPXnPxmq2y8Judxtt2Hqwv/qQQEwGcT8OftwrG8oGP3hchnKz3oVTNclfPR9npV5SIjYQo3u7QClAUi2I0TqRazZc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352476; c=relaxed/simple;
	bh=UkOELvjrbQqGMnkDJ9Qxmje1GhvnR/WY2shotSrb/i8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=l0i37SVAVlW0DBpTYZu+SdhHtvzQC/MQAla1jhkrN6JZ0ZFhOU1vtCOlzqZ4Bl0eRCs/C7uTbmVt6xvxxDj/TRu9s21/JUfEN397toH73aMgEmdwPYwDWT2z52OIYlPsBoHdwv9GOiqWEObO74Wnx5k1NOe88RHuZ5JbWJTbmqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZv1CduW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZv1CduW"
Received: by smtp.kernel.org (Postfix)
	id 4B66E1F00A3A; Mon, 10 Aug 2026 09:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3574B1F000E9;
	Mon, 10 Aug 2026 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352475;
	bh=TEZXEtzn2CRaugiJZrXZBtyk8Hh8ReafC0on2VRLbm4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RZv1CduWkljeO3jaHO6vnivuo14IUoPsVGtXm49lSBpTFyPZCaGAFFXX/4rdqly7Y
	 1VIAdGM5iZOl8//P+BXjrsqQHdttbue6rfLlFW65nhR1nnDlzYmvgxyXO9QmV3h6eo
	 TKSEOF+F6pD/d/9MfmBq7W04OV2QXAwwgfwXBk60F4hyR1HN++iCW5J/zWqhCvtfd5
	 s6jOmLiJMnSNKQ0etl9uuqlLchyW81djfOjfd8PmF2dJEUpghY48sVwfR88UrVqSKW
	 LZzrDfCiFVtbzo7CCLeOI39K0ujWW1QGAVBa3y7KBNYW09xjk55yxyEqvc/f00DPt6
	 +lmNRuZrT/RqQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 567FC3924FC2;
	Mon, 10 Aug 2026 09:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] QCOMTEE update for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635243195.3658557.4127493416574574018.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:31 +0000
References: <20260806132114.GB673420@rayden>
In-Reply-To: <20260806132114.GB673420@rayden>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 6 Aug 2026 15:21:14 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull this small update for the QCOMTEE driver.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] QCOMTEE update for v7.3
    https://git.kernel.org/soc/soc/c/421762c6bb58

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


