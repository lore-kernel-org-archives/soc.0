Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74DBC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 19:24:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 92EDD61001; Thu,  1 Apr 2021 19:24:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 140A1601FD;
	Thu,  1 Apr 2021 19:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617305068;
	bh=qD36HT3wr/JCFkj8VC2XOv41n8kMcWvt48FkkODJHlw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oLy6JIf9ca6Pc67LR3LVv2Ry2O5jsTLYKxMYSP7RwmKR8b2GB4CAtpoDmMXizsZ6k
	 vKRbux3IXzF96uGP9UtyXXvN2Wiey6YQ6vhUPI1N4zRemmJSkq+VNqrwgqn05AgRbl
	 0v6RrzZ6GmPXVB5W27v76W2go9vtUxTPGGAhElHJ/qwv/n+UPLn7zgkfBTIqU5fQjR
	 iRFMnuiKLxKmH1M3HbbPMhNT/dEOfsmXutbpmUxqnhByAL35J/nY56/fMOWOvi38WN
	 hiI6hldMUs73IEwNnmDHG5g2wm0+fNa5zKt4LFQq2VcVNjsGmRNqkoDeYmIkfkK8z0
	 JdxQ/8LozEBtg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org,
	Jerome Forissier <jerome@forissier.org>
Subject: Re: [GIT PULL] OP-TEE memref size check for v5.13
Date: Thu,  1 Apr 2021 21:24:13 +0200
Message-Id: <161730504488.632809.12872911046632269445.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330110037.GA1166563@jade>
References: <20210330110037.GA1166563@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 30 Mar 2021 13:00:37 +0200, Jens Wiklander wrote:
> Please pull this small patch for the OP-TEE driver to remove the invalid
> size check of outgoing memref parameters. This code path is only
> activated for a certain configuration of OP-TEE in secure world
> (CFG_CORE_DYN_SHM=n) so this problem isn't always visible.
> 
> Thanks,
> Jens
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: d6358a687891dacbe7d88541a83f61bdccb4f7b8

       Arnd
