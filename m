Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF951E3DC7
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644343; cv=none; b=S+/F929Z7Fr8Lc4lvoUMtPw2JculhzBhnIzesTlUIThkDI/ywSfCGIO5irHBYUJNecM8oTD10OKYrBVu6ImlReZFtgDb5Vm9cHS7ivFk/TZBSAlQ7jzZuuxTwAfqY8D2HoqGb2y94n81qsUnXqeqyHhSLGgUnkQmxlGuObtOapk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644343; c=relaxed/simple;
	bh=lZ7eocr8efQqrG0jw6ATn9hSSutbX5N6nC8fh6nwL3w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FkYwW+RnmMg2BNhof4aOZVz7aY6nSikmIa1U9N+VDrxr/lOoS7Ilj9roELnoeTgzmqc/7jRnPxuSAvfUKdUBVWoygy9ypeZAif0kwS8ZWAPtQjBsSZQU3uM09tliq8NFZSfa+Tca/rFeWtbksuZ4XvEpccsmW2yHliSVAKi2IIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6Jo6ODr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6Jo6ODr"
Received: by smtp.kernel.org (Postfix)
	id C1450C4CED1; Fri, 11 Oct 2024 10:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A717CC4CEC3;
	Fri, 11 Oct 2024 10:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644342;
	bh=lZ7eocr8efQqrG0jw6ATn9hSSutbX5N6nC8fh6nwL3w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=K6Jo6ODrSrtENQY50PHe+MxiTO2qwJhzGMqhutRPhErasfG6JvxGRzzx6+jZjSd8u
	 d4EZ6e+WQUVio7pvVvYLY6pr638vd/o64b752Sqc1V/ABnUvil1tS0vUjozObo6RZb
	 TDmYqTchLwgoyTk6VP5HAwMB24sKYxfCFhDGCS1AL70mC3dcORJW5SYMAmxyV3czWe
	 1Y1rwO0kZRG83oDVIbWBUTDy8tMNvM7m+BePeGcMapBGDpIMX+lgk3yb+zMhuQLVLu
	 vExkC7Pcglvl8nycJovG4gtq462s0XfkT25hmzXLtT5UhYgSCsNIhthaBb6XHEblvQ
	 HGLLVwZbKTr3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 717453822E4C;
	Fri, 11 Oct 2024 10:59:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Broadcom devicetree changes for 6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864434726.2676212.13828028487176910757.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:07 +0000
References: <20240906180643.2275460-1-florian.fainelli@broadcom.com>
In-Reply-To: <20240906180643.2275460-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 Sep 2024 11:06:40 -0700 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.12/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Broadcom devicetree changes for 6.12
    https://git.kernel.org/soc/soc/c/ceb7d8adf640
  - [GIT,PULL,2/4] Broadcom devicetree-arm64 changes for 6.12
    (no matching commit)
  - [GIT,PULL,3/4] Broadcom drivers changes for 6.12
    (no matching commit)
  - [GIT,PULL,4/4] Broadcom soc changes for 6.12
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


