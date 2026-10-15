Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1A53E49FE
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 03:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033829; cv=none; b=GEmsRvUTv6eN53K0RIlc37xpT06utuAMOtF2v6RMtWz0q6vcmR0/330jIMwk4kFvKmgOrYo0ezeBiENCoqP5Tm1bg5htkD67m3JybSbG0FxFxNTETDiKNQYIULJc7djK0DwOrJ2PA0oArEiRYvX8xQPs0yD2Btjn83CCXr9fwws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033829; c=relaxed/simple;
	bh=5uh7QVHFsRssYdK7PQMQAhw+SLCeJ5RDVFAoOvN/QzE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FX2y/TOW2bo3gOV0Mtz6gsaZv9C8lyYRlAhusqxFbswoxHRFYzRhsSfxoYQIU7A6oy57kY1opXPedZswnhrTRs081xNtCVeyaRYIgsOqdq9KAMRIcLjpIkMFSFsKzftdWXMgqoPYGBtNHAugTpt6p5eZrDD+ghZoYPk5R2yRhu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jsik9QLo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jsik9QLo"
Received: by smtp.kernel.org (Postfix)
	id 976E61F000C7; Thu, 15 Oct 2026 03:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812B01F000C4;
	Thu, 15 Oct 2026 03:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033822;
	bh=25FpMv8IofKw/ELIO84Kr3m3GRTkanR7iVrnpcJQSNk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Jsik9QLoZZ0Dip7qWpGBNpxTHA5X9vqbh8cq9YX4f+auG6Y9l2uhmLMxVjF147pSY
	 guwpQo1J7CNsLPhWp5mdrQecrS7DiwiSu8ztEfAt+Y2DCHTy0ZUdwEnWCWeIrm2jgv
	 aj6iqJrnQopxNzsb93er15A6GuCzEZotqR3I13h0ab1HmYSx9kI0qPAkDYX2RKUKkU
	 A485r+tnMtx0s/eyzOU9Dl00/L2Hqbrl+4RgBB7v7Z0DzF5LvO5DLOwJMsvCrSsoiM
	 R46jrLOhbEeGlT0FrRUu248ZLklBYUAzBJaqbKZVPh5gmVrPOS2GN3O78y4z6PLSds
	 eQJ3yeHQsCudg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77311392E992;
	Thu, 15 Oct 2026 03:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] samsung: drivers for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179203382101.3155468.14121405595041427030.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 03:10:21 +0000
References: <20261005101845.34752-5-krzk@kernel.org>
In-Reply-To: <20261005101845.34752-5-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Mon,  5 Oct 2026 12:18:44 +0200 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] samsung: drivers for v7.4
    (no matching commit)
  - [GIT,PULL,2/4] arm64: dts: samsung: for v7.4
    https://git.kernel.org/soc/soc/c/da4a53fa50b0
  - [GIT,PULL,3/4] ARM: dts: samsung: for v7.4
    https://git.kernel.org/soc/soc/c/f4829cb12f4d
  - [GIT,PULL,4/4] ARM: samsung: mach for v7.4
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


