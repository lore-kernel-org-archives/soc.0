Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAB5C433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 07:17:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DB66C61179; Fri,  9 Apr 2021 07:17:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63B9061178;
	Fri,  9 Apr 2021 07:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617952624;
	bh=35+t3VdR6r2ta2LmjXABVNZvJGS+Me0KPiUicmNAFfU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hWc+g0sYg98WOkyUN1Ml5DuUsGe5bnMqk/yDIBNxVEsJlm+VxvNEAs6wp35+W424z
	 CLiIQ4D4HJRi1+2W6AREq8B8vCar9KBVywu65gARVYrWozf97nWAEhCqks7R59XKUD
	 fPToXMI7BSJhclLqVQi4p78T7H71RqWKbLHJAZox+FLbmCWyBJqh/oIfLxdVcGNrB6
	 7sgAgL1lj+CGM/5rwYwojHZ5IY2BUom+Qpc5614CFN/40sAUNdsvfCpTPLwxeGqLPj
	 UCx5YdEI0hvkcmn0Rhz8YqIaYLyNmyP/qUiFwrEqNtUOsf9Zvuej60eMfU34zPKFu/
	 5JlcrOFgE7WYA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Hector Martin <marcan@marcan.st>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] asm-generic/io.h: Unbork ioremap_np() declaration
Date: Fri,  9 Apr 2021 09:16:59 +0200
Message-Id: <161795260231.1749752.6203945457335392441.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210409052038.58925-1-marcan@marcan.st>
References: <20210409052038.58925-1-marcan@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 14:20:38 +0900, Hector Martin wrote:
> It accidentally slipped into the #ifdef for ioremap_uc().

Applied to arm/apple-m1, thanks!

[1/1] asm-generic/io.h: Unbork ioremap_np() declaration
      commit: ea96292838397682530ac77a429974f8ff5f2df3

       Arnd
