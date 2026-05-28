Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B251B314A98
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006203; cv=none; b=VrHlIkXxXsCPg7ihCOV9CqONKYh3Ak04lk8xvWYUalPM9Xt30F93Jgp+Anf7OCg6Djs4+rd+A2d9LGhYwPTVe4nnuMRdYl/3eMxYKjb1Ms2rDXS5WADdMsWgAL14TJnLO7Plc1iv/oVe9HPYKoRbmF5beHhAGEl8wSp5kt2yi94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006203; c=relaxed/simple;
	bh=KSoAZR2l3AymeIfJK9vtv1Bk+s+qJwmpxRNV3Ad9At4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=jlk1tXOBn+cY2b2TAwjmy3qbWWEe7Cw5XZuwRAobVcDKoB1UwrV6Y76LDbeosTVYvTGjwvjR4yJy21GprRmfE4cFGlbKwGWwPk91MMtxwtRHuoYye9Luc+JlckvnTt8P2MElww6Mbuspdpk6+Y5sgrWP6QMWq3fcQyJj/25Ab7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ey4zRkE9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ey4zRkE9"
Received: by smtp.kernel.org (Postfix)
	id AE0541F00A3A; Thu, 28 May 2026 22:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D751F000E9
	for <soc@kernel.org>; Thu, 28 May 2026 22:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006202;
	bh=zppjCNRa7esh96OA+l8mbsqqjWzohVKlHPhLzHlYoVk=;
	h=Subject:From:Date:To:Cc;
	b=ey4zRkE97pN0frdLoePhEEH2FeptVjbN+mjy0+zFez92X/9N/EKpxtZgIMtMBOlhn
	 mIRaoGeCXmcRA4D0ahGZW2wQNXJGzcForvcaRoidp+CRyExxtOdTE53kNNQmr+ndh7
	 qOCLIH1rDxaMbmDi01qGRcsKf5/yPdTTJVV0BVphfFBstOkiU1emdKr4/tYNr9Xooe
	 p20q01mz9k7e2kpUEH2TSm28Go9wa6XkYjG0cizYte1rZ5YfJdKiKaHSUWCJIHSZKU
	 nTsDXyIL4une6cY7kBf7JxSy8an/JegN0409HqjLQ3nbCZcY2TUtQq9X1z3BQdMZCx
	 HsIMKNv/bDtRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D347F3811977;
	Thu, 28 May 2026 22:10:07 +0000 (UTC)
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
 <178000620634.1533055.9213831162195657618.git-patchwork-summary@kernel.org>
Date: Thu, 28 May 2026 22:10:06 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] OP-TEE fix for v7.1
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1098826
  Lore link: https://lore.kernel.org/r/20260521141410.GA1708231@rayden

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v7.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1101051
  Lore link: https://lore.kernel.org/r/20260526145326.3243-1-andersson@kernel.org

Patch: [GIT,PULL] TEE fixes for v7.1
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1098811
  Lore link: https://lore.kernel.org/r/20260521140219.GA1707515@rayden

Patch: [GIT,PULL] i.MX Soc fixes for v7.1
  Submitter: None <Frank.Li@oss.nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1102431
  Lore link: https://lore.kernel.org/r/20260528190555.3779280-1-Frank.Li@oss.nxp.com

Patch: [v2] ARM: dts: gemini: Fix partition offsets
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1102099
  Lore link: https://lore.kernel.org/r/20260528-gemini-fix-sq201-fis-offset-v2-1-f594d3072fe6@kernel.org

Patch: [GIT,PULL] QCOMTEE fix for v7.1
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1098827
  Lore link: https://lore.kernel.org/r/20260521141522.GB1708231@rayden

Patch: [GIT,PULL] Qualcomm driver fixes for v7.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1101043
  Lore link: https://lore.kernel.org/r/20260526144748.2776-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm Arm64 defconfig fixes for v7.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1101060
  Lore link: https://lore.kernel.org/r/20260526145839.3800-1-andersson@kernel.org


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


