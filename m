Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFC3C4320E
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 13:32:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3D69B60FC2; Mon,  2 Aug 2021 13:32:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4979261050;
	Mon,  2 Aug 2021 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627911178;
	bh=ucmNHyUJ8JCTHkurrtpLG9CfhbsZcAzrbSacjcGRyjc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uy8TKULkAE5UFJlbLWHRUxmRcPvRy84T4KUpmiNd/07HrMcMJ1LArioRCBUsz34xJ
	 IIblkdUCa0EvYDOGN8cdRI4mAwUAuNNhIEc0Z1pzKpu6eVn2FcSwt8mvo2Jt02sp/K
	 gIhCstj9fSIVhzzqcL5EUjIPHnHtuMHu+3X/RltM9jsR7Eo/j5v3tCq4gLN0n0FCZy
	 FD/NWjBIE9Hca1Aolk2/bCk0CyhpjMEhxRucc6IxHtFIM+nTl1ZXVvAZD0QpnwGfGu
	 m+d6vpCztHvIpNyBlGm/TETQQ8JRAXfCUphZ4gyKwR51BryRBu0xCL51cNvzTWGSdp
	 MleQ/dml8PHrw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sumit Garg <sumit.garg@linaro.org>,
	Tyler Hicks <tyhicks@linux.microsoft.com>,
	op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] TEE kexec fixes for v5.14
Date: Mon,  2 Aug 2021 15:32:41 +0200
Message-Id: <162791113532.1139989.17019256982120013702.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210726081039.GA2482361@jade>
References: <20210726081039.GA2482361@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 26 Jul 2021 10:10:39 +0200, Jens Wiklander wrote:
> Please pull these fixes relating to OP-TEE, ftpm (firmware TPM), and
> tee_bnxt_fw (Broadcom BNXT firmware manager) drivers in kexec and kdump
> (emergency kexec) based workflows.
> 
> The two patches "firmware: tee_bnxt: Release TEE shm, session, and context
> during kexec" and "tpm_ftpm_tee: Free and unregister TEE shared memory
> during kexec" are acked by their respective maintainers.
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 64429b9e0e1dc05cbe4f88076909fe0c4d2d29dc

       Arnd
