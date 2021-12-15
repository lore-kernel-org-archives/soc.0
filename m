Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D563C433F5
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 09:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53BE1C34607; Wed, 15 Dec 2021 09:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA9AC34600;
	Wed, 15 Dec 2021 09:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639561850;
	bh=j8xubI0NHe2KArjED9rp7yaH5SYjH1z7xZ8yU7GvCNs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZPN/l4miLnZjML5SmxHfCnDeoF9N0gm+uCbuVz7uKNHVbF1Soqg9TiWRzLUyBfT2m
	 DARc4m3ywsrFtkUYFGTGDyazYMQuuEnDBFh+5cCN1LjZlmoJT/IHFFyy3O47FApTty
	 3LO2q5seHuQuTij1pUIVwzxnW3RhIW7f7yNPfSB4zv2NQFbrX4WjZGo4Et3vUcMXtO
	 qtDn0KH+QNk4Rj8akp/mvyUTGUybx/7ndkUpSm4jpcTfc9NOaq4BmDlixeppFDWafO
	 WnCF6WGgVO6F5lgg/pZ4dMZAsoofOrW6OXuiLN2v69L/v8l/epMvdUtQNOnNuXvRUU
	 +YE0XC+SxhVgQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] IXP4xx changes for v5.17
Date: Wed, 15 Dec 2021 10:50:43 +0100
Message-Id: <163956181254.1227602.10508435320958907587.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACRpkdZXZBpexMUuwTV-RB7_QAjBQkSbRsaBtgFShcqxuNTUgw@mail.gmail.com>
References: <CACRpkdZXZBpexMUuwTV-RB7_QAjBQkSbRsaBtgFShcqxuNTUgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 6 Dec 2021 02:23:25 +0100, Linus Walleij wrote:
> these are some two IXP4xx patches cleaning up a little bit in
> KConfig & such which should go into v5.17.
> 
> Please pull it in! Details in signed tag.
> 
> Yours,
> Linus Walleij
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 4d4872fef9d1788da10efc07a4f4c91799f77a94

       Arnd
