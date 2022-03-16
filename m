Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E271AC433FE
	for <soc@archiver.kernel.org>; Wed, 16 Mar 2022 20:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B32D8C340EC; Wed, 16 Mar 2022 20:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98B64C340E9
	for <soc@kernel.org>; Wed, 16 Mar 2022 20:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647462010;
	bh=U9d4Y+SEj/6oC8MsIR4M3/4S58iv8R85G4a/CgWw6Xo=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=XjveFl6qthwHpmk9x3+CgrGOHAwowTibw0jwXRt/Sdp4H5aco5iDzObvdQSEhusfT
	 6CROPsh+63Xr5Et4G07dilp3MqkboZSSMvROjJl+Kyabot8ftaWiev7N5RFmuEhAzA
	 FDBltqkxRM7XTj0pbeDD2zeChjtKB3xKsqmmqtJz0CpmtSTMs3gfWoFz8R3++2X3wq
	 J1M2lOAGDlo5G8JJVrVU/6dc7tWRUlklq8S48SSoF7IeuESUe2wk08n+s2G5lNQ2Tt
	 UImGrR6yMyK1larFi831LRcCLFokxtMjuxEgqgKMkOtOzXW8teLYsTszRkTGKI16d6
	 lILDZJvIB5dpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79E4CE6D3DD;
	Wed, 16 Mar 2022 20:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164746201045.15675.15942907360220264613.git-patchwork-summary@kernel.org>
Date: Wed, 16 Mar 2022 20:20:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Late patches for v5.18
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=623943
  Lore link: https://lore.kernel.org/r/20220316154309.436028-1-krzysztof.kozlowski@canonical.com
    Patches: [1/2] arm64: dts: fsd: Add the MCT support
             [2/2] ARM: defconfig: add SMB347 charger driver for p4note


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


