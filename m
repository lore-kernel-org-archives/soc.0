Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57ACC433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 22:47:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8862E64E31; Tue,  9 Feb 2021 22:47:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5417364DE7;
	Tue,  9 Feb 2021 22:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612910856;
	bh=GxyReVb6FlPGpkfTjkb2isnODz14oYAH5DEalWelaEM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z+Iu/5u0+Ersgt/GwpbO4mg5aUr5N91xBWIJ9Xs1evMppRfwx9xZy3kPjmQ0daC87
	 XDKj69QBvWu0LBNbvk2aso4TuDJjXhecofntmmgXEMXcGIqL10R8eKpzSqws5k7Agy
	 SRdU7lBJY35T+QraQXKugQ1AEgH8m0IEGPY6+OfcyjolQzanQknPIdsxrePy1InpMA
	 VxyKqRUTYonIHt5RgjG2qavRmQ/yEu0PDUU1xnWSgy2yWDfVJmmmTqRcKJknRaj+QH
	 M3R1bW7hipD/BraAvWe78S6wuUFD4YbBRFVob3ej+KWx+u658MjCJWXL8n3vLkSJAO
	 z4C601cDACaVw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] SoCFPGA DTS fix for v5.12
Date: Tue,  9 Feb 2021 23:47:33 +0100
Message-Id: <161291001530.971667.9855298480195690176.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208203703.36109-1-dinguyen@kernel.org>
References: <20210208203703.36109-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 8 Feb 2021 14:37:03 -0600, Dinh Nguyen wrote:
> Please pull in this SoCFPGA DTS fix for v5.12.
> 

The commit has a fixes tag, so I think you mean 5.11 instead of 5.12.
There is no need to delay bugfixes.

> The following changes since commit 1048ba83fb1c00cd24172e23e8263972f6b5d9ac:
> 

Note that this is based on v5.11-rc6, while my arm/dt branch is currently
based on v5.11-rc2, and I prefer not to have any backmerges. The arm/fixes
branch however is based on -rc6 already, and it's a trivial change, so
merging it in there, I can avoid making you go through a resend.

Merged into arm/fixes.


merge commit: 090e502e4e63c608ef8497d295feeb9743ef67b7

       Arnd
