Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC6A339863
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159579; cv=none; b=ICS8qNUo0KGGEg7Pc9qJKxfx4hJPs72QSEWbmiO97834BzgkcxcbW8ZwnXyoS9mg5YlyyHvhZNVhCKbwRdYofrjIhavaUzm+0KI/tYGMkeqK9zhZXcgzUnprEiFzEXeFQkvA1k0cXKCGiYvlkmhlgenwtqtrXGSc8eCilcsNaMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159579; c=relaxed/simple;
	bh=7SxElOxkQ/LI/sykEqP5ZahdYQ6G7oMZL5jccTjHXP4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MhOlYjROy9NqdrekCOcHTuaaFUrq9oJgwzGndhNooevhi3nmHN5sli6B1HqiVnqbyLY3ocGjngH1JAri2lOzgu0TWAzlOa5i6qoqbJAa5R8wgs9vtVUQFi5t3WAL8jF2B9XMfToCq2Zy5g0qBsIGPiX+1fTzh6E13uOd3exQRhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAk0SxVl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAk0SxVl"
Received: by smtp.kernel.org (Postfix)
	id 9FAB4C2BCC4; Thu,  7 May 2026 13:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3D7C2BCB2;
	Thu,  7 May 2026 13:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159579;
	bh=7SxElOxkQ/LI/sykEqP5ZahdYQ6G7oMZL5jccTjHXP4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LAk0SxVluY5QTT760A42yDG9iGV0t+ijZSPYMHzES1TeyQrNapjD0AUYkATQq3tWE
	 WTPgtT3KUdNu4ta9ynXy+F1/I7cIvqyg3JIJrErvKZnk2X1RydomZUybcLfWYOq8lj
	 V2sJPcn0RHiAdmlUtEqAS5Y2sDIq+gr8ov5b7hoZwEKazreJIXY54i89mvSRh81qe5
	 2FQrOZSUhAkN2Hygfv2XiXWhkBexFT/JvBSKvvKNJ5UIKMsBiWuqhMfb7/2oPGWQMK
	 JGVODfQMvBzxgYA+vAjvsrMzn2nYlv9Ct2BVP0bz5gIEe8l0xeE+4kl925SHhSXmpf
	 KA3gRVfnAaE/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02E2B39308F7;
	Thu,  7 May 2026 13:12:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/5] arm64: defconfig: Cleanup and change Ethernet
 drivers
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177815952879.3933061.1770751229123681887.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 13:12:08 +0000
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
In-Reply-To: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 29 Apr 2026 20:50:21 +0200 you wrote:
> Changes in v2:
> - Drop patch #5 "arm64: defconfig: Drop AMD XGBE Ethernet driver",
>   because the XGBE driver is used by enabled ARCH_SEATTLE
> - Last patch (switch to modules): switch also IGB, because it can be a
>   module, since I2C will be built-in. Switch XGBE to module (it is not
>   removed now).
> - Add tags.
> - Link to v1: https://patch.msgid.link/20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com
> 
> [...]

Here is the summary with links:
  - [v2,1/5] arm64: defconfig: Move entries to match savedefconfig
    (no matching commit)
  - [v2,2/5] arm64: defconfig: Drop unused legacy netfilter options
    https://git.kernel.org/soc/soc/c/a54929fb60ed
  - [v2,3/5] arm64: defconfig: Drop default or selected drivers
    https://git.kernel.org/soc/soc/c/fda522fc8748
  - [v2,4/5] arm64: defconfig: Drop unused Ethernet vendors
    https://git.kernel.org/soc/soc/c/32379ad4060b
  - [v2,5/5] arm64: defconfig: Switch Ethernet drivers to modules
    https://git.kernel.org/soc/soc/c/d521c4ca039f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


