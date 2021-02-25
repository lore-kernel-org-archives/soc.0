Return-Path: <SRS0=D5+S=H3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA17C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Feb 2021 08:29:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62B2064F13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Feb 2021 08:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62B2064F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VaF3h5hdb7bUqL30q3/6KqlJeJfp+kUo8CFDiZcipQI=; b=kG/AFA7esD+2LVuclkK3r9AXv
	88Qn6SK3nyTjvDb4EvZQXB9MQlMfC+VrqQovOrPuLPV3R644EfI2zWcn9MpUcKoOb5sb849/3pAKP
	7mWTe/bbhq7dMSYJ2ZT6COM0KY++r27usSFXH5yqm/c54rM+AqBzIf4vl1wK27+Ijw2J17qj9c+c+
	MH1wZGoY+tWwxPH0vW/lkkwITKV4u9bA/1VxwKMf1vxzP2Ng+nWdeursX6G3OtfBZz5b4VcbvxMsg
	g4/qfKoF83qKOsTv/2S5QYRszF3V8zPd+eB9E1d8KVgg/41tWsZZalggWGOGTwfoRdY0SLcHQygEo
	aa7O0uAGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFC0s-00014M-NI; Thu, 25 Feb 2021 08:28:46 +0000
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFC0q-00011t-0o
 for linux-arm-kernel@lists.infradead.org; Thu, 25 Feb 2021 08:28:45 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 963C62C0;
 Thu, 25 Feb 2021 03:28:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 25 Feb 2021 03:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Y9Gv6iZZQ2bb0yIwpCDfsgvAtPi
 Vd7qD5mlt0Bt0XeI=; b=iUj8SrA8pMuMSHzXqNfpdkRTv5LHEHrqNsUWJWPG92y
 n5XX3wQPuxLyDYZe6diiXkxlpBNS7atD8ZlfLQ2imGuvYd9vjCHN+4356r85Ajb3
 gIUtl3IHiUyTuiy9p763tQUV/N1s3GzXChAittz3oQ3Bt+O9MHzWREOpEmgcUO8C
 PD7vWGsUUTjC5zp9oMutEEOUavv+kz7eMxplejGD8HohJCUw7E4Ix3B8634plLv2
 hCMnnfz6cYtNOvc7VHtpJ1nYeHqTJr8tcDYtlXlO+VTXxK/Dc5n4HZiccohenDF/
 NSYHx/EpU0OKFgCmB8wt7xV1YNvU6N7PmjmqDlnG69Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Y9Gv6i
 ZZQ2bb0yIwpCDfsgvAtPiVd7qD5mlt0Bt0XeI=; b=DiUUdZr5pBX9Vde/BYmOxx
 +/ETiGbxbC/CblLDUmjZy8mfjTRN4+AiZk5Tx+opWp08we7QNZMs2w+8sxQpWQ8e
 R+GVvzewIdzUVvVVE8tIGqv4VC8cPblVa6SQdXFW4l0qTW9R1B+Q2bytCE3B92B6
 FPDdR/ZFsUMwNRUDCzzeCZvKeeofB+gKxsB7nWTJoAFpQ7U4uyNN4t5Z9cHV6G/F
 pCnnxAqQtOEAMbfWJ+5cDmKXuCrTTh6k2Jc9DmA1LLrv9HoytvNwnfeMd6dZi8Fg
 gY35vtcHs/Biv4iOnRYEXL44oawDk1ywo+IPrO79sa5YJ4lDTAOdRJBz4c02+XwA
 ==
X-ME-Sender: <xms:r183YDya3pr2fDcU8f1LWuHWaePm4yGPCxour8BSw8XOE1laBpw4fw>
 <xme:r183YLSvn27zl5KP7GrNN_B9gR19cFPUPJEs8Urd3vd06On39SjJOVGbGLnBCOVhd
 1zzwufSFViNigttRq4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeekgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:r183YNXfKZunF6ifUUEBA_9I_mLbW3AoHGkdVL-LTC8PzZhRiBcsvQ>
 <xmx:r183YNgXLQPMiHwx-yI-Oxy2U5zGaZyF17Rj9gT6i2GW_A5Su1RqhQ>
 <xmx:r183YFD7AmVyaBHAZ-8WF9L0ZbsafLJGz2FRY773L_YjWDVViN_8hg>
 <xmx:sl83YJ6QDgf3_lrjxK0dkem5mx8a7y-5E3XdS9htJRKRaeePkoc9WVaM0i0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D1A281080068;
 Thu, 25 Feb 2021 03:28:30 -0500 (EST)
Date: Thu, 25 Feb 2021 09:28:28 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Pascal Roeleven <dev@pascalroeleven.nl>
Subject: Re: [PATCH v5 0/2] Add support for Topwise A721 tablet
Message-ID: <20210225082828.orqttturwbt6ckov@gilmour>
References: <20210224105240.47754-1-dev@pascalroeleven.nl>
MIME-Version: 1.0
In-Reply-To: <20210224105240.47754-1-dev@pascalroeleven.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_032844_311626_33AAF26E 
X-CRM114-Status: GOOD (  13.97  )
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
Content-Type: multipart/mixed; boundary="===============6914047878087504817=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210225082828.Y9YTMDRTM21i57O-Qz6_1BBxi0weCezavT82cMdygmo@z>


--===============6914047878087504817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mddrviwckt3hjn4y"
Content-Disposition: inline


--mddrviwckt3hjn4y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 11:52:38AM +0100, Pascal Roeleven wrote:
> On request I'm resending the last two patches from the Topwise A721 tablet
> series from a year ago as they weren't picked up. The other patches are
> already merged, so I didn't resend them.
>=20
> Changes from v4:
> * Reorder nodes alphabetically
>=20
> Changes from v3:
> * Fix DT validation warnings
> * Remove leftover labels
>=20
> Changes from v2:
> * Collected acked-by.


Queued for 5.13, thanks!
Maxime

--mddrviwckt3hjn4y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYDdfrAAKCRDj7w1vZxhR
xXolAQCEdwE59axZzlSV9vxCO+BA65ZY6hptY7stXyvrttkM8gD/YcZtMXvHoayg
T/Vbe+6f7Wg1eadL4IzRckWcMm1S9wg=
=lnHG
-----END PGP SIGNATURE-----

--mddrviwckt3hjn4y--


--===============6914047878087504817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6914047878087504817==--

