Return-Path: <SRS0=LeP6=JE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2982FC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 11:47:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4DB61394
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 11:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD4DB61394
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Ol6JFyQUHiRF9dZRjbk/v4VjcBIvjqUCLN2UlnHHF+s=; b=dsx
	ayZTqesCjOmXkSXgftvzKEwPAzWZLiiGQ3wgbpqu2ezRnEsAq8aYrqZ5a2UDJqgC1YaW2CYd2FhXT
	1b0Kdip0ABpYkUerWqyMPQmyfx+LAGoR6Bqb7YHTye/UMbRDqqi900GjgOMj9mOOJqPriBQaN/CkK
	/2ohU7MDl6a+KK8Kd64G2yu7fwI3ehFBoaLp3AHawt60Si2B1zBpCnwpqlM7G6rRehqwUIhkorFgL
	GYFwshWDvWtEvDJB+f0Ws2rz/9Ajs3/xMvukfILxfnNuN1xHDE6s3s0+LsSp6Y4l2LTgcna2H834X
	cxGwy1G6sOLVTVSiEnz4hK5/Iv03Slg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU6d1-004uJ0-MV; Wed, 07 Apr 2021 11:45:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU6cp-004uGz-4R
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 11:45:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABB1961284;
 Wed,  7 Apr 2021 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617795932;
 bh=htpMIDDNOkdHMPI+auzfjyShElJLBZPacfzsX+qtWAc=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=rSrTkCwpWi7VBknJSxijgIuHmyKtnhAuOdritl+glGfTug74FTSQGwyLZf78F0Cxg
 JBCM3yRgDVwiSVfMndRWuWT/HGYHeWzalUBZJhRUJwfWSgmTueH2Vv3tPwnsdTHFZV
 UzaTtK6j9aa7jzYpf+5e01u6zlKdXSYr3MSMdxRUPLyP7PvZPA16rlFwbWdmBGshSu
 A3eHE6QEi9Njj+mt9TltzMReEfPKs10mThQ4cGKCeUyX+0dgZb4THHIpg6Exwz4ttm
 QT1POUrGFnUFrFuD+XKmgUfnGEl8Av9Dgs01Z95uRpPNh9khtTrw8VixLiGFFvE2o6
 iIoOXSmmJQ8FQ==
Date: Wed, 7 Apr 2021 13:45:29 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Fixes for 5.12
Message-ID: <9972a85e-60b7-49f4-a246-db3396dd4764.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_124535_578275_5C5A1EFC 
X-CRM114-Status: GOOD (  10.89  )
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
Content-Type: multipart/mixed; boundary="===============6838195729670987955=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210407114529.cUVk1NUTrZ1iDrxM7MzYTMCo7QqY-WvULO-OMAlTcbg@z>


--===============6838195729670987955==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HNihV8g0zMosw/Hu"
Content-Disposition: inline


--HNihV8g0zMosw/Hu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Here's the fixes PR rebase with my SoB added

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.12-1

for you to fetch changes up to 7a2f6e69e9c1060a7a09c1f8322ccb8d942b3078:

  arm64: dts: allwinner: h6: beelink-gs1: Remove ext. 32 kHz osc reference (2021-04-07 13:41:47 +0200)

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



--HNihV8g0zMosw/Hu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYG2bWQAKCRDj7w1vZxhR
xUb7AP9yjaWNRc7IWRVAZ59uumWykv5kJmUJmEdzw+Jma47FtgEA6p1C8AJK+HzX
P+2ndknt1BFYNq+NebBD5aQf3K9X1wE=
=h8na
-----END PGP SIGNATURE-----

--HNihV8g0zMosw/Hu--


--===============6838195729670987955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6838195729670987955==--

