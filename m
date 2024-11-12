Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E10481AF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450722; cv=none; b=XYG1amgUVCPHQsgRqIjnrdhEiOM0DQEhj6g7+cBmMoJK7u8Rz/Q0ZnpJ9F/1iaqtlKVQBx8Ay4/ffyFf60GZqF08l4lDC7/kgSIEKlIVeR3P46fnR8FKLdAhKbxGjlTCOkZwoBWR362WeiCoQXUNKfD3Dxqv+UMyoR7/V8/g+jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450722; c=relaxed/simple;
	bh=CHl7gXK+1py5sutIp7Aj34SjF3mDzKE+o25vAVdtov0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HgQ7Ljq0g3Hy6srgSoN6KzdTaEqGq/r4T0qdz9wZc4M3S1/ZObAehhmPIaLm5KOaziWbFHRDkJiUezpc/dgucg6000oq0M4t8xk1aDKlBsJLIo8OvOC6XiggzXRb1IeQjh4EpBsfTgVeCCQSatVIQPp9t7jOG82lVbkoZXyUYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAb6WZpm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAb6WZpm"
Received: by smtp.kernel.org (Postfix)
	id D8F82C4CED6; Tue, 12 Nov 2024 22:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F96C4CECD;
	Tue, 12 Nov 2024 22:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450721;
	bh=CHl7gXK+1py5sutIp7Aj34SjF3mDzKE+o25vAVdtov0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uAb6WZpmwwYjfrkZ6jzpUVjOogJTDr9jUbEOh0e1V7BDdgAqDXbeeHPOErhNQMfZc
	 LG7gVBiVtvo9vQZKJzkZtcNTMKchxdhjhZd8RTHkKmyYd+07s7T2STkG2HiJCfxE4A
	 yZxhwPKaqJqoiPGqhqkSwkOIvDwvf/X1XUTNmY1Qf0P7YArAKAaT8PHlyxGDDyEdOU
	 OhBU7Xf32aEt2T01OPNf5CVK05jSlONhwKSq8sNHAKUCwrFzJ+Qp4X6UeVmLkyBWBi
	 OKHmIK7CnmAt3SszhBoQtqhD9m93ca7oISWyKBMb1vNfQviOaYXgIRHMU9hOCGxC0L
	 1qGVYKpV8Ij8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 348C43809A80;
	Tue, 12 Nov 2024 22:32:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145073173.694695.1566505370456124406.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:32:11 +0000
References: <20241104112625.161365-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241104112625.161365-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  4 Nov 2024 12:26:20 +0100 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.13
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.13
    https://git.kernel.org/soc/soc/c/dc2fe29c88e2
  - [GIT,PULL,2/2] MediaTek driver updates for v6.13
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


