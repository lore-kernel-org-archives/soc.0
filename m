Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FDFC433F5
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 09:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4361FC34606; Wed, 15 Dec 2021 09:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78552C34600;
	Wed, 15 Dec 2021 09:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639561755;
	bh=BxKrx8XGVKCoMIs+qMJtcgDqCUwuAi6uJzirHKuEF7o=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V5pJwouc6/IvFCRG6etrHhhTzL2YlY2zPlypkl/HVHmqVt51sVqnc5awWm05DDNjA
	 GINVt+DMBxPKK2nq15iZQ0NnHp+EVUBG+EVn1EnkiDwqsL/zyA62f+snhYoaYuI/vM
	 lZXz5vNPmcbyrjG/pCdLqkrlNKDfbv5pv06XqNHpgQcLYfGldx1SEGYwI1bmJE3r96
	 jSf4svjPYqNwiS3fvb9KuPuLEYHvuv6eQnO9MSZ+MgIBpRxeONpuovPKsgEdymFLBF
	 QpsSPHd++e4q2lHeYkiu8XawlNO925t5LlGZB3Nc0OL5jQ87rlsrDqFfs2LmAwlioW
	 GaZHxXpvADScg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/4] Renesas ARM DT updates for v5.17
Date: Wed, 15 Dec 2021 10:49:07 +0100
Message-Id: <163956174382.1227275.11611830483121497856.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1638530606.git.geert+renesas@glider.be>
References: <cover.1638530605.git.geert+renesas@glider.be> <cover.1638530606.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 3 Dec 2021 12:31:18 +0100, Geert Uytterhoeven wrote:
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.17-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: ee58c0a4d72655b8271dde79a99466da2fab8c34

       Arnd
