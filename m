Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1FE1D88B4
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 20:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037013; cv=none; b=YHS3HaKNK5zaJVx88jid8/e4+k4aC+FeY/MgnntV3imc+pMCPniIyCTbVai/0FUBsoPiRT5XaWprV1dIWng/uwEMXjjvQkyLNkmcLF1CyjCC6Vt5i2XkTZgZcTMgX2HTqxgDS5/F/0C5oyeEIMYpkqB/rUJzEHcVT7+bn6ZC2a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037013; c=relaxed/simple;
	bh=4cZYWDBZ0jhETSy+VnjskWqXaWLVIXFYpICy2k0f0n0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=r3rHPitWXCoS4WxAKOcBemifaovYfQ4qfBsD4R2HEtT3XTDi1GB7ea42yVEG7u/VgS+yvLEUCJpDShNcqAXITmJzTKgiVYbty8NpPzmj1nBK6PHuxO6PD4JUNAKWNXOiDpOMWL8Jz5C1hqF5cYmpgABhGXMeuh+j0iudkdPIS34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIuF9QI1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIuF9QI1"
Received: by smtp.kernel.org (Postfix)
	id 71DE31F00898; Tue,  9 Jun 2026 20:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1E41F00893;
	Tue,  9 Jun 2026 20:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781037012;
	bh=Jtc5C0JJELAGtwcV3cj5c+45snbI3WXaxAuAD2ESr3U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UIuF9QI181cALaiEtpAKu+PW+Kq5OaL2OjnQHUkumPJdRUxROe602lfk/g5QZNbZQ
	 Gb0EoMIZXX2pyntr8MilKxsnRe5/ewxh0lmQhIyDo+nRa3irLtCxZM9sV4k3sW46OM
	 g/V+pDF0/IdBcpppZpcwZ6o7M3SUVNVsg+EkvVXi7AK/vTQINLrpf6nbkslEBgE/7/
	 wJExbZEUZV1rjq6hTEfsqlrgmpOiyKMe29f6RFw6moIXge1a5L8v/kj4Ua1MwB9zoi
	 Zjl2W0CGR++QDQlQJFYThNo9T+9Ed6F1MFYCWt7afPDM/r1RbEe0DYf6CrcDUayhTz
	 BsKMYYMhzuyyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09AB3930A09;
	Tue,  9 Jun 2026 20:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: arm for v7.2 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178103701038.2631762.17650698298260527483.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 20:30:10 +0000
References: <87zf19atxc.fsf@BLaptop.bootlin.com>
In-Reply-To: <87zf19atxc.fsf@BLaptop.bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 05 Jun 2026 17:27:59 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for arm for mvebu for v7.2.
> 
> Gregory
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: arm for v7.2 (#1)
    https://git.kernel.org/soc/soc/c/c28364c9831c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


