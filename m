Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6BCC433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3843DC340EB; Tue,  8 Mar 2022 16:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6794C340F5;
	Tue,  8 Mar 2022 16:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758157;
	bh=BEeK8nIJnSBjh6ZoF8vw9Stq1p3CblrK+pTnXTLN/Bs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C74Ztt12Xd3MGW/ntmcVf9J4vHX5xufYgrZ3/98qb6rm4YHM8UgAxrRhbIez3Q1HG
	 Ye6K+X507Xv7deNskEqaoxFlWtz/U+uCpJDbtehrYa7f5D85+ABQnl4raWxH1y6uNv
	 RL4bvdSoia2siRw9UHVh+ehVazYvev4VjAl19WJRmFjRpWpblWJ2a0L1ddhppcn3qv
	 kpVz5wHkLOSEfmr3CI1I3WtC0BzgBmobE2oaBO8aoN9ilCsSBlTg8i0QiyC3kmDUMY
	 xsUhe6FelHfEgGrnx7JIygmukzXJkhWeabX3pxQy8LF2dJwvebhbFEGg7hOi+muhPX
	 Zay/9cpB8IDwg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Update Jisheng's email address
Date: Tue,  8 Mar 2022 17:49:00 +0100
Message-Id: <164675812274.4164061.16007251676005101922.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <ce7213bd-28ac-6580-466e-875e755fe0ae@synaptics.com>
References: <ce7213bd-28ac-6580-466e-875e755fe0ae@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 4 Mar 2022 15:55:59 +0800, Jisheng Zhang wrote:
> I'm leaving synaptics. Update my email address to my korg mail
> address and add entries to .mailmap as well to map my work
> addresses to korg mail address.

Applied to arm/fixes, thanks!

[1/1] MAINTAINERS: Update Jisheng's email address
      commit: d986afd5a7b75b477ac347b222354cecd97edc87

       Arnd
