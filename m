Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A35314884C
	for <soc@lists.linux.dev>; Mon, 27 Jul 2026 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142242; cv=none; b=e76LLLVcLCwz7F0xR+sf1yvaVGX1aQK7PFn89TvN4P0LFRMUobeTZVbduT6qcK86nBApWaoLgx08vQDQL7el+cy9Otxm9agG3SqFxtDbsJAtw/L6YWg7OTAiJmd72tpjnmQeKtcu5ynZupTLNg1pOl2h4fbPBhcwBSR82dAJTps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142242; c=relaxed/simple;
	bh=EfaEj5iOpv744ci4hCevHl7tzDwMGmYQG1DqBn/IXkI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=VoNwSk0OboKrvp7HeUomMYgWOrCHQYRQvvIjweRS01mSWltfhjjpd2L+Rnopvwew8pMHGPYUkAzvBW4b1binrRn8xcXlEMZG8Wb8658BqA9Vvas/vROue9R3pWok6ngY/ZAgb74aZJzyPBa8fgxgMqwmF0CSGriBRHSePfi6jSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxVlx5+g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxVlx5+g"
Received: by smtp.kernel.org (Postfix)
	id 3872C1F00A3A; Mon, 27 Jul 2026 08:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2280E1F000E9
	for <soc@kernel.org>; Mon, 27 Jul 2026 08:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785142241;
	bh=uCztH8rBHFqq8tWN7PY8QNA7HMAlcuWzePC3CvoSqxU=;
	h=Subject:From:Date:To:Cc;
	b=hxVlx5+g5puqytQPZV4KoVLltj41UpGjbREBmoB4Uuhj32etwcIwXKSFnmxfqIHmc
	 rwWfgzjrkWHcxCtv8mvtU2OCWb+gVVjHNWU65FcetUPZp/AfZNa/jhWiAdQcueOhOE
	 o8fXFooeMfbxj1Np5Z/ZxUKayWfrwnvzKYUpQglNzcL872fniOb9BcVmo/LQl7cCc6
	 /3jgWTIu0W8CxHIz1xmusxosFvdGtpqpTZvQOtQT0EZvhD2j+KfFJB3Ve9GMOvNnaO
	 sk5JNWok4MNFsgkCroc0q5g0XxZooXH+uS+I36X2eOrrd5cwFUVHW53UPA/aATc7m8
	 its+AGcsJcHoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D314A3809A0C;
	Mon, 27 Jul 2026 08:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178514220644.691241.126636854646786379.git-patchwork-summary@kernel.org>
Date: Mon, 27 Jul 2026 08:50:06 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] NXP LPC32xx ARM changes for v7.3
  Submitter: Vladimir Zapolskiy <vz@mleia.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1134217
  Lore link: https://lore.kernel.org/r/20260724212426.414433-1-vz@mleia.com

Series: Renesas SoC updates for v7.3
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1128716
  Lore link: https://lore.kernel.org/r/cover.1784194401.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM SoC updates for v7.3
             [GIT,PULL,3/3] Renesas DTS updates for v7.3


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


