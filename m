Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609173D9DB9
	for <soc@lists.linux.dev>; Fri, 12 Jun 2026 07:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249408; cv=none; b=buj/hNLa1Qb9ydZFOZy1RbtAY7z5xr05XDL+O6fUwuqBTRb4kofX3CBUldSUQUW91Pg3+MsfLNjP15pWx9rTLCdkk4oU1Qa4YygAeCeKj2JQ2BQBQW1c/POeFhGwymDwKd7W0KTTU3h6myJr0F/vj9ZMUIMWamvuqeibbD1pH9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249408; c=relaxed/simple;
	bh=YEfKryLRG8Kc/XdX5cMCnHL7lfh9FjAq45x2+XDL+54=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=SK0OFjln5o6J2Vg4i6wCBbx9n/UEBhAXNjUjGl7l2+ApLro8+860x494dZRe4SV4atZqI5DhN9AwwCo09oNZz53oPaXBd20k9rKP2vXlJQ7dk4xtrxNM9Y9cu3EJlNnkAE0FAnIOHQsKS2ME3yK1dxnuhth0ydOzhcOOmH5quc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdZRlCMY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdZRlCMY"
Received: by smtp.kernel.org (Postfix)
	id 135701F00A3E; Fri, 12 Jun 2026 07:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F074F1F00A3A
	for <soc@kernel.org>; Fri, 12 Jun 2026 07:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781249407;
	bh=j3KyVriGg8LEGT/+n1jeG6kK9yPTHoovu/oyHH7wTuM=;
	h=Subject:From:Date:To:Cc;
	b=VdZRlCMYW+1pTcpOpZ+muPLNYuI+5FgUVdNNifP58OVhlM9Fp/sK3hCdr+T4iCgsf
	 iDiEundWqfBtjckbPzlWa1MKrk47hQuHUtfaJ340KExJABLG1qnYvaB9Xie85Urv4H
	 MRvmoEOomQhrBr/DEaUE5p2olFsl+/GcmJuCBWiZPIf9UCDcK4iNItEo+TC3OFUrBC
	 aHHJxlDGFA3uQLLi0uHzBuU3c/A/tREShQIYftadWU1mAoVcSzcslGG4TX7ufxX2XZ
	 YSzPIIMQHu/otHV18bqzUdG6UzwuItnui13uF/hl1fTYxtVDzDBTBpJ673QLtAn2sO
	 Z295PyizBTYKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C11E3931000;
	Fri, 12 Jun 2026 07:30:05 +0000 (UTC)
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
 <178124940366.526649.1081696694845956633.git-patchwork-summary@kernel.org>
Date: Fri, 12 Jun 2026 07:30:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: arm64: dts: bst: enable eMMC controller in C1200
  Submitter: None <gordon.ge@bst.ai>
  Committer: Gordon Ge <gordon.ge@bst.ai>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1110388
  Lore link: https://lore.kernel.org/r/178123037729.455092.8454252669856079676@bst.ai

Patch: arm64: defconfig: enable BST SDHCI controller
  Submitter: None <gordon.ge@bst.ai>
  Committer: Gordon Ge <gordon.ge@bst.ai>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1110389
  Lore link: https://lore.kernel.org/r/178123038058.455092.2553110009023696912@bst.ai

Patch: [GIT,PULL] arm64:Add eMMC controller support to the BST C1200 device tree
  Submitter: None <gordon.ge@bst.ai>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1110476
  Lore link: https://lore.kernel.org/r/178124706736.583168.7192372166865774364@bst.ai

Patch: [GIT,PULL] arm64: BST C1200 eMMC defconfig for v7.2
  Submitter: None <gordon.ge@bst.ai>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1110474
  Lore link: https://lore.kernel.org/r/178124682783.542254.4976938369452006836@bst.ai


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


