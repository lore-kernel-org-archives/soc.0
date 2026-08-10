Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32E831714A
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352486; cv=none; b=i7CzxIe9dBVOFGfgOCL3Rnufeel4XymJpIlePaq6n3L3DqrLjZMzKwg5FbUeu0SzJiS+FzH0z8Y9qB4XfwVRutRKXpNjDuIrj6pBvg0y//PW4dn04U4PxV52CAlJervcWExI8u+F+PB3+aMBNS/5RlA/KNfIZ6ojm4hKf5MrYcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352486; c=relaxed/simple;
	bh=x7ra6Xb5QsFuX0J5y4SOyTQrB5028Fpk/3FBdze/xiY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Yzlct41PD2b12kv1CPo+jInJ3OWF7F0ocoWxmKTVi286tzMuzKlJIsdf4d0ENagyCnLX+aKAKFQ9pJnj0Bwe/lyCk+ooeXWZ9sN/5oAhKlPP8xj7YpxPonfKdfiS3ixk6WAoGD+LOCGhlWoBxnoYxQkCK2ySC2O/FAZ7AGaxRyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnS5qFOz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnS5qFOz"
Received: by smtp.kernel.org (Postfix)
	id C56121F00A3A; Mon, 10 Aug 2026 09:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2721F000E9;
	Mon, 10 Aug 2026 09:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352484;
	bh=DKaoBYo2IVNdfvv69MbCdvmcWbiLansZpDfzRAGsjHg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cnS5qFOzRBb9vYiTIpCHHhUxPSyMHgbAzvFUsft9uDLA7K1oplHH0lF5WwLNrcmK4
	 Ow4CkJk2gTat7cDjrAP3zNK5jRf9txFvzfKlMr/Kkx/SKn+f6RSkrlKjuFZUp95Gp0
	 tVGvoogeuLDlvcmAA90R2kWPcFJAmO4LlYG0rJ8HxeNK2ai7cvJ1C2csh8chFJPw/Q
	 mXcOs/PvY9moOLErEkuQ0/s6Cyzj92a2sUE7Xu8cp6nLStV3Xg4QmV1p2adAY3UYSl
	 l4WuWAh82387cWMW+vnLiTL1Khco79xDdZKSWEzsRtEiZbX/mRmCQgHCDwkb+Ff4Th
	 iHuBaNRHLfavw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09B53924FC2;
	Mon, 10 Aug 2026 09:00:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC fixes for v7.2 or v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635244138.3658557.16085192122614554948.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:41 +0000
References: <20260807161937.6419-1-sven@kernel.org>
In-Reply-To: <20260807161937.6419-1-sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  7 Aug 2026 18:19:35 +0200 you wrote:
> Hi,
> 
> Sorry for the late PR, I totally forgot about this single fix.
> Feel free to pick this up for either 7.2 or 7.3, it's not urgent.
> 
> 
> Best,
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC fixes for v7.2 or v7.3
    https://git.kernel.org/soc/soc/c/37397cf956dc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


