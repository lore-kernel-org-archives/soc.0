Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C79EC433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 19:53:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1D965610F9; Fri,  9 Apr 2021 19:53:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDB8D61041;
	Fri,  9 Apr 2021 19:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617998012;
	bh=v6nUmdl1FyqeR/gbdTDVASemOFhIPW8qw0rEF1vQQk8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GBbGH7unGrEJTJ+cM8LCNYdM1QpK5s8xeU2Pdai07bmks5Uq/Ngl1ATzglKedS2SQ
	 N8Dz4/SF14+Sga02w4XyHYEz9V6aks5PVEl54seanvoJkmhXRDZRlDUzDHigBxocNg
	 g9BFvLkMDRyNwhOOakOEJt7uVMrDkq1fqkrDyBkCplvD5Zv1ESkPzp+nZspD0UieYA
	 n/0hlkRcXYFd/h57aHkFk3tDVp1lwHM4c9ifJFPehICCKmlC64c/hWpWj1C6h42YF6
	 1WZ3fxJhcRdAOQvQ9psT4XWCfg37FZXUUu7wYQrfkLIJfkYrz4Rvp5MduDaeHw16tU
	 XBpDGdo9R2CUA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH RESEND] MAINTAINERS: Update ARM/UniPhier SoCs maintainers and status
Date: Fri,  9 Apr 2021 21:53:28 +0200
Message-Id: <161799800546.1861864.10407557042981451153.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1617986171-20346-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1617986171-20346-1-git-send-email-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 10 Apr 2021 01:36:11 +0900, Kunihiko Hayashi wrote:
> Mark the UniPhier platform maintained and Masami Hiramatsu and
> Kunihiko Hayashi are taking over maintainership of the UniPhier platform.

Applied to arm/soc, thanks!

[1/1] MAINTAINERS: Update ARM/UniPhier SoCs maintainers and status
      commit: f72de385f8c38bc76269205d3a7d09d446829d02

       Arnd
