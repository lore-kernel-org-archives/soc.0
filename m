Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7B4392C4B
	for <soc@lists.linux.dev>; Wed,  3 Jun 2026 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488611; cv=none; b=bhOOd6EI+PBau52HNMFvN8NnlomlRm77PUKID6RYnDstOTS+rJOX2STksaip4XWodFquOHGLv/xTItm96P04wBY46xsV3JBhrXE5pLqiutBxNQNoSF9V0FXvgUzZAS5t02Aw9cG9R0eCoQPLrTXfO+m1gyfdH0eXO3R4bbxY6bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488611; c=relaxed/simple;
	bh=/NtWRtswRbu+hyos6XyjlrlSjTFqa1QElqrAZxE+9qU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nf9/fL+rQNMKiJDY6NCVHhZj0MAGLHhBX5fiii4Da8ugCbXdwIdMcgBir4Xqqf7lJOecEDFMYYmpn5GaPhh3zbXyrRRxMx96Fm74wKsn/8a7UOeKO8Ri30XjC5zZGHK6Yn1hlnl6+qtsEYGJS3fNavH4vXaDUW/4/gxWM9UkLX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nV6iMXLK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nV6iMXLK"
Received: by smtp.kernel.org (Postfix)
	id DF09A1F00898; Wed,  3 Jun 2026 12:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B4E1F00893;
	Wed,  3 Jun 2026 12:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780488609;
	bh=/sW4+KQqa9dlS3sU6G/bak7GKfp2ujIMptoruWigjNg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nV6iMXLKL8ViniAQtJ9NiHkAUvy5hpVM+KZiTymOmQfnCZRsoIwc64v8pNdDieFgx
	 lF3CqVbJAV/njfgLoEYvdofDopUsVlmLSZNCBVO2KFhqcr9XXlIaDOHCbqtu8FcaS1
	 +WBLZuuOD0YVK3bXTP6bU74TnuSQpr5al4/QFNe7hU45hIF3sW2nMY+cE4n8h/txpK
	 AZTlQEnrZSQcq/2ENCpWWARSFTeUpWP3B8dNKnAjhOcNUwf7Lv8flvrdlMP2x0nbGl
	 VXYCeXVzQuQUN/6FJSsaipiU/MNzXtGmEpGFZI+W9mTf6EEFNPZcDFXh5/T3Q+6UW2
	 WC3e+73L6CIpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 827DE39307B3;
	Wed,  3 Jun 2026 12:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Gemini DTS updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178048861132.1379714.17269851639812707392.git-patchwork-notify@kernel.org>
Date: Wed, 03 Jun 2026 12:10:11 +0000
References: 
 <CAD++jLkQ8FEFL4fbOgt+pbT3orGm90Xt1bFeGCKyB-Th=qOrjw@mail.gmail.com>
In-Reply-To: 
 <CAD++jLkQ8FEFL4fbOgt+pbT3orGm90Xt1bFeGCKyB-Th=qOrjw@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Walleij <linusw@kernel.org>:

On Thu, 28 May 2026 10:48:11 +0200 you wrote:
> Hi SoC folks,
> 
> sorry for late pull request for these DTS changes. Had too much to do.
> 
> The changes were posted to LAKML here:
> https://lore.kernel.org/linux-arm-kernel/20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org/
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Gemini DTS updates for v7.2
    https://git.kernel.org/soc/soc/c/f8160c84dd88

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


