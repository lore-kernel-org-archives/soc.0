Return-Path: <SRS0=Uu9Z=I7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC1CC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Apr 2021 13:38:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8F6461001
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Apr 2021 13:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8F6461001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=CeWiOBiBCJ/eYzhZfFGZn+7kRuyqOyW0k0gQDOWFN/4=; b=RU5
	g0feKKHnjXk2GVsR3/gSN5yKqZ+wdmnj1hCZO88llIuvCAMIWMz6dZPaLBqMxYCTvlCrEzdfH+tG0
	9JYgp+NitwnNe/0nj/hxKvmz/UrAi57uLiINTuht4BjHtcySyXzgyKMyVKL5ChFroReyhcp+TwpzV
	687KFodc8hRPx/7s0wE1JGVzU9Bw/WTyFKzG2LjWqtkqbzn3te1Pf3loZaIkkPgybb0zJ7XfkyG9Q
	O2iazxvRAXn2SA+zporIWsHSIzCfoQb/ghwEOrb6tlilYG5/WpDRexkLTAYTMaYS/YvRtj+SqyPs8
	NiggdocU0ni/bu42/UdGTflsZM4KZAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSJye-00D5pX-Nz; Fri, 02 Apr 2021 13:36:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSJya-00D5p0-16
 for linux-arm-kernel@lists.infradead.org; Fri, 02 Apr 2021 13:36:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56799610C7;
 Fri,  2 Apr 2021 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617370595;
 bh=z1mZZbiYPkrM5r/aJtAh5y5kh0CVn1HL7j6A7kJl6jk=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=SoHfM20ukked8FQCAMZm3yT3vwA9DLDEOH0yl7UPHILC99x/+6JXNZfevm0WDJdA3
 YXn50cHwSGoE0yp/p2k+v3E02CRB8Hs4K4bw1KlhkLUEImN6jIP1wvoUNQQCId+Zio
 D15aQbOqmaowWH/LwXJHHsa/hGznk6tCF3GROty4JlEjpeftfgvJJ7Ek/mx7WbxsqE
 kPqIlU3QwG/ZZwQDlffqcBARNtwt8Q+vVN62xRCnVKl2xIfDh5Ll254cF7TdrjQfzb
 JN8DvzoZMiIVCoOby25+JHdwl2VAgwQXwdlo762h9c2rXOva7eBY/OCSEnzlpJfSWx
 zOmOpmqnlUu2A==
Date: Fri, 2 Apr 2021 15:36:33 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner Fixes for 5.12
Message-ID: <9df637a0-945e-4469-8e6d-0903cc9d3196.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_143640_312400_A426D715 
X-CRM114-Status: GOOD (  11.34  )
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
Content-Type: multipart/mixed; boundary="===============2003742327269086319=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210402133633.nOb4QaZ1GhpW-lmCNfId_eI666_i3N9-4qEe90d5D7k@z>


--===============2003742327269086319==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MX/URsAQkQzfTyEc"
Content-Disposition: inline


--MX/URsAQkQzfTyEc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.12

for you to fetch changes up to a3797571964d80ff3abebb1cd5047d4ae6d8db4e:

  arm64: dts: allwinner: h6: beelink-gs1: Remove ext. 32 kHz osc reference (2021-04-01 10:22:33 +0200)

----------------------------------------------------------------
One 32kHz clock fix for the beelink gs1, a CD polarity fix for the SoPine, some
MAINTAINERS maintainance, and a clk / reset switch to our headers.

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: Fix SD card CD GPIO for SOPine systems

Chen-Yu Tsai (1):
      arm64: dts: allwinner: h6: Switch to macros for RSB clock/reset indices

Jernej Skrabec (1):
      arm64: dts: allwinner: h6: beelink-gs1: Remove ext. 32 kHz osc reference

Maxime Ripard (2):
      MAINTAINERS: Add our new mailing-list
      MAINTAINERS: Match on allwinner keyword


 MAINTAINERS                                             | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts | 4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi    | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 4 ----
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi            | 4 ++--
 5 files changed, 9 insertions(+), 7 deletions(-)



--MX/URsAQkQzfTyEc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYGcd4QAKCRDj7w1vZxhR
xcriAP4vE+LS7aFvNyrmIr0eQFC7wlNEj18vGm1Sc4KKj/FBXQD/XCZS2SUfQqNa
pfCXC+Lm5eKdjyHewU4l/PaaF7FQ6Qs=
=kmjh
-----END PGP SIGNATURE-----

--MX/URsAQkQzfTyEc--


--===============2003742327269086319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2003742327269086319==--

