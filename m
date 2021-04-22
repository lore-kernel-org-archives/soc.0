Return-Path: <SRS0=vqev=JT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6350C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Apr 2021 07:48:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5361D6121E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Apr 2021 07:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5361D6121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qMV+TCtoRBEM9XvWGZ4651IZiKIB5BTYhLISiDud3e8=; b=ZXq
	wfelhlNEcdncOI8AAS9/5zFepdD6TSXf/6b0L+yVWU7OX9sW37eMmGwXcWKrlEZVIsgkStLTKsyYF
	6ILBrBeeLxYWAgKSbOJvjxS1G3e2zGVjTkq2ehkhrPUR+C84RRB4DWsVbBfwxOntTw6+Vdl1BJQ7U
	Mcj6bBD/eDRFPtksb7XkASDpdmntB3oaRnuOJY3UOTW+G2/BOUm64UhKAUCksitghIlhurIejB3Da
	B8pxiOSwcOrMDs0BmAG1Xik9YcLuY47HYswfwpnnxHaKC0oh1cUT6piC3wDtqPvpj9QYjV8kCpL2H
	bIov5mc5TJ/OtvBzwvQo8RnqTtZGSmw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZU2m-00GAYY-Lb; Thu, 22 Apr 2021 07:46:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZU2i-00GAY8-Ai
 for linux-arm-kernel@desiato.infradead.org; Thu, 22 Apr 2021 07:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:List-Id:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=a2bx39kta79yyQgyujM4vcKzbRtv6VuVw/CPTyy4anA=; b=CJ9aBgRxvQkR5rfSAZpxXfkWVv
 mXMpcrmwhV02i0e2Uj3Q0zi+CQs4psDVzbzekKWM2dAKBqG7WnqDw+2iYCgVe2xsFVYnG9c47xXi0
 6yThNown7RwqUOsL7hJeX0S0DVxM4wSHevjfnw7mKE84BJote7ZNZMPa5AyIRpjTMx9TMh10QDLqh
 sO/dZqSUNm/RFigMsCMe7uLBe7lxCc1r8te1hwPdWFdpbRbpFLhTjXRh2wV3QT+CqInuSCMt73MC+
 LQ9EJmCpMQDrtmGcs/PLnhkf611twxngQHGDpfCTmXelN3SPk19AZaKr/25lVqBNov+iyxa9CIA54
 4iMteIEA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZU2f-00DSue-Nl
 for linux-arm-kernel@lists.infradead.org; Thu, 22 Apr 2021 07:46:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1200F6145A;
 Thu, 22 Apr 2021 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619077588;
 bh=FcUdqMuC8KKZgy8ctbdx6jxvSoxE1r7Gn97aaxBoKuQ=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=FL+zIb6RGN/HUKyzE+6QyPWvK3ChNhpkxvGEv1VV904Olu6ZNwytYrwH5xFr3pw6a
 BKc28DQ4WFSKScJpRTZPTxGY/J4sJAG2513y9nVYohu0xz3JH8kNGMssyCWRYxj9C4
 bMbvi73N7m5ZGWwVPhMWrHlRZaDcp/X8UOU1q5AEmQQXqgWI3mu6tBfty13mjrrPdQ
 STov2NvU+xjr8pLJuV9IX7/DrexPpnMEQ9iSXcI6iwg9faXj8HVYrutZfKL5nU0Eng
 3fRKG+glhMqO23HBVLs0tlNlZ3r+NHpS9S19L0yCHDiwLEUy/vYYvanOkEgqSMnlLW
 FUbTG2e++Bt1g==
Date: Thu, 22 Apr 2021 09:46:26 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Fixes for 5.12, Take 2
Message-ID: <45fc5e4d-ef48-4729-a869-79a8f288bb83.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_004629_832064_AD868BF4 
X-CRM114-Status: GOOD (  10.64  )
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
Content-Type: multipart/mixed; boundary="===============0845931689570352558=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210422074626.5VPEwwVCx6yW_tWZwq8Ary0ui3Wc9RYznJvaZ-Exlck@z>


--===============0845931689570352558==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ipD16zsVR+YD7JtW"
Content-Disposition: inline


--ipD16zsVR+YD7JtW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Here's a late fix for 5.12.

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit 7a2f6e69e9c1060a7a09c1f8322ccb8d942b3078:

  arm64: dts: allwinner: h6: beelink-gs1: Remove ext. 32 kHz osc reference (2021-04-07 13:41:47 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.12-2

for you to fetch changes up to 4d09ccc4a81e7de6b002482af554d8b5626f5041:

  arm64: dts: allwinner: Revert SD card CD GPIO for Pine64-LTS (2021-04-22 09:43:15 +0200)

----------------------------------------------------------------
One fix for the MMC card detect on the Pine H64 board

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: Revert SD card CD GPIO for Pine64-LTS


 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



--ipD16zsVR+YD7JtW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYIEp0QAKCRDj7w1vZxhR
xRVBAPwJo8aDYgHueY2UYhIDNcJoWvFtxyWWucxJoQQDXgvBxAD/V2iELZiOvi7u
Sn+BzLrrqSx7/1ZUxOVPteFLlDX9FwM=
=W1Fu
-----END PGP SIGNATURE-----

--ipD16zsVR+YD7JtW--


--===============0845931689570352558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0845931689570352558==--

