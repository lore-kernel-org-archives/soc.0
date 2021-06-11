Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E02BC48BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 14:57:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9745613B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 14:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9745613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=xUfmpazK6sim2RvSLeGO3VmOEKhwuBGLQcISvS9W1uc=; b=qm0
	gwUxE0maN0QolIbNP+bIsO8yVNm5abhXhl4jjjyBAas4a/WBqvoYxY5yk+A15T+PqLyFOxwueiZe/
	AjDmltWG8lhaDPKQCGl7C82a3F5qph921B+rVVSMk/JynEMVi2sv660NkQdcYYssgvxvY7nyMxaxB
	J/l6Vgr53h/iJyjxWmM0ebLDdL43LjeixTnBFN4aUSrvsGrIwVWcZ3L4H+pszhAOYstVW9+b4W6HC
	b2iuUQuNzEPY6N3CNdkaG5K7DWfcW4AphdgJRO1Fuoecw4Ho0QmrCHuGYsxuK2xYuE/SOm+QBE/VF
	Zjsh5ocH9AnDXn9hUrBeiZmvVMDMeeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lriZj-005jLG-1N; Fri, 11 Jun 2021 14:55:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lriZf-005jKE-GN
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 14:55:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE3BC60200;
 Fri, 11 Jun 2021 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623423355;
 bh=w/BG8YY3jV6/GlxIobZ63Z5fE/8mHTGyBhH25xHGwj8=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=QZhjhvoGArMOy7qS3fi/xFRfkciJLVE8AN/sCKVlkD4OcxRdFiwbHNmaHggtwry1R
 aJrPKTqbBfkWqOnwKL81OltzwOX2qpd965MjpkpDGreBaRS9y/GvQ2BsCMr8n6GyYL
 uy9xRjL+X+JsUxc0XaHCK/MNUiYn5QlSSraWy48QZ7G9TWCvIe1Wj7+hMxhmwzgUxX
 VrwtF3Fm4gaKRpXZoHepcsu5zUvoEBPFwFPXhvEtkrAL5QerMB2GFVO4GKYfggLJYD
 8sU4AEFVBzdsU1UvtFBKcynz+V8SmQBQEOqfwwd1h2I7Lc7IsdBuP4sjR8YoSCpLV4
 dNJSY//5sVesQ==
Date: Fri, 11 Jun 2021 16:55:53 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Platform Changes for 5.14
Message-ID: <bf3431f6-2196-425c-9b43-0bf4de0b6d30.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_075555_596703_FEE8494F 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4375123606110472543=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210611145553._bInDYcfIm-0ouHIZFbW9oNHBMOWrkRyo3YNYecuqmo@z>


--===============4375123606110472543==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DwZuxS5b5A0Qc9+5"
Content-Disposition: inline


--DwZuxS5b5A0Qc9+5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-core-for-5.14-1

for you to fetch changes up to cbccad664927e98db0f12adb7434fdfe51d3073a:

  arm64: sunxi: Build the sun4i timer driver (2021-05-10 09:15:09 +0200)

----------------------------------------------------------------
One patch to select one of our timer in the arm64 Kconfig option.

----------------------------------------------------------------
Samuel Holland (1):
      arm64: sunxi: Build the sun4i timer driver


 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)



--DwZuxS5b5A0Qc9+5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMN5eQAKCRDj7w1vZxhR
xd6jAQDbl7BSRmL174s2Qk1CxnZVVZac8/jWZssuvMSSyyp1xQEA8uJNRquAY6FT
7C/eiWK7xrZinzbfYoe1sV0xpoAHogY=
=+rTJ
-----END PGP SIGNATURE-----

--DwZuxS5b5A0Qc9+5--


--===============4375123606110472543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4375123606110472543==--

