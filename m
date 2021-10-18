Return-Path: <SRS0=UpmX=PG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52231C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 08:09:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1011B61002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 08:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1011B61002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rHwm04boyFgsinGSSsSEoKrIKfIa4fpKo2l12+ZLi8=; b=rSNOcTBMm6WjXmhFIeNqX0EIeB
	Ip4yofKFn3+8Pc8IiAd8FGKB7Mhnjv15giRKKNHN7fnC82sXx8/L2VGAVLuXTJCniQGFse3jDBaQV
	AvFbnjR7kHNznyGfA22E6FqM5rCjxyIvyJrsRy8hkpYO2te/VpPY9zHoIZfYoeXCJS/M0/qGaadW2
	otknrpk4T3pgHw7myaSwlyW34oV9A2kL/LaM3vmIFRXJjl99XoSiIx9l6JbaG5c6t6mUJkzOJO+A7
	dKAFKxWYpSBptQjIbOLsc8n/9j0ujT/L/7mhoXxzrc8KdxINbwE4hri+giLnGbIKntp9sxaxtm7wx
	gpIfLBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcNgk-00Ea0e-CY; Mon, 18 Oct 2021 08:08:06 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcNgf-00EZwf-Ln
 for linux-arm-kernel@lists.infradead.org; Mon, 18 Oct 2021 08:08:03 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 992953201C32;
 Mon, 18 Oct 2021 04:07:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 18 Oct 2021 04:07:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=p4093IKCnlKqZ3TMMnXGcIbZW3S
 SYGWRXW5NQtWqQs0=; b=XC3EVKt6AQcJFtMxTcR/8MGeKhMjzrnz+VNvjkpuAX2
 5vLh8yC2zYqPk1651sqSMDCN3JSj7Eb2eTVAzPeKZLbuijV7tmnrOeF8gNkc5DE5
 Y17iTO+/j/l3lvHrU4/hiGL2g0CCDg4KeK0oawV/U1ao6MQzIskE+EMeZUC7SXGZ
 4QgrhEETZao6VVgdp/Nx0e9Bns2ZvAcYe9Y0ef3aKF1xRRrKe7YH24OtQRWW3YvE
 8cgGscfhtfGDookTR8wJrivyGHtDsos31c7GWq3W7UqB6YWiB7QNKMLBArP8ugiK
 I2mZ0p3uG1SmLkiZJIYwKYqxcDx3U/zBIZNbSZpwn6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=p4093I
 KCnlKqZ3TMMnXGcIbZW3SSYGWRXW5NQtWqQs0=; b=hu5jlwE3ZwYTBgAL/X7CHJ
 TzBLMdPmtbGiJ4CBB34LAQC0+7ik3P7Ll6efobiP0BIyUw14VFi5Px0pFMuYvlaj
 kxRcR5NrhKLxDXbCdUdrbus2yqwuxH/Ce3rq+WXp/m/DI2YS0i0ZmkK79mkzimb4
 C50s+NXj5mRn6dWGeNSCK21mud0y8BQsnHLqWgQUe/YBy9IN/eQ55SPuOb7tsHEG
 peMfl2sbSbVO0wd/4HFiT90JfQDBBOkT3nPkJyhhcgDcHZalXM9ge9XnQNHDjC+0
 kD7Buyf5+Ky8+cjTtZq700xv76BAqVtZyw7aajba5Gh+t40sySTuFrzjoGeFNYpw
 ==
X-ME-Sender: <xms:WittYZHoiPHKstVHrzPDFVirUYwu_ZVvlbpdaLkj2hBzeC1sUuzvDw>
 <xme:WittYeVn30P2Rf-SDnAIkjTa1KVcchdvyJazkrORvonayma_DgyNPAT3V4ExkBW49
 P4IshvDFZXGRTNxnrc>
X-ME-Received: <xmr:WittYbJS8_G5O79IMHScrudxGx2nEMgaPwo0MUoQhOwAoAVifJXgfty-QrL36ccpM7at97XSYYdk_dcEqbNLfQVi5Iwdc0Fbm_yTRCEE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduledguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleff
 gfejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:WittYfGN4X2WIgH4az632wlfZ8S9EbizCm9RdtDEDJ711EpxUz81MA>
 <xmx:WittYfW5_1IRH7dDIhi3n7N3WQgRDIEYvTAjWi2cduXieQT_BeIADg>
 <xmx:WittYaPntnw6QIcTJly7xKvldCb5XyOMaosSA4ridk1whXQWPW09Gg>
 <xmx:WyttYVzjteF8OmitGpzUlsTqVOXFC6geOggdaA-7xXnvKQ5ltGkE_A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Oct 2021 04:07:54 -0400 (EDT)
Date: Mon, 18 Oct 2021 10:07:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [GIT PULL] Allwinner Platform Changes for 5.16
Message-ID: <20211018080751.osk7wvxgrphgmhuf@gilmour>
References: <0ceaad3e-dc26-4be6-b98f-d25e51a41b81.lettre@localhost>
MIME-Version: 1.0
In-Reply-To: <0ceaad3e-dc26-4be6-b98f-d25e51a41b81.lettre@localhost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_010801_936180_C32FE448 
X-CRM114-Status: GOOD (  13.58  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7899576874012259140=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211018080751.fBpEJmtaKJSz26JeBWz32PXHUDI7sGGcwKp6EeFz91c@z>


--===============7899576874012259140==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c2roc27z5eebgas2"
Content-Disposition: inline


--c2roc27z5eebgas2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Mon, Oct 18, 2021 at 10:06:27AM +0200, Maxime Ripard wrote:
> Hi,
>=20
> Please pull the following changes for the next release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd=
8f:
>=20
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/ta=
gs/sunxi-core-for-5.16-1
>=20
> for you to fetch changes up to 5923ddaa95a7e61e827a3d9b1d9c749963d8db90:
>=20
>   ARM: sunxi: Add a missing SPDX license header (2021-09-13 09:03:47 +020=
0)
>=20
> ----------------------------------------------------------------
> Platform core changes for the Allwinner SoCs, this time adding SPDX
> headers to our files.

Sorry, this got sent twice. Both are the same tag and PR, so feel free
to pick one and ignore the other.

Maxime

--c2roc27z5eebgas2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW0rVwAKCRDj7w1vZxhR
xdTTAP9arwKpEU0EURMWxk078KzW/i+dkv8LehTRNKzCOqLmHwEAtG02mJ5GIvFZ
cAd5BUN3IPSXr9xXc1LUFJZjPEJysQA=
=DCej
-----END PGP SIGNATURE-----

--c2roc27z5eebgas2--


--===============7899576874012259140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7899576874012259140==--

