Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A261E3DC7
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644361; cv=none; b=Hncwm8y5a3h/rtOD4auP0Xi+sKDsaF1KIdGqX0XnoyLZlUaNMc6AZj0uWzL2HR3/Vj2Bb1OUEEM/jFDvyl+mwMbHI38prGmYq0XzBmP/u2ew+pqZxmjsi9IqGzG7TekowuMoAuQaNVuwPd35EWMo3xrlGm0iAqSVm4x4hjgQZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644361; c=relaxed/simple;
	bh=m3k8RCq7GWzQWWSuoo4FaqRkpCZ6PLhCuAZv71PtR1Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HmrShL0tcqpHafvtjtHkEXVsmROj4MRDzAHLy37L0hwBZ8y/DwFoIHoTBi6l92Q39yfpAXG7kJSxYn3ZqZ65BM9Qo7lV6Mwzm3jT+I2dfmF8C4b2A/zYF5Qqt9DqiMHoAnxhJcaN+aAUg6igPG4vbPCliivGGc1s5LUtKCto+Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpFfn0eD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpFfn0eD"
Received: by smtp.kernel.org (Postfix)
	id B9DF8C4CECF; Fri, 11 Oct 2024 10:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F8EC4CEC3;
	Fri, 11 Oct 2024 10:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644360;
	bh=m3k8RCq7GWzQWWSuoo4FaqRkpCZ6PLhCuAZv71PtR1Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dpFfn0eDxXo5v4hZoa3ohHM1NkH2ep46QWDgoQx4UkkIq0COOrYn+3ZCAlbc+CMs0
	 9nfrrH/MSQmUbM9xlwRK0n2NPemPHFhem3Yu0pIlNxr2vb/J26flCo/giZGICKl0DU
	 yE3gKEo0H2JpE3ZawSo+sbojjh/XJrx2rUFCDOtC5wKyEdQy19JNwyIMVNJ9kDuOve
	 y2iV4d00bgSkQpC5vg0FVV/PrZjzwzMNDJ/B3IlZonfcEatMhL8db+KuD1fvIAVB6C
	 1m2TLsb7vHghPglioQbwM4IsmY3q/1IBRqc/lbIbxoqX9RfD55OxfMzjTXCkv7xyxu
	 n3mT4OlTlxgwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 712713822E4C;
	Fri, 11 Oct 2024 10:59:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864436498.2676212.2229891204866328863.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:24 +0000
References: <MA0P287MB28228F4FC59B057DF57D9A11FE9C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB28228F4FC59B057DF57D9A11FE9C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 4 Sep 2024 08:52:13 +0800 you wrote:
> Hey Arnd,
> 
> Please pull dt changes for RISC-V/Sophgo.
> 
> Thanks,
> Chen.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v6.12
    https://git.kernel.org/soc/soc/c/8456010c9557

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


