Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F3551DDED
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907838; cv=none; b=A822HpxHA9isermVpMh6ebzSxjMBmDPyN0k05a3rEyv92bWOvKd8+fyzC3O5BC+Ya5yLsQOHcaPvV3VghJ9Qdn12lV7YEIqBAFSn1PhnDQuQwC6CJwEkf05uZwd22uS+VOoXmqZCOZlylnjyzCNZUgi0WHU/f9nd6e45cz3HkvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907838; c=relaxed/simple;
	bh=kQ9BewpwJL8gquJaIgTMeCfwcd1hb6eRgaiSpZxSvi8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=USnvWPpoS4S168wp9UrSB3n7nWDgMqUcVHM3olDIy4JEFMUOZ5lZfxrkjnMsrtBqNyhEToMXwcUWFibOJgWh5xvAoapHpCV20t+N7KJ+Pc5o+3Z5EnzARyYEO1sPvgukm2qvqroWKMigyKQO2i/6l65yT/SS7tD9ei734uhhD70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FI/MIwDi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FI/MIwDi"
Received: by smtp.kernel.org (Postfix)
	id D1CEF1F00893; Tue, 13 Oct 2026 16:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFFC1F000FF;
	Tue, 13 Oct 2026 16:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907837;
	bh=ckhdjgqs+3mS3/W+enlRoneR+mxbo73/X5cHZYIIeOw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FI/MIwDioxm/2p/g9Upc8CnCBZ3qaujGF6T/CJRy+B2CsjFPqrbfuc2wAeCFRdmDY
	 u7XOcV9riwV8UmS8ozTNvRc4Tq4fJfRgJnYOBtbBDJWXA8GRpeRSlFMlXWIZfBADXj
	 1wAgn9+EaSAWa/2seNLeaDk4zw3ViqygVcB1CFUsUKItWC0HRS26xkcyu4MC95ZW1r
	 AV3ARvqphY7Ju2d2apEPyLAEjclWaiAwsNEQ+kW5Zfl+VyIxnBCfJ33mC9iFgkyYQt
	 wMNbUzT3hftrb5KVgfnkz9TcbkwzrgjP1Tv0rI0UbVDs9XrIqNvZoAmnSmBcwsePpN
	 wTfmYYqLTzfcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44D339D5FD8;
	Tue, 13 Oct 2026 16:10:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND] arm64: enable HAVE_SHARED_GPIOS for all ARM64
 platforms
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190783626.417156.6276718933158129191.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:36 +0000
References: 
 <20260925-arm64-have-shared-gpios-v1-1-57fed3fae35c@oss.qualcomm.com>
In-Reply-To: 
 <20260925-arm64-have-shared-gpios-v1-1-57fed3fae35c@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Sep 2026 09:43:17 +0200 you wrote:
> Shared GPIO management provided by the GPIO shared proxy module has been
> enabled for Qualcomm platforms for some time. By extension of the
> defconfig, it's been effectively enabled for all ARM64 platforms when
> using the default configuration. Bugs discovered initially after the
> feature was first enabled, were fixed and I haven't seen any new reports
> for several months. Make the feature enabled by default for all ARM64
> platforms officially, which will allow us to continue the removal of the
> deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from the kernel.
> 
> [...]

Here is the summary with links:
  - [RESEND] arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms
    https://git.kernel.org/soc/soc/c/f918e3804498

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


