Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF8441B34E
	for <soc@lists.linux.dev>; Thu,  4 Jun 2026 12:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574406; cv=none; b=OJSDTE7mLlLEnIa7BGPEoOckCJL6SDUJ8hEcMJ5QSonbDmv+mPgD0G63j5Xg8ioWWs2WL6Ex+H1e7Sh3ODMEP0H3jshYN8JQBexXR3aId36mdHjbOS9+8/ljry+OgoPtQnClOpg+8+tbmaYIetwecAiorTS2HnoYH0WSjnC0yh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574406; c=relaxed/simple;
	bh=T9NOj9Prz82RdbPIi8mG8KFUoOdd9ky0EyjXe200F0k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ykh4M+B6pjTFrBVUtYunxCbxXC9JLjaNPVxlR3ujQL8ukLZ9e3wjKBZS/gJeup0vTy1pdSGu3qMJSFjFGsYPOC1b1u5atkNviZqMiarzn5D8tzXww3mWj9NCBBuhUJGmqTIfmPacWoDcr986AEtPy0Jd7j2TL7SFrX3kiDThqjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lq0hwF5/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lq0hwF5/"
Received: by smtp.kernel.org (Postfix)
	id BC2FF1F00898; Thu,  4 Jun 2026 12:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A401F00893;
	Thu,  4 Jun 2026 12:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780574405;
	bh=3MtoSRYWyWyjAgMQcVqvfGC7GkI1lJxZxfGKOOupfPQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lq0hwF5/szOWDV9r2rTRYkGnZ3gooi9XFiuBIOMWJ0c802NRPpZqcy+GKTmqJrs5M
	 KwU2xgBXCWa7DtFsy54EtWA+X0mu7SMKf8A7yMYLlCBEh4F4Yc3CibXn1qBFVyyMPX
	 5pZc7LYmgopD1L6Z+s6521mXzpH7V5ihA37KmlKp7/CKS6bynYUqkyZzwC9h4fBHEj
	 5yf2s3Up2JTZRqChzo7weBg+zsjhJA7p7kDZFH3wK0nU42FpRP10pwO1DM25ZDCkKN
	 +UtP54987UdvYpqCZUmIpAyG4ssvJuNGbtm7GF1dAfPkYmCye3DKvYtuTx+hjjh5zy
	 4c5SH9RhOprfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AC23930936;
	Thu,  4 Jun 2026 12:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: socfpga: updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178057440664.2392999.11538139475899609510.git-patchwork-notify@kernel.org>
Date: Thu, 04 Jun 2026 12:00:06 +0000
References: <20260530214027.161945-1-dinguyen@kernel.org>
In-Reply-To: <20260530214027.161945-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Walleij <linusw@kernel.org>:

On Sat, 30 May 2026 16:40:27 -0500 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v7.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: socfpga: updates for v7.2
    https://git.kernel.org/soc/soc/c/7b93c5b05877

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


