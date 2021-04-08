Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11EFBC433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:49:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D325361157; Thu,  8 Apr 2021 15:49:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D8EA61155;
	Thu,  8 Apr 2021 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617896983;
	bh=wsrGaq7lMt1D1s+OTUqLNmpDcaeia7PVJYghnE8512s=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CRuMnUokn+6/ij/dzppQWiotI1E9ZMJrUDbc8lG7C3+E61/C1p6UIDH5FZs8Z6ufq
	 Z+1CTxviLxwLeGtygFr8Qqxp6CNg60B09f530H9iO/X2kLD0t3AaW4349XUfVaEiMD
	 0ytNB3qr9ZTm6H+G83J/YUcj8smcWmtt2EzbHu8lhLUaoW0cYoMMrlGQo6Q+WaplEc
	 ARPmHquG0511z/MI5/u6X0DTNC5/4mKp6/7KRoaTFSX712h2AgL8I63gr1UlrwziH5
	 ThfQ1ymWHS/3+dz/3vJPDVGr7vbcTLU9CQE/zczaf3r221jbYLBByDqLrl+C6KWpCJ
	 WpvOe5E6AYMSA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] SoCFPGA firmware update for v5.13
Date: Thu,  8 Apr 2021 17:49:28 +0200
Message-Id: <161789693296.1636044.15606458085850254179.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210405155026.86309-1-dinguyen@kernel.org>
References: <20210405155026.86309-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 5 Apr 2021 10:50:26 -0500, Dinh Nguyen wrote:
> Please pull in this patch for v5.13.
> 
> Thanks,
> Dinh
> 
> The following changes since commit 4483397b03536506535d611b0cb28a81a69e8edf:
> 
>   ARM: socfpga: drop ARCH_SOCFPGA (2021-03-23 11:03:36 -0500)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 0ffc253e2e0ea7b0a1a6b73f019ba38dfe7a3e44

       Arnd
