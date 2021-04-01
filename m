Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFE0C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:15:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2570E610CF; Thu,  1 Apr 2021 20:15:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F7DD610E5;
	Thu,  1 Apr 2021 20:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308144;
	bh=jRxT7GFVZ+qWDGOz2ef0sd29yoi3l/YWUWt7NB2aoXc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X7qzmQ7ju+6RvJBMQMY0YDqqlPVo4NiJwfaSua996wbqe/wHyuSwQGrMyjdvSxKA5
	 gXZJFy4AyMa0VTy5+ubQvrNz7xvYCSg9VsUHCkXuR8/PigHI5PtO/Ubis9vfSiV6Pd
	 0UTVKMJKhP+fDgupDJwJ0BRFDvDiOKJIO6iuOcrqQRZ2Bsi94Zdp4GDxhWMueYGSvh
	 Vtj60Xl5ue0G+6CkPKAhXUC1MiRuvWS2yvZytkYDpFysXuNyGu0u6Vuc/IV+mlYOKb
	 fTzgxDR52o2PDNHr5i9k4u8APuA9rsm04m7DcCgoVosSRLzc3//pYJKTlMwTsOIExH
	 LXwiey41L75tw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	olof@lixom.net,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 5.13
Date: Thu,  1 Apr 2021 22:15:19 +0200
Message-Id: <161730808616.655497.2246714520571394134.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330184006.1451315-2-f.fainelli@gmail.com>
References: <20210330184006.1451315-1-f.fainelli@gmail.com> <20210330184006.1451315-2-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 30 Mar 2021 11:40:05 -0700, Florian Fainelli wrote:
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.13/devicetre-arm64
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 3b73ea6c8069a616be468d00c7ba6148bf82dad9

       Arnd
