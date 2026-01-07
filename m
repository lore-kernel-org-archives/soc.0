Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C240C346A1A
	for <soc@lists.linux.dev>; Wed,  7 Jan 2026 17:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767805413; cv=none; b=FnIq8fcfD0gWKYy2MIF0rmwD/iZHEg8MiEK2DAghDgDDtsfr5B1bxQCFCIl5FhoCP4aV+qA+rBmrfM2x/qfhDcAmh1rmKU7YqmBp7dyqNtf9licHfLzTI6K1SjA7XuCv/z6cQkLPk+G/O7Mv3qWz66t/V9vuUlNcYligbsAh6oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767805413; c=relaxed/simple;
	bh=cdqPJw317LGTZDyslTiGJ6NBsFHuK9BySDAWgGRhg2A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DqRsTEk7MhdMC79Qi1tBVHj8o6ZrpN7gehdsCdR4K3d7XPiqoDUNLAjg/OXry3cx41sAOfOI6+b0S5rH5oN0pHLw2l6V3arL5zEog3JillpIm3mdiDbVRzcYD1QGnd9Tr9BEwpKYwT6jcprkcYVRhfObbINJfpnDfs8fWBQKVs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJgIqPfH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJgIqPfH"
Received: by smtp.kernel.org (Postfix)
	id 7679DC19423; Wed,  7 Jan 2026 17:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6110BC4CEF1;
	Wed,  7 Jan 2026 17:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767805413;
	bh=cdqPJw317LGTZDyslTiGJ6NBsFHuK9BySDAWgGRhg2A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WJgIqPfHauBd59lNLrTd6uRkAhNRrLWj+rTsQ6IhSo+LQr9welwIjOIQPyYQbkkL/
	 /uht9C8XYK2UnOey2d+JxZHOjm/5+7P5/fEKzZ7kSv4TtYrts8oc8/YCD1T5OZdM14
	 DdeFAuHZeWO5684kO38alYW+fjKV+ImXPyLozvfm3JoCeIcmnC2l27Kd1ihO0acajC
	 nHY2pPq/IF2I4YCQlmyRXHTxUQNEAgkrxhMCF20D51g6FED+skghsY5UM6F6EKOljM
	 7xcLfT5nfS/Ocyqc0tkHVmUP5DBdKiT5oIAqaJlJe3/5pmc/4ti9dd/rkzPQb4w/Dn
	 faYgsgUiVAJeA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5C2E3A40FD1;
	Wed,  7 Jan 2026 17:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: hisilicon: hikey960: Drop
 "snps,gctl-reset-quirk"
 and "snps,tx_de_emphasis*" properties
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176780521052.2859028.17526705276663099643.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 17:00:10 +0000
References: <20260105174002.2997615-1-robh@kernel.org>
In-Reply-To: <20260105174002.2997615-1-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  5 Jan 2026 11:40:02 -0600 you wrote:
> "snps,tx_de_emphasis" is supposed to be a u8, not a u32. Since it is big
> endian, 0 will be read rather than 1. The DWC3 Linux driver simply ORs
> the value if "snps,tx_de_emphasis_quirk" is set, so the 2 properties
> have no effect. (The driver doesn't clear the field either which is
> another problem).
> 
> "snps,gctl-reset-quirk" is not documented nor used in the driver, so
> drop it as well.
> 
> [...]

Here is the summary with links:
  - arm64: dts: hisilicon: hikey960: Drop "snps,gctl-reset-quirk" and "snps,tx_de_emphasis*" properties
    https://git.kernel.org/soc/soc/c/bf104037ebd5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


