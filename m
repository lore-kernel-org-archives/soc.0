Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E0B51DB17
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907831; cv=none; b=C1K78uBBBoMpyCODxp8NQ+o+8wt6LGj+RenxpeL2X9sAWa4vZuPMXrE+sRCrqc/wWX2lun4HAFOLKNvl6C+RiP+Ljz0P+vBKhC6iX0vzfHZU0kqL944nY348OI/7Ou0tR+WU9unuAAjjEflzGbjCV6rBc4pFcqsVSxSAkV0YiSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907831; c=relaxed/simple;
	bh=6aM5OwAe2tVF0L1g+/qzxehngJQSsp4w7KFYe3BJkTE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FPiVDFFEslnBeZR7NocnV2ZFg8mWPWd2aCigOoH0XK3ShknAwrkF24hgZC7GCesTnBSWKfHukvFxzorEn20LGSj1KPcMqFVPujBTzKaOEBXIzOX6hnrmr2n/zA9RA/6l53c8CwLgtgxldG56U+caBXIM3+0aW5ITYoGOzFF96r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A329KtJO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A329KtJO"
Received: by smtp.kernel.org (Postfix)
	id 5BE041F00893; Tue, 13 Oct 2026 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FC71F000FF;
	Tue, 13 Oct 2026 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907830;
	bh=8XIkN5AngF1kl8PHoAJ/lGDvvoPwSXFAHb1FKstBeWo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=A329KtJOELc1oiqroDAvURu35zSWajHR2It85d7PbEC7Zc7nxoKDnGEgGEA/vTAlI
	 LFuPiaUSQ8LNSDhKoH+c2QTnjN3VONtQY+fZXMJ8l4Egnwsy1nye6rmEr9ArzYp/DA
	 pGUJyf6A6H9W/qnbzvHbf3rowhHZOyTujZAXE98hLxTUcdO8Xr/x/kVfL46Ip+3ifI
	 RK+H9PWkzenKVZm1pFoPSSPd+Mc3sHOqxxsz/PJJxV9VFZnuWxvzJjW5YAfSpnt3LY
	 Oo2oKFsZUrW4pmfM3I8Y0affkYDGp9WzQjNPlpDMvORS9+sEmPLc2D7XQPRoit07DR
	 EvnAZlqKjR2Qw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2FA39D5FD8;
	Tue, 13 Oct 2026 16:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] bus: arm-cci: Drop CPU node reference in
 cci_ace_init_ports()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190782882.417156.13700588876464951575.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:28 +0000
References: <20260923163536.596107-1-oss.patchbox@gmail.com>
In-Reply-To: <20260923163536.596107-1-oss.patchbox@gmail.com>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Sep 2026 12:35:15 -0400 you wrote:
> cci_ace_init_ports() looks up each possible CPU's node with
> of_get_cpu_node(), which returns the node with its reference count
> raised, but never releases it: neither when the CPU has no ACE port nor
> after the port has been recorded.  Before the commit below the loop used
> for_each_child_of_node(), which manages the references itself.
> 
> The node is only needed for the port lookup, so drop the reference right
> after __cci_ace_get_port().
> 
> [...]

Here is the summary with links:
  - [v1] bus: arm-cci: Drop CPU node reference in cci_ace_init_ports()
    https://git.kernel.org/soc/soc/c/41d6c0fcd4d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


