Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9333F40DB2D
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874850; cv=none; b=R6CQqeD+dna7Rt7gk3wcTI/ewI9cRc0lpr8dJL12lLBsbL2quzNkz96kfl9UKGGDBuy5QEYayH1yTe+VAS96ytQ3wPiKAEcWFWkhH3RA5+6IsdCHFcbKT65tsdwHT4DEUPwzkj87j7oaBjaPYk3QeB+yDfUVU5zLZMQLtxGDpI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874850; c=relaxed/simple;
	bh=HlcB/WuDyg/QMmrTqbIGAmuthABWn1GTfyIDIa5VDQA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lImCdUH9fQXb3PJDPpSH+t2bqKayQTYozgJCyNrYG9nltyClIImLAdQvobTyy4fyqkDVcBtYRQTCR4OquB1DqYm3Zbc0b2GsHb/brVxb8DuComGhUDTZsuMxz3mfOR+HaNtVNlTbf06qF0bcrUTaKwECMV/N8Kj0bMgp+5PTPh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTXOmhAS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTXOmhAS"
Received: by smtp.kernel.org (Postfix)
	id 42CD41F00A3A; Tue,  4 Aug 2026 20:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CBD01F000E9;
	Tue,  4 Aug 2026 20:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874849;
	bh=t7CVNOUgKB5M/KmuNjimhK7uhwu5FUSMsM5U5Ssx6Fw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BTXOmhASjjMdDlQKF4kLTBXuzOCKhoTKazoClBH9zC7pYwwyxoL7vKyvV+ojnD0w4
	 SQAsCncjZS3/RxeO+TbSw2kCnheSnokFXavanA02yR7uarFClUCmRCl47g6o+0xNyk
	 73tZqBa9ISaCecjameYFvKiRbJNtVh47LfaUTUpiU4BxjiOymY6ARqapbHx5vszGTy
	 PHJ5hlZElDf+5+fG16WfWzmnfwWYrFkzGMg0BV3D5chDWejAxOioMeFOhn6ki5fkl+
	 Btbr9tGf+ZbGKcI5H0Am98IbIQt8I5lC9z/4IRiR+uVV5ZE5/VvO6L7JN0Nf7qH8c4
	 JRfxCGHwD9drw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09B039263B9;
	Tue,  4 Aug 2026 20:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: First batch of driver fixes for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587480938.3769923.15630424211393955954.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:09 +0000
References: 
 <3da63bea367b3490b041c909a4503cc2b5e9c394.camel@codeconstruct.com.au>
In-Reply-To: 
 <3da63bea367b3490b041c909a4503cc2b5e9c394.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 04 Aug 2026 16:14:50 +0930 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: First batch of driver fixes for 7.2
    https://git.kernel.org/soc/soc/c/7140eea2470c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


