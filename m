Return-Path: <bjorn@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3098C5475B
	for <soc@archiver.kernel.org>; Thu, 14 Mar 2024 11:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C995BC433C7; Thu, 14 Mar 2024 11:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4CAC433F1;
	Thu, 14 Mar 2024 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710414185;
	bh=14cs9JGv315TFKb+LyO1yXIizCV7+YGDm31vt15rNuo=;
	h=From:List-Id:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qVGKLNRyciPjo8P3mQXh1uH0RcCmlS+bI+YS1aTMWECP3iKUyu32Z1/xgG56VogXF
	 lx1l1J/k1IHdH74U04aZNYf5XbkSNPOJ5orrZASIH7r5qCGiQ2ClYibyf3AL93mUVh
	 PBa6Po0t6hIwPFepLg0nxwmPLIXlI6JKRrk/B2ume6ocuL+NhARgcGlZNYHekZfzUZ
	 EVPZb8XIpbhdkx0gjNpe1nO02+lLuyp0BFG/OI8ggFx78XMCPGcyeEp/fHtiu1QtlY
	 NJv8mjHXLlqv1rJQ54dx5zszrCZWVKUCqGvrVH0wz9Jdjq6Vg1B7ZcbJNVfZGk73fu
	 /lBP46Pcm0Crw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "conor@kernel.org >> Conor Dooley" <conor@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, linux-riscv@lists.infradead.org, Inochi Amaoto
 <inochiama@outlook.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>,
 haijiao.liu@sophgo.com, Chao Wei <chao.wei@sophgo.com>, Liu Gui
 <kenneth.liu@sophgo.com>, unicorn_wang@outlook.com
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.9
In-Reply-To: <MA0P287MB2822E853325154E87EAD3DEEFE582@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: <MA0P287MB2822E853325154E87EAD3DEEFE582@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 14 Mar 2024 12:02:31 +0100
Message-ID: <87cyrxt6t4.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Chen Wang <unicorn_wang@outlook.com> writes:

> Hey Arnd,
>
> Please pull dt changes for RISC-V/Sophgo.
>
> Cheers,
> Chen.
>
> The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1d=
d3:
>
>    Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)
>
> are available in the Git repository at:
>
>    https://github.com:sophgo/linux.git riscv-sophgo-dt-for-v6.9
>
> for you to fetch changes up to 0f46e1339ef113f0dedf7ad376452cc722dbcfe6:
>
>    MAINTAINERS: Setup proper info for SOPHGO vendor support (2024-02-23 1=
4:21:04 +0800)
>
> ----------------------------------------------------------------
> RISC-V Devicetrees for v6.9
>
> Sophgo:
> Added reset support for SG2042.
> Also updated maintainer information for SOPHGO vendor support.
>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>
> ----------------------------------------------------------------
> Chen Wang (2):
>        riscv: dts: add reset generator for Sophgo SG2042 SoC
>        riscv: dts: add resets property for uart node
>
> Inochi Amaoto (1):
>        MAINTAINERS: Setup proper info for SOPHGO vendor support
>
>   MAINTAINERS                            | 10 ++++++----
>   arch/riscv/boot/dts/sophgo/sg2042.dtsi |  9 +++++++++
>   2 files changed, 15 insertions(+), 4 deletions(-)

Seems like one of the commits are missing [1] from the PR. RV defconfig
doesn't build Linus' master as a result.


Bj=C3=B6rn

[1] https://lore.kernel.org/linux-riscv/35c348437b6e18972ccaf90d9c38040cacc=
d1f11.1706577450.git.unicorn_wang@outlook.com/
