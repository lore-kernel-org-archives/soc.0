Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FE7175AB
	for <soc@lists.linux.dev>; Fri, 13 Dec 2024 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734109217; cv=none; b=eG8N4dYT9tsheNeiDdztJwDhsT6RU4nlWEGINIEw1Thebq3nTrqzogh41x3+3XQ20i3FnE1Cj9BNytILR4ziPjrF51kz+ewS3ckEdh0FoTmMO9pCbhgQXe426juLIQQsCjpTQuzjdqDPYfE5JJXv1rDhPF58mHOXyyazs3mWhhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734109217; c=relaxed/simple;
	bh=gWF8Uec8tBTBsHUbjjhOTfmXjIo1bzZ9B6kbnXyA9J0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nP7jvSavdRrazyrTaaHVMG62ZtISO8YVyYvFKBMJ1PCRhbzZlUsz/+d2jrd7UgDVUFctcNiAUgbkLsZ8bOkTDKxU+rSoCc7ddc/mJbiqeABUTkgyUndX4YDA7EQMHOSGovEuad141DatHgwLI3RgiXvPJa3D2R4KFORZ+Qpoeug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVkv/2Z/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVkv/2Z/"
Received: by smtp.kernel.org (Postfix)
	id 5B4A1C4CED7; Fri, 13 Dec 2024 17:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4534FC4CED0;
	Fri, 13 Dec 2024 17:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734109217;
	bh=gWF8Uec8tBTBsHUbjjhOTfmXjIo1bzZ9B6kbnXyA9J0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AVkv/2Z/y6z01xkPeX+GicnmANb/rMEenJNImBbqssjpA/ymco4js7glSLZmJv13r
	 S8NZuQhtqkEGKH7v0qUpEJ6d9yW22083UT2r2cvi3u8g2s9kgASOctcUYNbUvHePI7
	 PJSx3vMXMvJdjpgBMrORQ0AsnOK6685hbTDmg0/8ibCfBkEAuh6yCxb5SG5/VmmBF9
	 TLxblOUeAmHtLb9riZUwB8I+a2vuPnhjb605qXoOX3XIUzsiqUIgrDqfncqiQI+ZA6
	 rGfwBSJtO+5g8kajcNfwqXxIlD45orB3h4e/Wv3UKC8abSQlTLQ9pI+pHb6M1hlH0/
	 VBCezV3wFpTuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB202380A959;
	Fri, 13 Dec 2024 17:00:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Enable Amazon Elastic Network Adaptor
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173410923349.3098520.13968329365229847138.git-patchwork-notify@kernel.org>
Date: Fri, 13 Dec 2024 17:00:33 +0000
References: <20241212-arm64-defconfig-graviton-v1-1-86830c3d572b@kernel.org>
In-Reply-To: <20241212-arm64-defconfig-graviton-v1-1-86830c3d572b@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 12 Dec 2024 19:36:32 +0000 you wrote:
> The Graviton SoCs available in AWS use a custom network adaptor, enable
> support for this in defconfig so standard defconfig builds can be used more
> readily in CI. The driver is left as a module since it is relatively
> unlikely these will be netbooted.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> 
> [...]

Here is the summary with links:
  - arm64: defconfig: Enable Amazon Elastic Network Adaptor
    https://git.kernel.org/soc/soc/c/160825131614

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


