Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEABC433F5
	for <soc@archiver.kernel.org>; Sat, 23 Apr 2022 02:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA1A8C385A0; Sat, 23 Apr 2022 02:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C960C385A4;
	Sat, 23 Apr 2022 02:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650679991;
	bh=Dxz2nz5IwdS6rdgsSgb4TgoZxVOmysvqD1IDbEVm8/A=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=aA/kYNIcc9+o/Dv3vILhiBVHGUtv230q4QshStW9Fhd4XNbsSQ4yk9RC1GFNP2ZL7
	 aWOr3AZA8s621iI0mfgJlRPwNe8DagwAYWCs1QIVBlM/If9/uoIZWe4F2Wk0yLBcJF
	 fLmsEhSTpo4Vb0q7R6zmdq7j4LZMg/PxK8OF/y7l5aZySt+IHC49+fbeL3ajcu5VBq
	 MnWpeL7VxS8tXnPTMwmmNkuotlfMkG74s3llJJWZBJU+FHyZHww3MHWFkStqfVWHZF
	 dBHC1ZAbs5fZGDzCbOUnBxohP0phnhz0yPLQIxwzkmrifmwR6IU/52JoiLi94FQ9ez
	 oEyn2NxnHD7+Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220314084409.84394-3-nbd@nbd.name>
References: <20220314084409.84394-1-nbd@nbd.name> <20220314084409.84394-3-nbd@nbd.name>
Subject: Re: [PATCH v10 2/6] clk: en7523: Add clock driver for Airoha EN7523 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: <soc.lore.kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Michael Turquette <mturquette@baylibre.com>, soc@kernel.org
Date: Fri, 22 Apr 2022 19:13:08 -0700
User-Agent: alot/0.10
Message-Id: <20220423021311.8C960C385A4@smtp.kernel.org>

Quoting Felix Fietkau (2022-03-14 01:44:04)
> This driver only registers fixed rate clocks, since the clocks are fully
> initialized by the boot loader and should not be changed later, according
> to Airoha.
>=20
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---

Applied to clk-next
