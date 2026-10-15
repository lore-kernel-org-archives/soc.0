Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623F3E0088
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 03:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033829; cv=none; b=radqgPvHQe2ZCiedhlxkyT2+IKJE1DHnSB5JTZUiuOy8QJ944QWLJgjVdFhxubaKOdx9az9aVJRXBMEov1EwYGaTAUREz5B8TMaytZ94dUHB0XzWgT3hCus481HwC2hJe6CseIMFh4i0zt/OlR8xcHuW6x0MSf9r7GF5C8xlB28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033829; c=relaxed/simple;
	bh=F7+hhXE+in6CIzi2oZtr0D2lpXkJID9f47Qbgic3p/E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KK1hB+NjogEK0+IQFfLQnZRw6xelUsv9YGG7w380yMunUZq/E2No+MozHfTSQwTmMXfaJeGY8HItlhgxCLPcIcGBqItsDtMtX6o2Uo2oi7AzsRTGQjq/dvcaw9GhNjauhg44zi4wFUpCzrqsU7nPLfBOpnPKs2nnvvO4BZDELaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAp95SpD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAp95SpD"
Received: by smtp.kernel.org (Postfix)
	id 1C0AA1F000C8; Thu, 15 Oct 2026 03:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060461F000C4;
	Thu, 15 Oct 2026 03:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033824;
	bh=849jr+JwXjHkpDjbWf0vypTy+HOFSqzaFvtk/1HO4Ls=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lAp95SpDEVWpYkGwR5kxns6+KNgIx0fdohmM0rti+mEgG8ByOM6PRjdt6EV0o2p+E
	 zB0/55utbLg+WWxwiVL6tLEAKvEmq7DMSdZEOAeCdn2kAAIV3cfBlAHv4qsnPLafaZ
	 4Ci9TwmZe7krjJogJmnIjams7drlROFyhLGmTb+IkDOuuKnC+JsEZeVqwa4RC816jC
	 LCQ7P5PO+Uv+QaW+uyWv3WZrrajCAcKoQY6/tr1gT0+8UVczFg2Bb0nwldAkVCRmLK
	 +M5cH9C3Ch5qPddDZa/X5O+UcEumjM94EXjqmKXggEMPl7EKimX90l7za/XqEl9ov0
	 +E1MCm0jOKrKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F13DF392E992;
	Thu, 15 Oct 2026 03:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: dt cleanup for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179203382251.3155468.12215000324059236544.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 03:10:22 +0000
References: <20261005103232.37247-3-krzk@kernel.org>
In-Reply-To: <20261005103232.37247-3-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Mon,  5 Oct 2026 12:32:31 +0200 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: dt cleanup for v7.4
    https://git.kernel.org/soc/soc/c/1b1304e21863
  - [GIT,PULL,2/2] ARM: dts: dt cleanup for v7.4
    https://git.kernel.org/soc/soc/c/5bc507e6a791

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


