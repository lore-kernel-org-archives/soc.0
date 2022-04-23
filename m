Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B7CC433EF
	for <soc@archiver.kernel.org>; Sat, 23 Apr 2022 02:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E75DDC385A9; Sat, 23 Apr 2022 02:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5396C385A4;
	Sat, 23 Apr 2022 02:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650679965;
	bh=0mZcFv+cRQ4VZIM6ClyxlxECJ+MKeArL4pFBDpsbp7A=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=D/vPFn6Eq4RPIDTLnz5gri+nEvjffXB0ICWPE1ofW9S/80v3faJiWFb6k8ciD8ofI
	 7FGVxT5t9yeG6r8wQyvrEVx/z0MoZ49CLrc5rzGvsCNpCDGGuum8ZmoHVj/uSQyx2O
	 x8R4gIhZa6Hr6vZDhrQ1AchTaBN2wANN3T3NwYXZhhiCuipDQ8itM/6rQ8gXdAAz0u
	 zPrHJw45bjvZAGD6cSzK6tvCNSKZpY3rhqH6sL3GueC/JsCe/TplwMU/ufGANsR7SX
	 kslIw8k3TNgTShxUagVc6sVaF1U6/9XRqG/g77N9zyXyBtSgk5Lk8vv82V7rHyl8Hi
	 6CbtcBGt84hZQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220314084409.84394-2-nbd@nbd.name>
References: <20220314084409.84394-1-nbd@nbd.name> <20220314084409.84394-2-nbd@nbd.name>
Subject: Re: [PATCH v10 1/6] dt-bindings: Add en7523-scu device tree binding documentation
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, John Crispin <john@phrozen.org>, Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, soc@kernel.org
Date: Fri, 22 Apr 2022 19:12:42 -0700
User-Agent: alot/0.10
Message-Id: <20220423021245.A5396C385A4@smtp.kernel.org>

Quoting Felix Fietkau (2022-03-14 01:44:03)
> From: John Crispin <john@phrozen.org>
>=20
> Adds device tree binding documentation for clocks in the EN7523 SOC.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---

Applied to clk-next
