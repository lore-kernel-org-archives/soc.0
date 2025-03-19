Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9189621481D
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422307; cv=none; b=B+OAwfR8qWhloWNwAz4Ej3XLjyQQdVswsIGgfkE6ILp+JlpM2KExa3Sp/B6LTeZP8xkPQxGg0cyIwqPLFVSiZtuCvDnesxVPdARyyAPs21lvbFUWBLqN/t1fuRqnisOUtX9X7YQMiVTX7RMJBjSDjeLdINIW17jEsn2EZ0+GVn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422307; c=relaxed/simple;
	bh=sVd0jxm9gMw2u0PqzgWSP8tahNi0rN1RxKGD87NqdmI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cAyk+aU46oTmkKV1u/fIxYA2KiKGriMTD5zwK0JOZVMVFHGE0IiX8kFGhuQ29YLTHalRmv9xzkJgYlvwVR0WD7Ya/sartI3XRd8fNjQVw9v17Zl06TtsYEcur9vQzkq/43lTjwORbAHcYftflwtDQY4NoX+lS0sk5CsOb7mwjzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlPldf/A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlPldf/A"
Received: by smtp.kernel.org (Postfix)
	id 8961FC4CEEA; Wed, 19 Mar 2025 22:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D43C4CEE4;
	Wed, 19 Mar 2025 22:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422307;
	bh=sVd0jxm9gMw2u0PqzgWSP8tahNi0rN1RxKGD87NqdmI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nlPldf/AEPuplMhE5e3JSiDMlC9qIuHfK9MfAZP5HcjH86dpQSiX2Giu5i75goupe
	 kd0JIKS7fa8HLNe0uNYCipAbTd6hDTxhphaqFlJSsouE4CR/+3EY2bnpIB9F1gZEXr
	 PCsSkUMtJ3fwH3hiGduGrtLQ7tLDxwwUisJ9EiaS2VNqtrWr4bYc839QmGlLq9KU50
	 nDobvxKcQnpZ5JMHArPyNtDPlWwlIduee860xozuihNyUzalxp9ME4JeySonZemCZj
	 t93tf1vgoUsNkRLxyIgf7SAid+3FO5JCHYuo/HDkH442DTM1vmMho7qUQg8qXPLFmc
	 BT5FmhGnXq/yA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DF43806654;
	Wed, 19 Mar 2025 22:12:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: zynq: dts: changes for 6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242234324.1211847.7948145312964487498.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:23 +0000
References: <CAHTX3d+DZo3thrakBf=QCq91QFeChoizuhVa6oBBj9E+sdEXAQ@mail.gmail.com>
In-Reply-To: <CAHTX3d+DZo3thrakBf=QCq91QFeChoizuhVa6oBBj9E+sdEXAQ@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 14 Mar 2025 15:54:16 +0100 you wrote:
> Hi,
> 
> please pull these patches to your tree. The most of them are just
> aligning current descriptions with DT schema while also adding some
> description used in U-Boot which also went to DT schema (like u-boot
> node and QSPIs).
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: zynq: dts: changes for 6.15
    https://git.kernel.org/soc/soc/c/a1b46780e496

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


