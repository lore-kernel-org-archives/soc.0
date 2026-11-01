Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572778;
	b=p7SHFN2YaUL9DH/HiptNfBoziTLKxo8/RpoSsII4BrujKKPlxIvW3tJKyXE/SZ2cQx5v
	 KYm9AbpBREnSm2f7P2LMlnTnfsdquLlkziXE15Okg9q13Dbp0+TcOIB36FT/1tghi5Vuk
	 zqrAAmgpw1wLmePz/ObmGn6vbfWyrsh1opHmAhe1ZCnw6ZQt3+FhFKlfss7hCHzJKI8Zg
	 kRDkWNS7w81E905uVKTAoIzyDsqan7Z0FezaAelIDLoSw1NOYvls6SOlTtyxz4zGm669Z
	 m8uiCLb7wSpfKoR6R/hUgy3QbHBEChr7Z6fIeLimXrTSUvRuyf3QF6pahhY+zSVBIFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572778;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=vLtVfEGtwu3bwZiOUe3jPRQr0Jnv3xFPriBAFC9hebk=;
	b=QGXpO3mp9at4yVnI93OU+GIITZOgzVJLXCCSRb0JFn0YbWQdgOZAhFq0P7kNAtt9HTIM
	 oP8auQvhc7cBeiRxJ+Q5duXAib03VIizmDOasRkE/pNMBvJkIDNWm5unN924EbH5lxm3K
	 bmGWJApPWtEf4dYTmggf67s02DnsVLAcoU0ztnh3Wzmv+OiPPWCnuD139hSOV+LdTjGxW
	 b/1y9hhpBVMEohhSvP5ZLwVNAwXhdYBITtC1ieD4+b/JCTZMIIpY5zwg3fRdjFS115rGr
	 2XDhjZfYDeGsarxS47ueep6m/QOcgdY7oaiSXxJJSZGO3r1tQ2lr1Bhu6aHgqVrcfww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbiTQpLL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8681606A324
	for <soc@lists.linux.dev>; Sun,  1 Nov 2026 22:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbiTQpLL
Received: by smtp.kernel.org (Postfix)
	id 60C9D1F00919; Sun,  1 Nov 2026 22:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D8A1F000C1;
	Sun,  1 Nov 2026 22:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572777;
	bh=vLtVfEGtwu3bwZiOUe3jPRQr0Jnv3xFPriBAFC9hebk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=EbiTQpLLtPVIrDr6uk8x5RwxaKWrPWGzzmd5Tl7f8dq/EKS5wKCLl0pjuuFQy/VMK
	 NkZFMnw34H7smMwZEESl7iDCOsGYEXzJKXj3ZkPABstCuAq8/4I4BVSaE4TQSJmF2e
	 Cu8aDXaE/7S2+3SF8kYQ4m3ZwecHQJzkARH934GQc9r93Ks7ebs+RQIuuJu8hKEH5K
	 NassOD6UfCjOhDVBR1f3jVhG78r4CznZwGNHPDYaFPosmE0Z4FgGhaM5VBbm9jeZYd
	 gPmvX0pZfNJnTgDoQWaqpVJroZrpBLrCZ/t8sQc7MTvJvWF7gxmK/ziqttkOB6N1mf
	 l76zRkzrKbcBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 401EA391AF9C;
	Sun,  1 Nov 2026 22:39:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL][3/4] RISC-V soc drivers for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357277605.2624073.11642438626081905507.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:39:36 +0000
References: <20261013-glitter-lingo-dce2f8d724c9@spud>
In-Reply-To: <20261013-glitter-lingo-dce2f8d724c9@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Oct 2026 16:38:28 +0100 you wrote:
> Hey folks,
> 
> Diff here contains a lot of clock bindings, so I've provided an explanation
> in the tag.
> 
> Thanks,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,3/4] RISC-V soc drivers for v7.4
    https://git.kernel.org/riscv/c/b45ebc4a7cfa
  - [GIT,PULL,4/4] standalone cache drivers for v7.4
    https://git.kernel.org/riscv/c/655e6054acfb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


