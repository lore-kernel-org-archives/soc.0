Return-Path: <SRS0=UpmX=PG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D794FC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 08:03:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4E0861076
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 08:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4E0861076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZbNT00u2eXFX3TxD00jJgPaNJ1o5SRUL8EOkxI7tbFk=; b=ao/
	U9wQcePFvD1mAsLhc3UwfIpC3u7KjHs5+61mrsqAAk5PNnXEU4jp3PMdFdaW2zbHGNvf6dNCShmjS
	B9+MzCtNqqki+DrPSD8NvmgbwWHkRtybqqlt8ErbHZx4vaRYNT+S8mrMeTD8+HmLPQ2Ht5ulrQxs8
	OURXwlbqDq8KgvQGuc6YwOO0mJq0jm0jbmzImC+bPbfPM7PtXccpXQfu2A33icFTTHAm/M8+/dJMB
	SCoUJGxXRrP37pF/FTlL9xvUShiod9RWKQqMUkLD1NeodOQpe+AbPZb3rhAe15j9JiiEbz6dpB9oT
	hunuCCb/VasUQmUHN8EwmUyYSwonvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcNax-00EY5Z-RD; Mon, 18 Oct 2021 08:02:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcNau-00EY4r-57
 for linux-arm-kernel@lists.infradead.org; Mon, 18 Oct 2021 08:02:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FB6D610C7;
 Mon, 18 Oct 2021 08:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634544123;
 bh=AvLNrPDnBptHpt5KfRV1jAK/+wjfKKr0GVw4Qdgq0aw=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=GWtrfWMlVm8+FFVPULJUwlOtSyEUkAwG8EMjrpdVuA8dBrrzY2WQjAywF/skt9TN+
 oYKLdoDsDoZf/R/JneVAmjOyd6+gyWQ8wMsmVt/VLV4a7qKFskfHa67ycDDjzOW7tz
 BVWaIwpdczxEbUQ0ymPyAOKpXa1ZsOCze8zwdHyWU3S6ekz8t/vq8ZwFY9RK8Xw/hT
 Vs5jRMFYJGbr/+C/hT0wm3dNzMnQswllJeCXltMXpXNHNSzp//XhcjLePSMbwodbhx
 afbHQWEc/D6OZBUnXCs9eVmRXlh7i9WxbfaF4hcXNLnd0qMC+pwOVtPQEpWcD9Gz9G
 5mM18aoy958Ig==
Date: Mon, 18 Oct 2021 10:02:01 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Drivers Changes for 5.16
Message-ID: <ad0aa469-9e1b-4bb6-a116-92648ed774fa.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_010204_243582_74BD723C 
X-CRM114-Status: UNSURE (   9.29  )
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
Content-Type: multipart/mixed; boundary="===============2559531072150304945=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211018080201.czmNugZZWK4p4sqOa6rkJo-o0VOflscpBqt0fG4rGyw@z>


--===============2559531072150304945==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WfXQXILWtMqAGP2e"
Content-Disposition: inline


--WfXQXILWtMqAGP2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-drivers-for-5.16-1

for you to fetch changes up to 50ac48ae3e80359a475216de8c3b0ec12374fa66:

  bus: sun50i-de2: Adjust printing error message (2021-10-13 14:48:48 +0200)

----------------------------------------------------------------
Some new drivers changes for the Allwinner SoCs, converting to a helper
and improving logging.

----------------------------------------------------------------
Cai Huoqing (1):
      soc: sunxi_sram: Make use of the helper function devm_platform_ioremap_resource()

Jernej Skrabec (1):
      bus: sun50i-de2: Adjust printing error message


 drivers/bus/sun50i-de2.c       | 7 +++----
 drivers/soc/sunxi/sunxi_sram.c | 4 +---
 2 files changed, 4 insertions(+), 7 deletions(-)



--WfXQXILWtMqAGP2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW0p+QAKCRDj7w1vZxhR
xU3gAQC16OPLctLQl2toe9hzer/GO5+K7mLkO1s+ro9OobQzSAD/TnUwDP/XP0hn
N5fQFwHnAXnJ6ioOQ2Ui06OWfIolkwI=
=DO6y
-----END PGP SIGNATURE-----

--WfXQXILWtMqAGP2e--


--===============2559531072150304945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2559531072150304945==--

