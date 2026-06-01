Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A698381AF9
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 20:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346403; cv=none; b=ZU+fbz5WqWbf0+5yLPGhyMXFD1OCHbvr933EcuayjUy8AI4lV6g0O64aTlxhKcr0HCt3OpfIKBMHFP9QWLeHTwNR9HvJx94buXlJf50QSTrTwTYtF96K9RPCKDBHCKXV9YDosUPh7RnSDzNCREjjBC8WeZwMEx5nCPv92N+B7sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346403; c=relaxed/simple;
	bh=zfYpX9hhFUpVO5M5gnG/OMMkdLbaTPW9neHwMYmCKNs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=d30gRyHmQl76P0OElSBpAhOZVRBP/NZTv5lp7wbiH1SaJDATxTBNWaSyCWDQMhhmtvJegWatJH4O+heXUESjyGn9N1G++1M9AcuB/OL01UCg6eE0r9ts6HmFk8yX8defEglzcrC9jYSxfRTjHE5PekL2d8Smb4Ex8r1ovS9pOeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYFFs7bq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYFFs7bq"
Received: by smtp.kernel.org (Postfix)
	id 5BCA41F00898; Mon,  1 Jun 2026 20:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440041F00893;
	Mon,  1 Jun 2026 20:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780346402;
	bh=0gq62d3yHp4bwzf3jqcz9kDJpUEi14mrKklV/Bnxu88=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=AYFFs7bq/8CxG86AuDsKLuZFBZPzxape3z/DcLVzs8JK9Hlqd7yYWwueesiUJuKhK
	 iVQdiSIfUk60fAo19c89TTjmMJSl2xrf2uCt6ypH5m/x+VQfPHxAv5SXlRtp9nF/4q
	 Q+pzEcELGjRAtPjOSPweVYMF/FVgDUwKgzdd+U7d90qLPBzoEJ+Kz8VEutkntfHf5w
	 2ov4+GqoY4zZbEczXe2yRVos+mBhxPf/28ctiuTL0eN/v/Gd9e+CsS4fUkHRn1WjC7
	 GD4NPEs3ObQ+rTAPfF7SgjBhzll5buCwl9PJ7dsPseUVYm77rcWnNlDOyidZAe2gPN
	 hmPmQedcr0tBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0D7A38119F4;
	Mon,  1 Jun 2026 20:40:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: zte: clean up zx297520v3 doc. warnings
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178034640465.87569.8510755008025763626.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jun 2026 20:40:04 +0000
References: <1991560.tdWV9SEqCh@strix>
In-Reply-To: <1991560.tdWV9SEqCh@strix>
To: =?utf-8?q?Stefan_D=C3=B6singer_=3Cstefandoesinger=40gmail=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Walleij <linusw@kernel.org>:

On Sat, 23 May 2026 16:11:35 +0300 you wrote:
> Hello Arnd,
> 
> I am forwarding a patch from Randy Dunlap fixing mistakes I made in my zx29 documentation. I think this should be the last of the zx29 patches for 7.2.
> 
> The pull request is based on the current head of your soc/arm branch.
> 
> Best regards,
> Stefan
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: zte: clean up zx297520v3 doc. warnings
    https://git.kernel.org/soc/soc/c/36464f365323

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


