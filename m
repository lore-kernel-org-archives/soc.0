Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA64AC433FE
	for <soc@archiver.kernel.org>; Sat, 19 Nov 2022 06:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F9DEC433C1; Sat, 19 Nov 2022 06:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCDCC433D6;
	Sat, 19 Nov 2022 06:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668839737;
	bh=2wsoE9+9qBsxfIYW8lGExV9HUGjJ5fBm4dHgEiC0EFA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=SSlcjgO/LUTRp/u5sB+zNyUFOrE+IZL/yh+4M/hHzloZXWvzUqqg8RQOgJzUbm2/b
	 /CUINwVLjBhWmoMpMP2Zkgoac6zjoizizpHXllncHEltj9o+tCd/gIuHfo0Zmi6aJT
	 n5+9rphsIFXLykrevVB+gf/MMK8vWOZKMrtI+lRwjOj4x+DNZPOcyzX13kvSG1VBKK
	 t6MQK2yg5vvG7D0vtNOYdKeW7TRPC/U7CLr3Ath9E5bnGPTJBhxfyEQMwX/hyi/fTY
	 r/5sKUPdz7E7JbXhBdRXf23av1kbIObtd/Nb0boQloAvJYq5s5OC60zQQh78VFFgOI
	 GSWVHnK9WMZ7Q==
Date: Sat, 19 Nov 2022 14:35:24 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Li Yang <leoyang.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Davis <afd@ti.com>, Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Frank Rowand <frowand.list@gmail.com>,
	Frank Wunderlich <linux@fw-web.de>
Subject: Re: [GIT PULL] Stable branch for .dts to .dtso rename
Message-ID: <20221119063523.GP16229@T480>
References: <20221118211103.GA1334449-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118211103.GA1334449-robh@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Nov 18, 2022 at 03:11:03PM -0600, Rob Herring wrote:
> .dts files for overlays are getting renamed to .dtso. The kbuild support 
> for that in in this stable branch. The .dts patches that depend on this 
> are here[1]. There's also some new .dts overlay files posted[2].
> 
> I'll leave it to the SoC and sub-arch maintainers to decide how you all 
> want to handle it from here. Either SoC maintainers can take this branch 
> and dependent rename patches or each sub-arch can. In any case, I would 
> like it converted over in 6.2 so we can remove .dts -> .dtbo build 
> support ASAP and not be carrying both.
> 
> Rob
> 
> [1] https://lore.kernel.org/all/20221024173434.32518-1-afd@ti.com/

Thanks, Rob!  I pulled your branch and applied "freescale" one.

Shawn
