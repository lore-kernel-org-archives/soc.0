Return-Path: <SRS0=ZThx=H2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15923C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Feb 2021 10:12:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5DD06023C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Feb 2021 10:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5DD06023C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jL8ShAmKFEkl+FojfbUQRyIjhptsHSusAZBUeE3InAI=; b=AaxDNAYW4BBhpM1OfIKU8SnJ1
	2PnwUMKV+XW5d42Yt3W7sOtXYZ1k0qu9jLKxupfF4wo8HWt6wJr81Vhp+v5nH9VwqEwYU8rIXGBMr
	kTbJVXrPvCX035jCCirB0jFLZHmXzI7MFdOtR9gDSX7GhT1LIEYiNmqSd79KXdgUh+ESObf6VZrzy
	PdNd0q/u0EZIubupJQR974lC6jHjjiUGyFJLC2DF+0mlKjFXaSK9aqg+iQAmqHDw9QgGcyQET4pKU
	w4KaOJY5hRkhbzKV6muH0TSw0SzUvCkYNP4abfoxFGoxMiCIVzqsBIEFO8XlCCrevRWHjsgN9L3Qx
	rLbpCrReg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEr7l-0006lT-4n; Wed, 24 Feb 2021 10:10:29 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEr7i-0006l1-KG
 for linux-arm-kernel@lists.infradead.org; Wed, 24 Feb 2021 10:10:27 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 20291580667;
 Wed, 24 Feb 2021 05:10:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 24 Feb 2021 05:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=kfzvIjz40bAcKM0RWeUMXud03b2
 +MIfE0nrkqnTKGcA=; b=opk4I4Dx/6W+HWKqylTyGHvLGV33WVn/Q3KnHMexGg0
 n7DPGt/huewokKLo020DXLHHolgEE08+fv1ZlmS0ErafrN2vFWZr0nGWtAG60gX5
 pg59gbMOWwul3eDvdAeALUUd7AreLbfnzeBpirgFkqa6w/dq/vJjrOkBbdg2Qtd3
 q1cu7gWTTwzxBVVQHVQn6fD+f0Itaq9/JoJME69ENGXjHNuyKkUkTOosGz1RUbG5
 x2Zbkb/keCXjkVFdY+3beNKjGjxJzF2HoO5JOMEO9v1yTAyRYL7W3FebFQxNr3gK
 kwMYTaZJaa7j1JoRFmYNDKgdMhvJNPMiITm91FYf4gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kfzvIj
 z40bAcKM0RWeUMXud03b2+MIfE0nrkqnTKGcA=; b=iJRk8puxfdjOpRWsFeyOJI
 au5YXH53LN2CKWPN6gQ/7C0UFg0k7XrQTmWr0+OT4PB2mVuYMYNnGKRCoWjeb0m1
 FxDLr5HTJCFOzxJMy78KbfAozat5xi1+86Mf1wpUPrVXoASUKrqb9Q3uTyxavZG2
 L2ImtoncV+p9Wnf3D9YP0VnsmxjqniRel5amt/KckAwNT0zP59liLRbIxJ2U+R6V
 AN8U/Ul6BSGO4PualecmZKz+/66Wa3xTQULpUDJ+BvNiOm+PX26B/JmTE9+IQ8pw
 VCD+q9QXyPy4oPdy31h3bVYXlzkdSjfupmTCAtIwZqR1dY875bx8zN/3/O9OKJeQ
 ==
X-ME-Sender: <xms:DCY2YB1UQ6zrODtk6yaLpThlv3PaMhbnvzWFyRZliHVLMIkwzfafvQ>
 <xme:DCY2YIH67s7WuxfmbOw32QP01d3Ylq4HNV7PQVOWYa6liBDi0GsPxzN802a45VDeQ
 GpEJUx6iz-g7udSpVs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeejgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DCY2YB7nHJUdBiJIhhgKNVe39rwsNjua9mNKGm5mji26Lo5xTmROwA>
 <xmx:DCY2YO3Hfs2fzEw1qY3Ek7z-gY-48UQEQ9P3TpiNLTw9I6u5AmWRRg>
 <xmx:DCY2YEHSWXcpQ3V2XxtVhvyxMje42zvl5T_KUbeKpZdAc3qgTlDadw>
 <xmx:DyY2YLeL0Mn3zIM1v7Xv4PNtLWlJPMMeUGOJ0-4ArEeugngR5d42ZA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E1FE91080064;
 Wed, 24 Feb 2021 05:10:19 -0500 (EST)
Date: Wed, 24 Feb 2021 11:10:18 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Pascal Roeleven <dev@pascalroeleven.nl>
Subject: Re: [PATCH v4 2/2] ARM: dts: sun4i: Add support for Topwise A721
 tablet
Message-ID: <20210224101018.ateuj367oqvphyzd@gilmour>
References: <20210222100826.12478-1-dev@pascalroeleven.nl>
 <20210222100826.12478-3-dev@pascalroeleven.nl>
MIME-Version: 1.0
In-Reply-To: <20210222100826.12478-3-dev@pascalroeleven.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_051026_738900_9361CB3F 
X-CRM114-Status: GOOD (  11.69  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Arnd Bergmann <arnd@arndb.de>, linux-sunxi@googlegroups.com,
 Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>, Martin Cerveny <m.cerveny@computer.org>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============6551575913945046518=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210224101018.Ak-qWxx1GiBWWL4jAPL_WjhrmktRdelXrBh9cE94aN4@z>


--===============6551575913945046518==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ctatgkubvtbbo6kr"
Content-Disposition: inline


--ctatgkubvtbbo6kr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

We're almost there, except for ...

On Mon, Feb 22, 2021 at 11:08:26AM +0100, Pascal Roeleven wrote:
> +&lradc {
> +	vref-supply = <&reg_ldo2>;
> +	status = "okay";
> +
> +	button-761 {
> +		label = "Volume Down";
> +		linux,code = <KEY_VOLUMEDOWN>;
> +		channel = <0>;
> +		voltage = <761904>;
> +	};
> +
> +	button-571 {
> +		label = "Volume Up";
> +		linux,code = <KEY_VOLUMEUP>;
> +		channel = <0>;
> +		voltage = <571428>;
> +	};
> +};

Those nodes should be ordered alphabetically

Maxime

--ctatgkubvtbbo6kr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYDYmCgAKCRDj7w1vZxhR
xXiEAP9TJK18t/Ug+nJChn8xkzq27KvAp4Gagg85nHJfZJRgjwEAwiJM0U80LsFT
1tQoFr85mEnIgd13nceFSuzlLON74QE=
=1gnL
-----END PGP SIGNATURE-----

--ctatgkubvtbbo6kr--


--===============6551575913945046518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6551575913945046518==--

