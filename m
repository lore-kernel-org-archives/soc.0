Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86A6C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 17:10:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B36D623B16; Tue,  8 Dec 2020 17:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607447422;
	bh=gtoN9v1swEWZtA3TCVwynbER75CD5fkODb1tdqEPMvs=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=hIwQtMci2OOrWIBHxQMvw7Z0NS61eiTopX9VxPbOZgimc/TQ4DuMPYzX2vpT9eFKc
	 sM27cH6olK+E792BdA8SDi0Iw11KiDBMELm35W5XZZK146LBlUbfBxbtoDytBzUv1/
	 64w/8tHEsktdIlxeEb/bjetaAUR11D8fNuD/i3t1EjVFJXkwcrpI3A+BR+kcq6Ynm5
	 jE4HuvE7Q80wNcbpkyPKQ22h4TfIS9/RqZI5ugVgffOh5HgzPgDUCSQq9DcQxaihVP
	 RFe/0KPqCG4Tancv37Js9cdBusApBNLcpftlRuENjKUWrX57x8/DXl9ALFIFJuQIAi
	 RiF0y8hFnBatQ==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160744742249.1206.4957450424368902900.git-patchwork-summary@kernel.org>
Date: Tue, 08 Dec 2020 17:10:22 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Series: [RFC,1/2] MAINTAINERS: correct SoC Git address (formerly: arm-soc)
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=394225
  Lore link: https://lore.kernel.org/r/20201201211516.24921-1-krzk@kernel.org
    Patches: [RFC,1/2] MAINTAINERS: correct SoC Git address (formerly: arm-soc)
             [RFC,2/2] MAINTAINERS: add a limited ARM and ARM64 SoC entry
Patch: ARM: keystone: remove SECTION_SIZE_BITS/MAX_PHYSMEM_BITS
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=395875
  Lore link: https://lore.kernel.org/r/20201203231847.1484900-1-arnd@kernel.org

Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


