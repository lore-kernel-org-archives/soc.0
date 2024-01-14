Return-Path: <SRS0=3cPp=IY=h08.hostsharing.net=foo00@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79743C4707B
	for <soc@archiver.kernel.org>; Sun, 14 Jan 2024 10:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30458C43399; Sun, 14 Jan 2024 10:33:15 +0000 (UTC)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B175C433C7;
	Sun, 14 Jan 2024 10:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B175C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 86E90100D5865;
	Sun, 14 Jan 2024 11:33:03 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 4B65F2F90C4; Sun, 14 Jan 2024 11:33:03 +0100 (CET)
Date: Sun, 14 Jan 2024 11:33:03 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, devicetree@vger.kernel.org,
	linux-integrity@vger.kernel.org, Yannic Moog <Y.Moog@phytec.de>,
	Alexander Bauer <a.bauer@phytec.de>, upstream@lists.phytec.de,
	Teresa Remmet <T.Remmet@phytec.de>,
	Tim Harvey <tharvey@gateworks.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Heiko Thiery <heiko.thiery@gmail.com>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Prado <nfraprado@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: Fix TPM schema violations
Message-ID: <20240114103303.GA3805@wunner.de>
References: <e6d7768e2a257e0bd5948bcf168909b6c670851b.1705168605.git.lukas@wunner.de>
 <11865970.MucGe3eQFb@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11865970.MucGe3eQFb@diego>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Jan 13, 2024 at 08:13:35PM +0100, Heiko Stübner wrote:
> Am Samstag, 13. Januar 2024, 19:06:56 CET schrieb Lukas Wunner:
> > Since commit 26c9d152ebf3 ("dt-bindings: tpm: Consolidate TCG TIS
> > bindings"), several issues are reported by "make dtbs_check" for arm64
> > devicetrees:
> > 
> > The compatible property needs to contain the chip's name in addition to
> > the generic "tcg,tpm_tis-spi" and the nodename needs to be "tpm@0"
> > rather than "cr50@0":
> > 
> >   tpm@1: compatible: ['tcg,tpm_tis-spi'] is too short
> >         from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#
> > 
> >   cr50@0: $nodename:0: 'cr50@0' does not match '^tpm(@[0-9a-f]+)?$'
> >         from schema $id: http://devicetree.org/schemas/tpm/google,cr50.yaml#
> > 
> > Fix these schema violations.
[...]
> >  arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts    | 2 +-
> >  arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi     | 2 +-
> >  arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi     | 2 +-
> >  arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts         | 2 +-
> >  arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi     | 2 +-
> >  arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi     | 2 +-
> >  arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts      | 2 +-
> >  arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts | 2 +-
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi              | 2 +-
> >  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi            | 2 +-
> >  arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts             | 2 +-
> >  arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi        | 2 +-
> 
> you might want to split this per sub-architecture perhaps (freescale,
> mediatek, rockchip) as such dts changes normally go through the trees
> of the subarchitecture maintainers.

My concern was that other developers may see these new warnings
and start submitting piecemeal fixes.  That would be a waste
of time since I already prepared fixes for everything weeks ago.
I was only waiting for the schema changes to hit mainline.

I was hoping that these might make it to Linus during the back half
of the merge window so that the warnings are gone by rc1 time
and nobody will ever see them.

Of course I can split them up if that's what Arnd & Olof prefer.


> For the rockchip-parts itself, I'm also fine with them going through
> somewhere else - gru devices are pretty much "finished" by now,
> so for the rockchip changes
> Acked-by: Heiko Stuebner <heiko@sntech.de>

Thanks for taking a look!

Lukas
