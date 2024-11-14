Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74791BA53
	for <soc@lists.linux.dev>; Thu, 14 Nov 2024 00:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731542426; cv=none; b=bROZk1Pm3UDfrTCCkhKd2r94RTvckrs8MLwWRLY+1SOkMXGMp2eBJppniuS5+a8xFZB0gocvhpHKs7WU2EQseCE/BC2nAS0cqoY7m4crfE2hcm4F5xOZkIEwPChlX7q7np4KBT6IZtV7ogwSoqeH+0UpWATEt3kupfzR6r5sPHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731542426; c=relaxed/simple;
	bh=bt1bYuqbV1osYQZrNWjc/Dp87ZDLsKmus7G1pi1Biek=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=apfew5ejh9RsLFYO5bs2g/rElytuOaj7znVYdeaxmW6s1v6x+vn3cSmYI38yIZY15l4Q9Ouxu9uWkhKbUPFP8JaZobIF7F3F/M9OGEQst4bLTaULviqxovzIK4lH336bjxUl216pzzuOJDKouZ6K+J+9yL6PlmRQvA9r8jc+hmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmIhLr/s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmIhLr/s"
Received: by smtp.kernel.org (Postfix)
	id 21FCDC4CED2; Thu, 14 Nov 2024 00:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C36EC4CEC3;
	Thu, 14 Nov 2024 00:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731542426;
	bh=bt1bYuqbV1osYQZrNWjc/Dp87ZDLsKmus7G1pi1Biek=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mmIhLr/sjYQLrY2T2bQj++yc6A7+y6MTZ4JumpW75x+FJZwcILbrkCd2iBOmOqwFQ
	 cT9dT4zENiPObt+9D7rJofdGMZO2UWaUvBiaiT1V+Qx/TFP8/KXYqTa1tP6yph+9cS
	 5ZjFPk6raCed9QMvkH5HWIjHhlK4IrM0DKY9nd4G5ybLOFmea0BYgpYIyvi9tIAbRs
	 jI0ZMK1e+7I80EhCdtsoOfmS5fV8g1A8zSGOhPPhnRs//U8tKxrbWTZkXW0J5PEfXI
	 R7YQ9LMeclWha/Ad8P4O6GdI6izeKQVahge0lI4QxfaUxW6bQpnY9MVLZwsaFAdTlz
	 mJfPHdIffU6GQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCF23809A80;
	Thu, 14 Nov 2024 00:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND GIT PULL v2] Microchip AT91 DT updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173154243648.1424393.15504401377978256940.git-patchwork-notify@kernel.org>
Date: Thu, 14 Nov 2024 00:00:36 +0000
References: <20241113182050.2176500-2-claudiu.beznea@tuxon.dev>
In-Reply-To: <20241113182050.2176500-2-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Nov 2024 20:20:49 +0200 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.13
> 
> [...]

Here is the summary with links:
  - [RESEND,GIT,PULL,v2] Microchip AT91 DT updates for v6.13
    https://git.kernel.org/soc/soc/c/2b7fda346ee8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


