Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70A729B77E
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023239; cv=none; b=JUVjzwWbHOyYQbaaP6Baw4l+S0mpT/z4yYJqZjPNszLxLSlVsWfQ8RkTtJvZGMr7ktVHCEPRSVZUtI7NU7Juv67da1QQIo+NHHT2kz0bxTb0sd8h6wjpAmffeS3uWlbdPb8I58tZOI9V0FAHQEt2lg5Du8YZLPudS1l4hL5u05o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023239; c=relaxed/simple;
	bh=N7s1z0vq13ABIbbED8LKQTnDxghqfjHejFwsCrvvaJw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bRUXdxKuqWfayMdZ8dsgyfSW50JnWqLDUoHsTPvockMA0fpp6mJMoQSI1K0wfcv9/cSwYibSuivLz72GAd4sCY8DISYcHHYQGvWJxLV2z0tXqyAfBiORgaQkq1JG4npZs/ERShintX35vMNHFn96CS7GR+qUzpkLfgdEcNoe2+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WL3ScZmc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WL3ScZmc"
Received: by smtp.kernel.org (Postfix)
	id 9A6F41F00898; Tue,  9 Jun 2026 16:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842D71F00893;
	Tue,  9 Jun 2026 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023238;
	bh=RUH0Iyezz/Yj1XyZM8A+O9Rke9sBCbvWJAr9/pd1ugY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=WL3ScZmcoImn845lFGe6NjF1jVB+e0lmmemzu/gW+8gm4RDOonBLS31yulQ7Zce/N
	 o8WLEn0qf2mcInFG++xGIDhIy2juaCScE9RWUpQLmvMpRIQY8j8MsrIScr5u2fDgb3
	 IZ4rWXfCrL829eTKdHD6YvQ9EOcRvqMrH8Fftgwax57GvzFkiJxnm3AdGAgrejglcA
	 t8IfVlGZhexxDx9YVrbZHVyAu5dGqT9N8q99vN6T0iZGM2xyKE5aZ0M8tZPs2OrQ+N
	 XYM1B5lKhhA4dU0foZfCXJAu/FETTwhYN5Wy20lsqjc7JIzHCuznC2L12bMKAnS6aU
	 fOvEczXhLCwuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198223930989;
	Tue,  9 Jun 2026 16:40:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] standalone cache drivers for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178102323663.2135346.7452144585418429671.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 16:40:36 +0000
References: <20260608-retool-automatic-2e55911639f9@spud>
In-Reply-To: <20260608-retool-automatic-2e55911639f9@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 8 Jun 2026 11:56:45 +0100 you wrote:
> Hey folks,
> 
> Just a single two-liner patch here on the cache front.
> A new driver popped up in the last few weeks but isn't ready for this
> cycle.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] standalone cache drivers for v7.2
    https://git.kernel.org/soc/soc/c/cf934850aa5f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


