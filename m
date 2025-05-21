Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65FB2BD032
	for <soc@lists.linux.dev>; Wed, 21 May 2025 21:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863011; cv=none; b=mwFk2w+UDLHd04b2dUQrD2jIJhDa6G0uaz0p0xnO8htH0UXUxzA3/JhseLW46eN15GaD7pcycYUDz9Gi2910HdXWNrcimLfRRaLewQkC/GmIbqjC4miYMyJ5lFloLWiqW3IscBwR5Hj/o0/C3VGzEwgccpPYAu0GZB21hR5ryMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863011; c=relaxed/simple;
	bh=cZdv6K5Xam9XK8NuPIxfkwb8Puy3M5kuJ6mSz7+N1FQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Oij+GGGFAQzk1+GtOaWHaaudYWzBbHpgu1ydwVxpBYTps2pS4De8tbAWw1e+bLX+/vw0DwSHBibeor1cxbD7Z/31WJEWDPmjOjSro6Ym+8/OlN9Bu0YEGwgFUmLIzPYOo+Yh4ItOaUtbDe3pEfBn7y9n31uMjsciGp95e8vc4F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RExLVPK/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RExLVPK/"
Received: by smtp.kernel.org (Postfix)
	id AC994C4CEEB; Wed, 21 May 2025 21:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967CBC4CEE4;
	Wed, 21 May 2025 21:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747863011;
	bh=cZdv6K5Xam9XK8NuPIxfkwb8Puy3M5kuJ6mSz7+N1FQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RExLVPK/juSNJvvcRD119DEC7V7SU78rgeQjkD+/M2VftENLJX4UVkpCpJf1f6nIu
	 ggy8bDh/iQmfnm/vf07R4i8+vnOpyCJNa1ulN3vg3epx1DmxCGyui6PmLwzbz58fEs
	 2r2rjX+2jblSSP0/ojYAMi487IUxdgTnGgqeUbA9MD5GFTDcrWR7LAGxz4/4WhJlGd
	 pIahYn9jdbrrivtLrRSlP5x1Ke2Ug31nEZai4BIwcYmbSpFqJ+AnygTc7aa3NZ+4Sm
	 jkjQcqwBSCzJyIUm3f12JoWmffn4sbBI0G3otp5BDFSFxoxh06/7zpHXSxQAQCwDBp
	 DsWf5cHtYFeNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 72299380CEEF;
	Wed, 21 May 2025 21:30:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] RISC-V config for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786304703.2284637.5221097862408867704.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 21:30:47 +0000
References: <20250516-joystick-mortified-385820b1ad0b@spud>
In-Reply-To: <20250516-joystick-mortified-385820b1ad0b@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 May 2025 11:36:53 +0100 you wrote:
> Hey Arnd,
> 
> These are a bit late, but I was waiting for some acks on patches that
> were outstanding for a while dts wise.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] RISC-V config for v6.16
    (no matching commit)
  - [GIT,PULL,2/3] RISC-V cache drivers for v6.16
    https://git.kernel.org/soc/soc/c/07a3c038bd9c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


