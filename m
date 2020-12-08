Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFF1C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:24:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B290523A6C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B290523A6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qO/+tY3t/RqjQznZFn776G5qC5Puhz/XKZRQVvS1k4I=; b=2Nd
	Ma3Nop44LI5wCHtaGCtQm3livc7F2SC4IPp0qPnePKfzU0Z2G9tdxN41ZvKLp2a/A4zp7ZrEK9b4u
	cKSMLbS4NYMWpNq+W+3q5SEM+RP0lt78jg96DHQS0LTk19A71ynRDFYpT4DzKNbreCftWGWyF7UYe
	GJtr2f1V9PpfrnaQ8AUdLQIYTkh6XMfdR2hOuroDa5PilvcT5NWMZH8oPQKyX4ZXClxTVv+NMx1Ad
	zAt4xVOpfg0hthM2+Do2qUJ6BkhKpMtUce0rHhUxwtbXOwij+252DVu843VvYW8HV726W1nRySmqS
	vYIYp2lI0OY+/YeEzoQtFfpmEnxbr8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfm7-0000DN-TV; Tue, 08 Dec 2020 16:23:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfm3-0000D3-ND
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 16:23:36 +0000
Date: Tue, 8 Dec 2020 17:23:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607444614;
 bh=/7QotKMWAMqIFwyw338k97dDjO+o3q03uwwUE5E3RKA=;
 h=From:List-Id:To:Cc:Subject:From;
 b=P7DF03n4eUjr9tBDl1rg2KPWkQ4ofiZqHHh57fY9t1YgBH1BIuonsDLK+h2KlbUp7
 akFTcetKDKnf7+7HZP61SdrWXUYnCEEHMRsPx/3YyN88VvPcC62Qs9lrqv1FLnA7cU
 x3YCDHD2Ksu8+8gPHMmj/ZgNZLSyYzkKqUIR0+ubcucQWgDy+MGVeHVkUqB3RUcucq
 KZwy5MljE2XX1OJaUZaGbwcTM430Kq2bG7Wg5bUK8pLDHodGj33gHeYr+2uFlXaZen
 MCW+BFTUBmOGviX1VlFIs3owPuVA3V21ESPSgootI8AbmqS3o1UYVnbYp5sHzk6KqS
 kHvRHQO7lyTlA==
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] Allwinner Fixes for 5.10, Take 3
Message-ID: <2a351c9c-470f-4c5e-ba37-80065ae0586d.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_112335_824355_A5CEB94B 
X-CRM114-Status: GOOD (  10.07  )
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
Content-Type: multipart/mixed; boundary="===============2755671223843577569=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208162332.vUnGU-4AAT74MKuIlE1ga5VP-0mSmW3FTU2AmVQklsE@z>


--===============2755671223843577569==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit a7361b9c4615951f52ffd2b1afa09a1384c7b4e4:

  ARM: dts: sun7i: pcduino3-nano: enable RGMII RX/TX delay on PHY (2020-11-24 15:24:28 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.10-3

for you to fetch changes up to d0c6707ca4235b78d06bcd62f0e24fbeac3e6d10:

  arm64: dts: allwinner: H5: NanoPi Neo Plus2: phy-mode rgmii-id (2020-12-01 11:33:33 +0100)

----------------------------------------------------------------
A few more RGMII-ID fixes

----------------------------------------------------------------
Heinrich Schuchardt (2):
      arm64: dts: allwinner: A64 Sopine: phy-mode rgmii-id
      arm64: dts: allwinner: H5: NanoPi Neo Plus2: phy-mode rgmii-id


 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)



--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8+ohAAKCRDj7w1vZxhR
xYUWAP0ZyJrIhbE+bfOEIV9L5bVa3ohWM0ZHKW5WS40pwl9d2gD/dTcN3awvmSfu
BB8VOtBFHppL1t89EPwjbNnHbxfQPw4=
=KU8G
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--


--===============2755671223843577569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2755671223843577569==--

