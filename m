Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32DE3ECBD7
	for <soc@lists.linux.dev>; Wed,  4 Feb 2026 12:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208214; cv=none; b=BUzBuOPPqQ+fMHjWfdPalCdBn5VpHJWxokHUdgE/TFhkdPB/vbrgE1fErYpqISFNpdfNjfmNktlQ+yNfIaAKUnrc3nynSnae/7HC5mPQGp2HYie3YZKEr4udZXuWg2C+WaT9dEP/tutx6lZvYCvs5AcZUab5JEREVwYVa/8GaMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208214; c=relaxed/simple;
	bh=wwER8WTJ7R+K7ZPj2aTyLamjwwEyTU0Vw/DmCEX3AD0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=liJGpvXDIxeUvFHwvkjuh6d+ADDYlQZ4HgoopqK7TOcmUfUKalu4xFNZcIRIkRoLEJznbtmXatgdP2knEEhO3qvy85YjCVB3scOE8r0sOBl2dZMaB0niGVHJIQDFCG2O9UFvMZoexjsZUzC35jzDvl5TBAy6D6ZK8FsP0uxzccU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdJxl5nw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdJxl5nw"
Received: by smtp.kernel.org (Postfix)
	id 9244DC19422; Wed,  4 Feb 2026 12:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B8EC16AAE
	for <soc@kernel.org>; Wed,  4 Feb 2026 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770208214;
	bh=wwER8WTJ7R+K7ZPj2aTyLamjwwEyTU0Vw/DmCEX3AD0=;
	h=Subject:From:Date:To:Cc:From;
	b=gdJxl5nweTwxsMVLQVt2oyeXK5lCWShlXFzIqlNW8OUV977x51udP2bwVxtRUf48u
	 lY/j+6NcTpFz86zyMay0S1eTwBCl73SVVJjcCQTjQ7gWKJAImdRsA+izZXQAB24rWT
	 DMG5wCI3DIGEBnWU+w52id1g0BefYHUSjJTi5nox+RdSWRAkr6EOT9Zaooc46FNeUH
	 xze9G1SvHpZZ0q1/HFFYJ+6XHUjvWU7A6W4fIsr1vUrV5kpUTglXD3+/4/VqpTAeoN
	 1eZggQ7ZH/DqQsdeMWW4Skr5Zl752iwmpnm3ASGhroRoFIpJtxmaJft78de5yYjiMV
	 2EHQsyTX/1uow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939C33808200;
	Wed,  4 Feb 2026 12:30:11 +0000 (UTC)
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
 <177020821011.2322890.8395984733909795801.git-patchwork-summary@kernel.org>
Date: Wed, 04 Feb 2026 12:30:10 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] SOC FSL for 6.20
  Submitter: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1049247
  Lore link: https://lore.kernel.org/r/3bc83479-015b-4367-9eef-7d8ca6005578@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


