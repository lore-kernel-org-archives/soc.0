Return-Path: <SRS0=CKL9=FC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380DAC63697
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 11:26:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCF2F2225B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 11:26:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wsp3QIOQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="x+gWyFvl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCF2F2225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=wLwdflZEIdQokpWGQYi+nbaAq5aURlqG+mrDU59DRDI=; b=Wsp
	3QIOQlr3tmM/v3GXlthaFlf0s2isqoTlzS+Gl7HujThd+Ly1CuW3+zcyjumIsO4VoJT/hKwsHODNQ
	iXNvBzsPhskfVbaUJ0s92rTTYAdCcNqGaMqbMBcrcHavDsjjAOXT5n7uL5Tx2Nhz+kI0KvlnFiulU
	rCGgnVnbN9KBZWhPyIlo6YaE91R9juLv5XJ4PC1gFhhttLtKnvWaaJ0G6xfpeNA8r3XJGeRP0V3i4
	HpqrRA2F4f6ARsJreNjlGCzvgUz/2YmJTFomrY/TeScOfj9FISryWkTw3N3/Y+DfHNslDPrEei+4J
	Ee0ytkTXeYWCEGrC5HByPWRAjJSOJ/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiyLD-0004Jf-QL; Sat, 28 Nov 2020 11:24:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiyLB-0004Iw-7q
 for linux-arm-kernel@lists.infradead.org; Sat, 28 Nov 2020 11:24:34 +0000
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E90A82225B;
 Sat, 28 Nov 2020 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606562672;
 bh=l5VaVAUHW2WhwZ3kOPXLkWqghbtPx8Xk8vffBHP7pME=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=x+gWyFvljzi6k50hI/6u41O2XHyr5zxNztD0h1j2Hfec0eUff/cCEyTQmGERIJXLg
 QQMKP5n1OFMLf0zQgnLPssg31+RBXlfYt4ycXVG1hl/1Q1neCoio7Ldx0hxzpRB3oP
 OHQ4FmNuqriXpyAyVy4YVzmicssYea3j4UGB9oBs=
Date: Sat, 28 Nov 2020 12:24:30 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] Allwinner arm64 Defconfig Changes for 5.11
Message-ID: <5ddf5486-a20c-467a-bc67-d5e8fbc38856.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_062433_372146_4C6BB92A 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>
Content-Type: multipart/mixed; boundary="===============5040102087902758816=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201128112430.rQHD0tTTpRP3GwpEGmBsVapXAYQZKNuFTiZtxGm6Xg8@z>


--===============5040102087902758816==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Olof,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags=
/sunxi-config64-for-5.11

for you to fetch changes up to 0536f70989601c64c162107354a03112ab1bb9e6:

  arm64: defconfig: Enable Allwinner i2s driver (2020-11-02 15:09:53 +0100)

----------------------------------------------------------------
One patch to enable the Allwinner I2S controller on arm64's defconfig

----------------------------------------------------------------
Cl=E9ment P=E9ron (1):
      arm64: defconfig: Enable Allwinner i2s driver


 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)



--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8IzbgAKCRDj7w1vZxhR
xfbiAP40iLCU1EivEBOQxmISITs8GZaOeZaQ7Cp1Gbp7m7cR3wD/WLb9zSsSJW6R
DTdJPmSi8pgMr4j/YqsQfYYccwy5Owk=
=oOEs
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--


--===============5040102087902758816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5040102087902758816==--

